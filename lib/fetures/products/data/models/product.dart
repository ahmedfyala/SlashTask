class Product{
  final int id;
  final String name;
  final String description;
  final int subCategoryId;
  final int brandId;
  final int bostaSizeId;
  final String createdAt;
  final String updatedAt;
  final double productRating;
  final int estimatedDaysPreparing;
  final Brand brand;
  final List<ProductVariation> productVariations;
  final SubCategory subCategory;
  final dynamic sizeChart;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.subCategoryId,
    required this.brandId,
    required this.bostaSizeId,
    required this.createdAt,
    required this.updatedAt,
    required this.productRating,
    required this.estimatedDaysPreparing,
    required this.brand,
    required this.productVariations,
    required this.subCategory,
    required this.sizeChart,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      subCategoryId: json['sub_category_id'],
      brandId: json['brand_id'],
      bostaSizeId: json['bosta_size_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      productRating: json['product_rating'].toDouble(),
      estimatedDaysPreparing: json['estimated_days_preparing'],
      brand: Brand.fromJson(json['Brands']),
      productVariations: (json['ProductVariations'] as List)
          .map((variation) => ProductVariation.fromJson(variation))
          .toList(),
      subCategory: SubCategory.fromJson(json['SubCategories']),
      sizeChart: json['SizeChart'],
    );

  }
}

class Brand {
  final int id;
  final String brandName;
  final String brandMobileNumber;
  final String brandEmailAddress;
  final String brandDescription;
  final String brandLogoImagePath;
  final int brandRating;
  final int daysLimitToReturn;

  Brand({
    required this.id,
    required this.brandName,
    required this.brandMobileNumber,
    required this.brandEmailAddress,
    required this.brandDescription,
    required this.brandLogoImagePath,
    required this.brandRating,
    required this.daysLimitToReturn,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      brandName: json['brand_name'],
      brandMobileNumber: json['brand_mobile_number'],
      brandEmailAddress: json['brand_email_address'],
      brandDescription: json['brand_description'],
      brandLogoImagePath: json['brand_logo_image_path'],
      brandRating: json['brand_rating'],
      daysLimitToReturn: json['days_limit_to_return'],
    );
  }
}

class ProductVariation {
  final int id;
  final int productId;
  final double price;
  final int quantity;
  final bool isDefault;
  final String createdAt;
  final String updatedAt;
  final int productVariationStatusId;
  final List<ProductVariantImage> productVariantImages;

  ProductVariation({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
    required this.productVariationStatusId,
    required this.productVariantImages,
  });

  factory ProductVariation.fromJson(Map<String, dynamic> json) {
    return ProductVariation(
      id: json['id'],
      productId: json['product_id'],
      price: json['price'].toDouble(),
      quantity: json['quantity'],
      isDefault: json['is_default'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      productVariationStatusId: json['product_variation_status_id'],
      productVariantImages: (json['ProductVarientImages'] as List)
          .map((image) => ProductVariantImage.fromJson(image))
          .toList(),
    );
  }
}

class ProductVariantImage {
  final int id;
  final String imagePath;

  ProductVariantImage({
    required this.id,
    required this.imagePath,
  });

  factory ProductVariantImage.fromJson(Map<String, dynamic> json) {
    return ProductVariantImage(
      id: json['id'],
      imagePath: json['image_path'],
    );
  }
}

class SubCategory {
  final int id;
  final String name;
  final dynamic deletedAt;
  final String createdAt;
  final String updatedAt;
  final int categoryId;
  final String imagePath;

  SubCategory({
    required this.id,
    required this.name,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.categoryId,
    required this.imagePath,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['id'],
      name: json['name'],
      deletedAt: json['deletedAt'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      categoryId: json['category_id'],
      imagePath: json['image_path'],
    );
  }
}
