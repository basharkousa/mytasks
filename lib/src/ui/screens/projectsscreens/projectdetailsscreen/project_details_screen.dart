import 'package:appflowy_board/appflowy_board.dart';
import 'package:get/get.dart';
import 'package:mytasks/src/configs/colors.dart';
import 'package:mytasks/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectdetailsscreen/project_details_controller.dart';
import 'package:mytasks/src/ui/widgets/appbars/app_bar_default.dart';
import 'package:mytasks/src/ui/widgets/common/getx_state_widget.dart';

class ProjectDetailsScreen extends GetWidget<ProjectDetailsController> {
  static const String route = "/ProjectDetailsScreen";

  ProjectDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: AppBarDefault(
          title: "${controller.project.name}",
        ),
        body: Container(
          margin: EdgeInsetsDirectional.only(
              start: Dimens.mainMargin, end: Dimens.mainMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // SizedBox(height: 16.h,),
              Expanded(
                child: Container(
                  // height: Get.height/2,
                  child: buildProjectSectionsWidgetState(),
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: buildUpdateButton(context),
      ),
    );
  }

  buildProjectSectionsWidgetState() {
    return GetXStateWidget(snapshotLiveData: controller.sectionsResponseLiveData,
      contentWidget: (data){
      return AppFlowyBoard(
        controller: controller.appFlowyController,
        config: AppFlowyBoardConfig(
            groupBodyPadding: EdgeInsets.all(0.0),
            groupHeaderPadding: EdgeInsets.all(4.h)),
        headerBuilder: (context, group){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(child: Text(group.id,style: TextStyle(color: getSectionColor(group)),),),
          );
        },
        footerBuilder: (context, group){
          return Container(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Add new Task"),
          ),);
        },
        cardBuilder: (context, group, groupItem) {
          final textItem = groupItem as TaskItemFlowy;
          return AppFlowyGroupCard(
            key: ObjectKey(textItem),
            child: Container(
                width: Get.width/2,
                // child: Text(textItem.taskModel.content??"content")),
                child: Text(textItem.taskModel.content??"content")),
          );
        },
        groupConstraints: BoxConstraints.expand(width: Get.width*0.40),

      );
    },
      onRetryClicked: (){
       controller.getSections();
      },
    );
  }

  getSectionColor(AppFlowyGroupData<dynamic> group) {
    switch(group.id){
      case "Todo":
        return Colors.blue;
      case "InProgress":
        return Colors.amberAccent;
      case "Completed":
        return Colors.green;
      default:
        return Colors.black;
    }
  }


}
