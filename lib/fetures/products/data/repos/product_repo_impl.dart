import 'package:either_dart/src/either.dart';
import 'package:slash_task/fetures/products/data/repos/product_repo.dart';

import '../../../../core/api_constance.dart';
import '../../../../core/errors/faliure.dart';
import '../models/product.dart';
import '../models/product_variant_image.dart';
import '../services/api_service.dart';

class ProductRepoimpl implements ProductRepo {
  final ApiService apiService;

  ProductRepoimpl(this.apiService);

  @override
  Future<Either<Failure, List<Product>>> fetchProducts() async {
    try {
      var data = await apiService.get(url: ApiConstance.productUrl);
      List<Product> products =[];
      for(var item in data['data']){
        products.add(Product.fromJson(item));
      }
      return Right(products);
    } on Exception catch (e) {
     return Left(ServerFailure(e.toString()));
    }

  }

  @override
  Future<Either<Failure, List<Product>>> fetchProductsBYId(int id) async{
    try {
      var data = await apiService.get(url: ApiConstance.productIdUrl+id.toString());
      List<Product> products =[];
      for(var item in data['data']){
        products.add(Product.fromJson(item));
      }
      return Right(products);
    } on Exception catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
