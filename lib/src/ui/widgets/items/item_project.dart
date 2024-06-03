import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/src/data/models/projectsmodels/project_model.dart';
import 'package:mytasks/src/ui/widgets/common/extentions.dart';

class ItemProject extends StatelessWidget {

  final ProjectModel? project;
  final Function(ProjectModel) onClick;

  const ItemProject({super.key, required this.project,required this.onClick});

  @override
  Widget build(BuildContext context){
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.h,),
                Text(
                  project?.name??"",
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF151515),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_right,size: 24.w,color: Color(0xffA6A6A6),)
        ],
      ),
    ).onClickBounce((){
      onClick(project!);
    });
  }
}

class ItemProjectShimmer extends StatelessWidget {

  const ItemProjectShimmer({super.key,});

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
              SizedBox(height: 10.h,),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_right,size: 24.w,color: Color(0xffA6A6A6),)
        ],
      ),
    );
  }
}

