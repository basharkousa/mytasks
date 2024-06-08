import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/generated/assets.gen.dart';
import 'package:mytasks/src/data/models/commentsmodels/commentsresponse/comment_model.dart';
import 'package:mytasks/src/utils/helper/date_helper.dart';

class ItemComment extends StatelessWidget {
  final CommentModel? comment;
  final Function(CommentModel) onClick;

  const ItemComment({super.key, required this.comment, required this.onClick});

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
                imageUrl: "user avtar link ",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) {
                  return CircleAvatar(
                    child: Container(
                      child: Center(
                        child: Assets.icons.svg.icDefaultPerson
                            .svg(width: 56.w, height: 56.h),
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
                  comment?.content ?? "",
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    // color: Color(0xFF151515),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  DateHelper.timeAgo(dateStr: comment?.postedAt),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0x99E6E6E6),
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
    //     .onClickBounce(() {
    //   onClick(comment!);
    // });
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

class ItemCommentShimmer extends StatelessWidget {
  const ItemCommentShimmer({
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
