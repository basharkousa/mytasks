import 'package:get/get.dart';
import 'package:mytasks/generated/assets.gen.dart';
import 'package:mytasks/generated/locales.g.dart';
import 'package:mytasks/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comments_response.dart';
import 'package:mytasks/src/ui/screens/tasksscreens/commentsscreen/comments_controller.dart';
import 'package:mytasks/src/ui/widgets/appbars/app_bar_default.dart';
import 'package:mytasks/src/ui/widgets/common/default_textfield_widget.dart';
import 'package:mytasks/src/ui/widgets/common/getx_state_widget.dart';
import 'package:mytasks/src/ui/widgets/common/loading_widget.dart';
import 'package:mytasks/src/ui/widgets/items/item_comment.dart';
import 'package:mytasks/src/utils/basic_tools.dart';
import 'package:shimmer/shimmer.dart';

class CommentsScreen extends GetWidget<CommentsController> {
  static const String route = "/CommentsScreen";

  CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarDefault(
          title: LocaleKeys.comments.tr,
        ),
        body: Column(children: [
          Expanded(child:Container(
            margin: EdgeInsetsDirectional.only(
                start: Dimens.mainMargin, end: Dimens.mainMargin),
            child: RefreshIndicator(
              onRefresh: controller.onRefresh,
              color: Get.theme.colorScheme.secondary,
              child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(height: 16.h,),
                      GetXStateWidget(
                        snapshotLiveData: controller.commentsResponseLiveData,
                        loadingWidget: buildLoadingCommentsWidget(),
                        contentWidget: (data) {
                          return buildCommentsWidget(data!);
                        },
                        onRetryClicked: (){
                          controller.getComments();
                        },
                      ),
                      SizedBox(
                        height: 48.h,
                      ),

                    ],
                  )),
            ),
          )),
          buildAddCommentBarWidget(context)
        ],),
      ),
    );
  }

  Widget buildCommentsWidget(CommentsResponse data) {
    if(data.comments?.isEmpty??true){
      return Container(
          height: Get.width,
          child: Container(
              decoration: ShapeDecoration(
                // color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0.50.w, color: Color(0x99E6E6E6)),
                  borderRadius: BorderRadius.circular(16.r),
                ),),
              child: Center(child: Text(LocaleKeys.no_comments.tr),)));
    }
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ItemComment(comment: data.comments?[index],onClick: (comment){
          },);
        },
        separatorBuilder: (context, index) {
          return Container(
            height: 10.h,
          );
        },
        itemCount: data.comments?.length ?? 0);
  }

  Widget buildLoadingCommentsWidget() {
    return Shimmer.fromColors(
      baseColor: Get.isDarkMode ? Colors.white12 : Colors.grey[300]!,
      highlightColor:
      Get.isDarkMode ? Colors.white12.withOpacity(0.5) : Colors.grey[100]!,
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ItemCommentShimmer();
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 10.h,
            );
          },
          itemCount: 4),
    );

  }

  Widget buildCommentFieldTitle(BuildContext context) {
    return Form(
      key: controller.form,
      child: Container(
        padding: EdgeInsetsDirectional.only(start: Dimens.mainMargin,end: Dimens.mainMargin,bottom: Dimens.mainMargin),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Expanded(child: DefaultTextField(
            controller: controller.taskCommentEditingController,
            textValidType: TextValidType.GENERAL,
            onSaved: (value) => controller.commentForm.content = value.toString(),
            // initialValue: controller.user.value.email,
            onFieldSubmitted: (_) {
              // FocusScope.of(context).requestFocus(controller.phoneFocusNode);
            },
            hintText: LocaleKeys.add_comment.tr,
            enabled: true,
            title: "",
            // isObscure: true,
            prefixIcon: Assets.icons.svg.icMessageTitle
                .svg(height: 10.h, width: 10.w, color: const Color(0xffA6A6A6)),
            suffixIcon: GetXStateWidget(
              snapshotLiveData: controller.postCommentsResponseLiveData,
            loadingWidget: SizedBox(width: 4.w,height:4.w,child:LoadingWidget(),),
            contentWidget: (data){

              return InkWell(
                onTap: (){
                  _onAddCommentSubmit(context);
                },
                child: Icon(
                  Icons.send,
                  color: Get.theme.colorScheme.secondary,
                ),
              );
            },
            errorWidget: InkWell(
              onTap: (){
                _onAddCommentSubmit(context);
              },
              child: Icon(
                Icons.send,
                color: Get.theme.colorScheme.secondary,
              ),
            ),
            ),
            textInputAction: TextInputAction.next,
            isRequired: false,
          )),
        ],),
      ),
    );
  }

  buildAddCommentBarWidget(BuildContext context) {
    return buildCommentFieldTitle(context);
  }


  void _onAddCommentSubmit(BuildContext context) {
    final form = controller.form.currentState;
    if (form!.validate()) {
      form.save();
      BasicTools.hideKeyboard(context);
      controller.postComment();
    } else {}
  }
}
