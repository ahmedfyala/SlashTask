import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash_task/core/app_color.dart';
import '../../fetures/products/ui/manager/product_cubit/products_cubit.dart';
import '../products_widget.dart';
import 'custom_error_widget.dart';
import 'loading_widget.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = "productview";
  ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("slash.",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, state) {
                if (state is ProductsSuccess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 16,
                          crossAxisCount: 2,
                          childAspectRatio: (2 / 3),
                          mainAxisSpacing: 8,
                        ),
                        shrinkWrap: true,
                        itemCount: state.products.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => ProductWidget(
                              product: state.products[index],
                            )),
                  );
                } else if (state is ProductsFailure) {
                  return CustomErrorWidget(errorMessage: state.errMessage);
                }
                return LoadingWidget();
              },
            ),
          ),
        ],
      ),
    );
  }
}
