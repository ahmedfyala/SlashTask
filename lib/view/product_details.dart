import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:accordion/controllers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/core/app_color.dart';
import 'package:slash_task/view/widget/loading_widget.dart';
import '../core/utilis/service locator/service_locator.dart';
import '../fetures/products/data/models/product.dart';
import '../fetures/products/data/repos/product_repo_impl.dart';
import '../fetures/products/ui/manager/product_cubit/products_cubit.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName = "pd";


  ProductDetails({super.key,});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
 // final Variations? product;
  List<Color> colors = [Colors.blue, Colors.green, Colors.yellow, Colors.pink];
  Color selectedColor = Colors.blue;
  int index = 0;


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Product;
    return BlocProvider(
      create: (BuildContext context) {
        return ProductsCubit(sl<ProductRepoimpl>())..fetchProductsBtId(args.id);
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Product details",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 250,
                child: Swiper(
                  layout: SwiperLayout.STACK,
                  itemWidth: 300.0,
                  itemHeight: 200.0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: InkWell(
                                onTap: () {
                                  return Navigator.pop(context);
                                },
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: CachedNetworkImage(
                                        imageUrl: args
                                            .productVariations[0]
                                            .productVariantImages[index]
                                            .imagePath,
                                        placeholder: (context, url) =>
                                            const LoadingWidget(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: args.productVariations[0]
                            .productVariantImages[index].imagePath,
                        placeholder: (context, url) => const LoadingWidget(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                  autoplay: false,
                  itemCount:
                      args.productVariations[0].productVariantImages.length,
                  control: const SwiperControl(
                    color: Colors.transparent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          args.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          "EGP ${args.productVariations[0].price}",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: CachedNetworkImage(
                            imageUrl: args.brand.brandLogoImagePath,
                            placeholder: (context, url) =>
                                const LoadingWidget(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            height: 40.h,
                            width: 40.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          args.brand.brandName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    4,
                    (index) => GestureDetector(
                          onTap: () {
                            print("index $index clicked");
                            setState(() {
                              selectedColor = Color(index);
                            });
                          },
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(right: 10),
                              height: 34,
                              width: 34,
                              child: selectedColor == colors[index]
                                  ? Image.asset("assets/images/checker.png")
                                  : SizedBox(),
                              decoration: BoxDecoration(
                                  color: colors[index],
                                  borderRadius: BorderRadius.circular(17)),
                            ),
                          ),
                        )),
              ),
              const Row(
                children: [
                  Text("Select Size",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Spacer(),
                  Text("Size Chart",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
              //todo: mm...
              // DefaultTabController(
              //   length: args.productVariations.length,
              //   child: TabBar(
              //     onTap: (value) {
              //       // onClick(value){}
              //       index = value;
              //       setState(() {});
              //     },
              //     indicatorColor: Colors.transparent,
              //     isScrollable: true,
              //     tabs: ProductDetails.asMap().entries.map((e) {
              //       return SourceItem(
              //           e.name ?? "", widget.sources.indexOf(e) == index);
              //     }).toList(),
              //     padding: EdgeInsets.only(top: 8),
              //   ),
              // ),
              SizedBox(
                height: 20,
              ),
              const Text("Select Matrial",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),

              Accordion(
                  headerBackgroundColor: Colors.grey.shade800,
                  headerBorderColorOpened: Colors.transparent,
                  headerBackgroundColorOpened: Colors.grey,
                  contentBackgroundColor: Colors.white,
                  contentBorderColor: Colors.grey,
                  contentBorderWidth: 3,
                  contentHorizontalPadding: 20,
                  scaleWhenAnimating: true,
                  openAndCloseAnimation: true,
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                      isOpen: false,
                      contentVerticalPadding: 25,
                      header: const Text('Discription',
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      content: Text(args.description ?? "",
                          style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 14,
                              fontWeight: FontWeight.normal)),
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
