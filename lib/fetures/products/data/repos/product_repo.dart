import 'package:either_dart/either.dart';
import '../../../../core/errors/faliure.dart';
import '../models/product.dart';
import '../models/product_variant_image.dart';

abstract class ProductRepo {
  Future<Either<Failure,List<Product>>> fetchProducts();
  Future<Either<Failure,List<Product>>> fetchProductsBYId(int id);
}
