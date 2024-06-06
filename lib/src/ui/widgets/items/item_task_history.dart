import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mytasks/generated/assets.gen.dart';
import 'package:mytasks/generated/locales.g.dart';
import 'package:mytasks/src/data/models/tasksmodels/tasksresponse/task_model.dart';
import 'package:mytasks/src/utils/helper/date_helper.dart';

class ItemTaskHistory extends StatelessWidget {
  final TaskModel? task;
  final Function(TaskModel) onClick;

  const ItemTaskHistory({super.key, required this.task, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsetsDirectional.all(16.w),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50.w, color: Color(0x99E6E6E6)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x14366F7A),
            blurRadius: 24.r,
            offset: Offset(4, 8),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 56.h,
            width: 56.h,
            margin: EdgeInsetsDirectional.only(top: 6.h, start: 1.w),
            child: ClipRRect(
              borderRadius:
              const BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
              child: CachedNetworkImage(
                imageUrl: "user avatar link ",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Container(
                      child: Center(
                        child: Assets.icons.svg.icCheckboxInternet
                            .svg(width: 50.w, height: 50.h,colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn)),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  task?.content ?? "",
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF151515),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  task?.description ?? "",
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF151515),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(children: [
                  Text(
                    LocaleKeys.spent_time.tr,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                   DateHelper.formatSpentTime(task?.spentTime),
                   //  task?.spentTime??'0',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  DateHelper.timeAgo(dateStr: task?.createdAt),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black12,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemProjectShimmer extends StatelessWidget {
  const ItemProjectShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsetsDirectional.all(16.w),
      decoration: ShapeDecoration(
        // color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50.w, color: Color(0x99E6E6E6)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x14366F7A),
            blurRadius: 24.r,
            offset: Offset(4, 8),
            spreadRadius: 0,
          )
        ],
      ),

      // height: 64.0.h,
      child: Row(
        children: [
          Column(
            children: <Widget>[
              Text(
                "projec",
                textAlign: TextAlign.start,
                style: TextStyle(
                  backgroundColor: Colors.black,
                  color: Color(0xFF151515),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_right,
            size: 24.w,
            color: Color(0xffA6A6A6),
          )
        ],
      ),
    );
  }
}

class ItemTaskHistoryShimmer extends StatelessWidget {
  const ItemTaskHistoryShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsetsDirectional.all(16.w),
      decoration: ShapeDecoration(
        // color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.50.w, color: Color(0x99E6E6E6)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x14366F7A),
            blurRadius: 24.r,
            offset: Offset(4, 8),
            spreadRadius: 0,
          )
        ],
      ),

      // height: 64.0.h,
      child: Row(
        children: [
          CircleAvatar(),
          SizedBox(
            width: 10.w,
          ),
          Column(
            children: <Widget>[
              Text(
                "projec",
                textAlign: TextAlign.start,
                style: TextStyle(
                  backgroundColor: Colors.black,
                  color: Color(0xFF151515),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "projec",
                textAlign: TextAlign.start,
                style: TextStyle(
                  backgroundColor: Colors.black,
                  color: Color(0xFF151515),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
