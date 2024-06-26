import 'package:get/get.dart';
import 'package:mytasks/generated/assets.gen.dart';
import 'package:mytasks/generated/locales.g.dart';
import 'package:mytasks/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/edittaskscreen/edit_task_controller.dart';
import 'package:mytasks/src/ui/widgets/appbars/app_bar_default.dart';
import 'package:mytasks/src/ui/widgets/buttons/button_default.dart';
import 'package:mytasks/src/ui/widgets/common/default_textfield_widget.dart';
import 'package:mytasks/src/ui/widgets/common/extentions.dart';
import 'package:mytasks/src/ui/widgets/common/getx_state_widget.dart';
import 'package:mytasks/src/ui/widgets/common/loading_widget.dart';
import 'package:mytasks/src/utils/basic_tools.dart';

class EditTaskScreen extends GetWidget<EditTaskController> {
  static const String route = "/EditTaskScreen";

  EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarDefault(
          title: "${LocaleKeys.edit.tr} ${controller.taskModel.content}",
        ),
        body: Container(
          margin: EdgeInsetsDirectional.only(
              start: Dimens.mainMargin, end: Dimens.mainMargin),
          child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 16.h,),
                  buildAddTaskFormWidget(context),
                  SizedBox(height: 16.h,),
                  buildAddButtonWidgetState(context),
                  SizedBox(
                    height: 48.h,
                  ),
                ],
              )),
        ),
        // bottomNavigationBar: buildAddButtonWidgetState(context),
      ),
    );
  }

  buildAddTaskFormWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 16.w),
      child: Form(
        key: controller.form,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24.h),
            buildTaskFieldTitle(context),
            SizedBox(height: 24.h),
            buildDueDateTextField(context),
            SizedBox(height: 24.h),
            buildTaskDescriptionTextField(context),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }


  Widget buildTaskFieldTitle(BuildContext context) {
    return DefaultTextField(
      controller: controller.taskTitleEditingController,
      textValidType: TextValidType.GENERAL,
      onSaved: (value) => controller.taskForm.content = value.toString(),
      // initialValue: controller.user.value.email,
      onFieldSubmitted: (_) {
        // FocusScope.of(context).requestFocus(controller.phoneFocusNode);
      },
      hintText: LocaleKeys.enter_task_title.tr,
      enabled: true,
      title: LocaleKeys.task_title.tr,
      // isObscure: true,
      prefixIcon: Assets.icons.svg.icMessageTitle
          .svg(height: 10.h, width: 10.w, color: const Color(0xffA6A6A6)),
      // suffixIcon: Icon(
      //   Icons.keyboard_arrow_down,
      //   color: Color(0xffA6A6A6),
      // ),
      textInputAction: TextInputAction.next,
      isRequired: true,
    );
  }
  Widget buildDueDateTextField(BuildContext context) {
    return DefaultTextField(
      controller: controller.dueDateEditingController,
      textValidType: TextValidType.NONE,
      onSaved: (value) => controller.taskForm.dueDate = value,
      // initialValue: controller.user.value.email,
      onFieldSubmitted: (_) {
        // FocusScope.of(context).requestFocus(controller.phoneFocusNode);
      },
      // initialValue: controller.user.value.password,
      onTap: () async{
        final datePick = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100));
        if (datePick != null) {
          controller.taskForm.dueDate =
          "${datePick.year}-${datePick.month < 10?0:""}${datePick.month}-${datePick.day < 10?0:""}${datePick.day}";
          print("selectedDate: ${"${datePick.year}-${datePick.month}-${datePick.day}"}");
          // isDateSelected=true;
          // put it here
          controller.dueDateEditingController.text =
          controller.taskForm.dueDate!; // 08/14/2019

        }
      },
      // focusNode: controller.phoneFocusNode,
      hintText: LocaleKeys.task_due_date_desc.tr,
      enabled: true,
      readOnly: true,
      title: LocaleKeys.task_due_date_title.tr,
      // isObscure: true,
      prefixIcon: Assets.icons.svg.icCalendar.svg(height: 10.h, width: 10.w),
      suffixIcon: Icon(
        Icons.keyboard_arrow_down,
        color: Color(0xffA6A6A6),
      ),
      textInputAction: TextInputAction.next,
      isRequired: false,
    );
  }
  Widget buildTaskDescriptionTextField(BuildContext context) {
    return DefaultTextField(
      controller: controller.taskDescriptionEditingController,
      textValidType: TextValidType.GENERAL,
      keyboardType: TextInputType.multiline,
      maxLines: 6,
      contentPadding:
      EdgeInsets.symmetric(vertical: 16.0.h, horizontal: 16.0.h),
      onSaved: (value) =>
      controller.taskForm.description = value.toString(),
      // initialValue: controller.user.value.email,
      onFieldSubmitted: (_) {
        // FocusScope.of(context).requestFocus(controller.phoneFocusNode);
      },
      // initialValue: controller.user.value.password,
      focusNode: controller.descriptionFocusNode,
      onTapOutside: (pointerDownEvent) {
        print("onTapOutside");
        controller.descriptionFocusNode.unfocus();
      },
      hintText: LocaleKeys.enter_task_desc.tr,
      enabled: true,
      title: LocaleKeys.task_desc.tr,
      // isObscure: true,
      prefixIcon: Assets.icons.svg.icMessageDescription
          .svg(height: 10.h, width: 10.w, color: Color(0xffA6A6A6)),
      textInputAction: TextInputAction.next,
      isRequired: true,
    );
  }

  Widget buildAddButtonWidgetState(BuildContext context) {
    return GetXStateWidget(
      snapshotLiveData: controller.updateTaskResponseLiveData,
      loadingWidget: LoadingWidget(),
      contentWidget: (data) {
        return buildAddButtonSubmit(context);
      },
      errorWidget: buildAddButtonSubmit(context),
    );
  }

  Widget buildAddButtonSubmit(BuildContext context) {
    return ButtonDefault(
      textColor: Colors.white,
      title: LocaleKeys.edit.tr,
    ).onClickBounce(() {
      _onAddButtonSubmit(context);
    });
  }

  void _onAddButtonSubmit(BuildContext context) {
    final form = controller.form.currentState;
    if (form!.validate()) {
      form.save();
      BasicTools.hideKeyboard(context);
      controller.postTask();
    } else {}
  }
}
