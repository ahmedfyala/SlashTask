import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';
import '../../../data/models/product_variant_image.dart';
import '../../../data/repos/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  final ProductRepo productRepo;

  Future<void> fetchProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.fetchProducts();
    result.fold(
      (failure) => emit(ProductsFailure(failure.errorMessage)),
      (products) => emit(
        ProductsSuccess(products),
      ),
    );
  }
  Future<void> fetchProductsBtId(int id) async {
    emit(ProductsLoading());
    var result = await productRepo.fetchProductsBYId(id);
    result.fold(
      (failure) => emit(ProductsFailure(failure.errorMessage)),
      (products) => emit(
        ProductsSuccess(products),
      ),
    );
  }
}
