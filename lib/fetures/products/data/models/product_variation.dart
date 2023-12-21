// import 'package:equatable/equatable.dart';
// import 'package:slash_task/fetures/products/data/models/product_variant_image.dart';
//
// class ProductVariation extends Equatable {
//   final int id;
//   final num price;
//   final int quantity;
//   final bool inStock;
//   final List<ProductVariantImage> productVariantImages;
//
//   ProductVariation({
//     required this.id,
//     required this.price,
//     required this.quantity,
//     required this.inStock,
//     required this.productVariantImages,
//   });
//
//   factory ProductVariation.fromJson(Map<String, dynamic> json) {
//     List<ProductVariantImage> productVariantImages = [];
//     if (json['ProductVarientImages'] != null) {
//       productVariantImages = List<ProductVariantImage>.from(
//         json['ProductVarientImages'].map((image) => ProductVariantImage.fromJson(image)),
//       );
//     }
//
//     return ProductVariation(
//       id: json['id'] as int,
//       price: json['price'] as num,
//       quantity: json['quantity'] as int,
//       inStock: json['inStock'] as bool,
//       productVariantImages: productVariantImages,
//     );
//   }
//
//   @override
//   List<Object?> get props => [id, price, quantity, inStock, productVariantImages];
// }
