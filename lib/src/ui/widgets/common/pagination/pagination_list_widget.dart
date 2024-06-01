import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/models/api_response.dart';

class PaginationListWidget<T, M> extends StatelessWidget {
  final List<M>? itemsList;
  final Function()? onRetryClick;
  final Function(M itemModel)? onClick;
  final Widget? loadingWidget;
  final ScrollController? scrollController;
  final IndexedWidgetBuilder? itemBuilder;
  final Rx<ApiResponse<T>>? paginationLiveData;

  const PaginationListWidget(
      {Key? key,
        this.itemsList,
        this.scrollController,
        this.onClick,
        this.loadingWidget,
        @required this.paginationLiveData,
        @required this.itemBuilder,
        this.onRetryClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemsList!.length,
          itemBuilder: itemBuilder!,
        ),
        Obx(() {
          switch (paginationLiveData!.value.status) {
            case Status.LOADING:
              return loadingWidget ?? const Padding(
                padding: EdgeInsets.all(12.0),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                ),
              );
            case Status.COMPLETED:
              return Container(
                height: 12,
              );
            case Status.ERROR:
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: InkWell(
                  onTap: () {
                    onRetryClick!();
                  },
                  child: const Icon(
                    Icons.refresh,
                    size: 30,
                  ),
                ),
              );
              break;
          }
                  return const Padding(
            padding: EdgeInsets.all(12.0),
            child: SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
          );
        }),
      ],
    );
  }
}
