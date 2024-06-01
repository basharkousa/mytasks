import 'package:flutter/material.dart';

extension OnPressed on Widget {
  Widget ripple(Function onPressed,
          {BorderRadiusGeometry borderRadius =
              const BorderRadius.all(Radius.circular(5))}) =>
      Stack(
        children: <Widget>[
          this,
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius:
                              borderRadius ?? BorderRadius.circular(4.0))),
                  // backgroundColor:
                  //     MaterialStateProperty.all<Color>(Colors.black),
                  // foregroundColor:
                  //     MaterialStateProperty.all<Color>(Colors.black),
                  overlayColor: MaterialStateProperty.all<Color>(
                      Colors.white.withOpacity(0.5)),
                ),
                onPressed: () {
                  onPressed();
                },
                child: Container()),
          )
        ],
      );
}
// Add this line at end of any widget to handle click and show ripple effect.
//.ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(8)))
