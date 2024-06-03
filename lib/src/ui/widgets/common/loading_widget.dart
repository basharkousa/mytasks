import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mytasks/src/configs/colors.dart';

class LoadingWidget extends StatelessWidget {
  final String? loadingMessage;

  const LoadingWidget({Key? key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          /*Text(
            loadingMessage??" Loading ..",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black45,
              fontSize: 12,
            ),
          ),*/
          SizedBox(height: 24.h),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.lightAccent),
          ),
        ],
      ),
    );
  }
}
