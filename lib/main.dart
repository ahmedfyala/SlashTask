import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slash_task/view/product_details.dart';
import 'package:slash_task/view/widget/product_screen.dart';
import 'core/utilis/service locator/service_locator.dart';
import 'fetures/products/data/repos/product_repo_impl.dart';
import 'fetures/products/ui/manager/product_cubit/products_cubit.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ProductsCubit(sl<ProductRepoimpl>())..fetchProducts();
      },
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: ProductScreen.routeName,
          routes: {
            ProductDetails.routeName: (_) => ProductDetails(),
            ProductScreen.routeName: (_) => ProductScreen(),
          },
        ),
      ),
    );
  }
}
