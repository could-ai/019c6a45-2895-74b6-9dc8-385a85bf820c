class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? originalPrice;
  final String categoryId;
  final String? subcategoryId;
  final String brand;
  final List<String> imageUrls;
  final List<String>? videoUrls;
  final List<ProductVariant> variants;
  final int stockQuantity;
  final bool isAvailable;
  final double averageRating;
  final int totalReviews;
  final List<String> tags;
  final Map<String, dynamic> specifications;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int viewCount;
  final int purchaseCount;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.originalPrice,
    required this.categoryId,
    this.subcategoryId,
    required this.brand,
    required this.imageUrls,
    this.videoUrls,
    this.variants = const [],
    required this.stockQuantity,
    this.isAvailable = true,
    this.averageRating = 0.0,
    this.totalReviews = 0,
    this.tags = const [],
    this.specifications = const {},
    required this.createdAt,
    this.updatedAt,
    this.viewCount = 0,
    this.purchaseCount = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: json['original_price'] != null
          ? (json['original_price'] as num).toDouble()
          : null,
      categoryId: json['category_id'] as String,
      subcategoryId: json['subcategory_id'] as String?,
      brand: json['brand'] as String,
      imageUrls: List<String>.from(json['image_urls'] as List),
      videoUrls: json['video_urls'] != null
          ? List<String>.from(json['video_urls'] as List)
          : null,
      variants: (json['variants'] as List<dynamic>?)
              ?.map((v) => ProductVariant.fromJson(v as Map<String, dynamic>))
              .toList() ??
          [],
      stockQuantity: json['stock_quantity'] as int,
      isAvailable: json['is_available'] as bool? ?? true,
      averageRating: (json['average_rating'] as num?)?.toDouble() ?? 0.0,
      totalReviews: json['total_reviews'] as int? ?? 0,
      tags: json['tags'] != null ? List<String>.from(json['tags'] as List) : [],
      specifications: json['specifications'] as Map<String, dynamic>? ?? {},
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
      viewCount: json['view_count'] as int? ?? 0,
      purchaseCount: json['purchase_count'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'original_price': originalPrice,
      'category_id': categoryId,
      'subcategory_id': subcategoryId,
      'brand': brand,
      'image_urls': imageUrls,
      'video_urls': videoUrls,
      'variants': variants.map((v) => v.toJson()).toList(),
      'stock_quantity': stockQuantity,
      'is_available': isAvailable,
      'average_rating': averageRating,
      'total_reviews': totalReviews,
      'tags': tags,
      'specifications': specifications,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'view_count': viewCount,
      'purchase_count': purchaseCount,
    };
  }

  double get discountPercentage {
    if (originalPrice == null || originalPrice! <= price) return 0.0;
    return ((originalPrice! - price) / originalPrice!) * 100;
  }

  bool get hasDiscount => discountPercentage > 0;
}

class ProductVariant {
  final String id;
  final String name;
  final String type; // e.g., 'color', 'size', 'storage'
  final String value; // e.g., 'Red', 'Large', '128GB'
  final double? priceAdjustment;
  final int stockQuantity;
  final bool isAvailable;
  final String? imageUrl;

  ProductVariant({
    required this.id,
    required this.name,
    required this.type,
    required this.value,
    this.priceAdjustment,
    required this.stockQuantity,
    this.isAvailable = true,
    this.imageUrl,
  });

  factory ProductVariant.fromJson(Map<String, dynamic> json) {
    return ProductVariant(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      value: json['value'] as String,
      priceAdjustment: json['price_adjustment'] != null
          ? (json['price_adjustment'] as num).toDouble()
          : null,
      stockQuantity: json['stock_quantity'] as int,
      isAvailable: json['is_available'] as bool? ?? true,
      imageUrl: json['image_url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'value': value,
      'price_adjustment': priceAdjustment,
      'stock_quantity': stockQuantity,
      'is_available': isAvailable,
      'image_url': imageUrl,
    };
  }
}

class Category {
  final String id;
  final String name;
  final String? description;
  final String? iconUrl;
  final String? imageUrl;
  final int displayOrder;
  final bool isActive;
  final List<Category> subcategories;

  Category({
    required this.id,
    required this.name,
    this.description,
    this.iconUrl,
    this.imageUrl,
    this.displayOrder = 0,
    this.isActive = true,
    this.subcategories = const [],
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      iconUrl: json['icon_url'] as String?,
      imageUrl: json['image_url'] as String?,
      displayOrder: json['display_order'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? true,
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((c) => Category.fromJson(c as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon_url': iconUrl,
      'image_url': imageUrl,
      'display_order': displayOrder,
      'is_active': isActive,
      'subcategories': subcategories.map((c) => c.toJson()).toList(),
    };
  }
}

class Review {
  final String id;
  final String productId;
  final String userId;
  final String userName;
  final String? userImageUrl;
  final double rating;
  final String title;
  final String comment;
  final List<String>? imageUrls;
  final bool isVerifiedPurchase;
  final int helpfulCount;
  final DateTime createdAt;

  Review({
    required this.id,
    required this.productId,
    required this.userId,
    required this.userName,
    this.userImageUrl,
    required this.rating,
    required this.title,
    required this.comment,
    this.imageUrls,
    this.isVerifiedPurchase = false,
    this.helpfulCount = 0,
    required this.createdAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      userId: json['user_id'] as String,
      userName: json['user_name'] as String,
      userImageUrl: json['user_image_url'] as String?,
      rating: (json['rating'] as num).toDouble(),
      title: json['title'] as String,
      comment: json['comment'] as String,
      imageUrls: json['image_urls'] != null
          ? List<String>.from(json['image_urls'] as List)
          : null,
      isVerifiedPurchase: json['is_verified_purchase'] as bool? ?? false,
      helpfulCount: json['helpful_count'] as int? ?? 0,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'user_id': userId,
      'user_name': userName,
      'user_image_url': userImageUrl,
      'rating': rating,
      'title': title,
      'comment': comment,
      'image_urls': imageUrls,
      'is_verified_purchase': isVerifiedPurchase,
      'helpful_count': helpfulCount,
      'created_at': createdAt.toIso8601String(),
    };
  }
}