import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//todo : here an item list

class ItemBrand extends StatelessWidget {

  // final BrandModel? brand;

  // const CardBrand({super.key, this.brand});
  const ItemBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {print("Brand")},
      child: SizedBox(
        width: 84.0,
        height: 64.0,
        child: Column(
          children: <Widget>[
         /*   Container(
              width: 64.0,
              height: 64.0,
              margin: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColors.lightGrey,
                child: CachedNetworkImage(
                  imageUrl: brand!.image_url ?? "",
                  placeholder: (context, url) => const LoadingImageWidget(),
                  errorWidget: (context, url, error) =>
                      const ErrorImageWidget(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4.0, end: 4.0),
              child: Text(
                brand!.name!,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xff484848),
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
