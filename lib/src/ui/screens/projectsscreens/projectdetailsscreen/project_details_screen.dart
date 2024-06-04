import 'package:appflowy_board/appflowy_board.dart';
import 'package:get/get.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:mytasks/src/configs/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/src/ui/screens/projectsscreens/projectdetailsscreen/project_details_controller.dart';
import 'package:mytasks/src/ui/widgets/appbars/app_bar_default.dart';
import 'package:mytasks/src/ui/widgets/common/extentions.dart';
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
              start: 4.w, end: 4.w),
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
            boardCornerRadius: 10.r,
            groupCornerRadius: 16.r,
            groupBackgroundColor: Colors.white,
            groupBodyPadding: EdgeInsets.all(2.0.h),
            groupMargin: EdgeInsets.all(4.0.h),
            groupHeaderPadding: EdgeInsets.all(4.h)),
        headerBuilder: (context, group){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(group.headerData.groupName,style: TextStyle(color: getSectionColor(group),fontWeight: FontWeight.w700),),),
          );
        },
        footerBuilder: (context, group){
          return Container(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Divider(color: Colors.black12,),
                Row(children: [
                  Icon(Icons.add,size: 16.h,),
                  SizedBox(width: 10.w,),
                  Text("NEW")
                ],),
                SizedBox(height: 16.h,)
              ],
            ),
          ),).onClickBounce((){

          });
        },
        cardBuilder: (context, group, groupItem) {
          final textItem = groupItem as TaskItemFlowy;
          return AppFlowyGroupCard(
            key: ObjectKey(textItem),
            child: Container(
                width: Get.width/2,
                padding: EdgeInsets.only(left:4.w),
                decoration: ShapeDecoration(
                  color: getSectionColor(group),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: Color(0x99E6E6E6)),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child:Container(

                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8.r),bottomRight:  Radius.circular(8.r)),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal:4.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Expanded(
                          child: Text(textItem.taskModel.content??"content",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12.sp),),
                        ),
                        // Expanded(child: Container()),
                        Icon(Icons.keyboard_control_outlined,size: 18.w,color: Colors.black38,)
                      ],),
                      SizedBox(height: 8.h,),
                      Text(textItem.taskModel.description??"content"),
                      SizedBox(height: 8.h,),
                    ],),
                )),
            // margin: EdgeInsets.all(4.w),
          );
        },
        groupConstraints: BoxConstraints.expand(width: Get.width*0.46),

      );
    },
      onRetryClicked: (){
       controller.getSections();
      },
    );
  }

  getSectionColor(AppFlowyGroupData<dynamic> group) {
    switch(group.headerData.groupName){
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
