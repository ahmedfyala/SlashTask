import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/view/product_details.dart';
import 'package:slash_task/view/widget/loading_widget.dart';

import '../core/app_assets.dart';
import '../core/app_color.dart';
import '../fetures/products/data/models/product.dart';

class ProductWidget extends StatelessWidget {
  static const String routeName = "pw";
  final Product product;

  const ProductWidget({required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName,
            arguments: product
        );
      },
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: product.productVariations[0]
                            .productVariantImages[0].imagePath,
                        placeholder: (context, url) => LoadingWidget(),
                        errorWidget: (context, url, error) =>
                            Icon(Icons.error),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 180.h,
                      ),
                    ),
                    Positioned(
                      top: 3.h,
                      right: 3.w,
                      child: InkWell(
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: ShapeDecoration(
                            color: AppColors.whiteColor,
                            shape: const OvalBorder(),
                          ),
                          child: Center(
                            child: ImageIcon(
                              AssetImage(AppAssets.iconFav),
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              constraints:
                                  BoxConstraints(maxWidth: 100, maxHeight: 30),
                              child: Text(
                                product.name ?? "",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.whiteColor),
                              ),
                            ),
                            Spacer(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(35),
                              child: CachedNetworkImage(
                                imageUrl: product.brand.brandLogoImagePath,
                                placeholder: (context, url) => LoadingWidget(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                height: 33.h,
                                width: 33.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'EGP ${product.productVariations[0].price.toStringAsFixed(0)}',
                              style: TextStyle(fontSize: 14,color:  AppColors.whiteColor),
                            ),
                            Spacer(),
                            Icon(
                              Icons.add_shopping_cart_rounded,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),

                      ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
