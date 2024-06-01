import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../configs/dimens.dart';
import '../../../data/models/api_state.dart';
import '../../widgets/common/error_widget.dart';
import 'package:shimmer/shimmer.dart';

//todo : here a section is repeated in the app and we can use it many times.

class SelectDayWidget extends StatelessWidget {

  // final Rx<ApiResponse<AvailableSlotsDesignerResponse>> availableSlotsLiveData;
  final Rx<ApiState> availableSlotsLiveData;
  // final RxList<DayInfo> currentAvailableDesignerSlots;
  final RxList currentAvailableDesignerSlots;
  final Function() onErrorPressed;
  // final Function(DayInfo) onReturnDay;
  final Function() onReturnDay;

  const SelectDayWidget({Key? key,required this.availableSlotsLiveData,required this.onErrorPressed,required this.onReturnDay,required this.currentAvailableDesignerSlots})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Obx((){
      if (!availableSlotsLiveData.value.isNull)
      {
        switch (availableSlotsLiveData.value.status) {
          case Status.LOADING:
            return const LoadingShimmerWidget();
            break;
        //carousel_slider
          case Status.COMPLETED:
            if(availableSlotsLiveData.value.data == null){
              return Container();
            }
            if(availableSlotsLiveData.value.data!.result!.isEmpty) {
              return Center(child: Container(
                margin: const EdgeInsets.all(30),
                // child: Text(Strings.noResult.tr),
              ),
              );
            }
            return buildContent();
            break;
          case Status.ERROR:
            return ErrorsWidget(
              onRetryPressed: () => {
                onErrorPressed()
              },
            );
            break;
        }
      }
      return Container();
    });

  }

  Widget buildContent() {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 4,
          ),
      /*    Container(
            //color: backgroundColor == null ? AppColors.lightGrey : backgroundColor,
              height: Dimens.card_category_height,
              margin: const EdgeInsetsDirectional.only(top: 2.0, bottom: 2.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: currentAvailableDesignerSlots.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardDay(
                    day:  currentAvailableDesignerSlots[index],
                    onClick: (day) {
                      print(day.day);
                      for (var element in currentAvailableDesignerSlots) {
                        element.isSelected!.value = false;
                      }
                      currentAvailableDesignerSlots[index].isSelected!.value = true;
                      onReturnDay(day);
                      //moveToProductDetailsPage(product);
//                    Get.toNamed(CategoryDetailsPage.categoryDetailsRoute,arguments: category);
                    },
                  );
                },
              )),*/
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class LoadingShimmerWidget extends StatelessWidget {
  final String? loadingMessage;

  const LoadingShimmerWidget({Key? key, this.loadingMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsetsDirectional.only(top: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 4,
            ),
            Container(
              //color: backgroundColor == null ? AppColors.lightGrey : backgroundColor,
              //   height: Dimens.card_category_height,
                margin: const EdgeInsetsDirectional.only(top: 2.0, bottom: 2.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return  Container(
                      margin: EdgeInsetsDirectional.only(
                          start: Dimens.main_margin, top: 4, bottom: 4,end: 2.0),
                      // height: Dimens.card_category_height,
                      // width: Dimens.card_category_width,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          width: 1.00,
                          color: const Color(0xff999999),
                        ),
                        borderRadius: BorderRadius.circular(9.00),
                      ),
                      child: const Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child:Text(
                              'da',
                              style: TextStyle(
                                fontSize: 19,
                                color: Color(0xff000000),
                                backgroundColor: Color(0xff000000),
                                fontWeight: FontWeight.w600,
                              ),
                              textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text(
                                'dayName',
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Color(0xff000000),
                                  backgroundColor: Color(0xff000000),
                                  height: 1.1818181818181819,
                                ),
                                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      )
                    );
                  },
                )),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
