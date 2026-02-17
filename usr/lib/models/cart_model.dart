class Cart {
  final String id;
  final String userId;
  final List<CartItem> items;
  final DateTime createdAt;
  final DateTime updatedAt;

  Cart({
    required this.id,
    required this.userId,
    this.items = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((i) => CartItem.fromJson(i as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'items': items.map((i) => i.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  double get subtotal {
    return items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  int get totalItems {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }

  double calculateTotal({double shippingCost = 0, double discount = 0}) {
    return subtotal + shippingCost - discount;
  }
}

class CartItem {
  final String id;
  final String productId;
  final String productName;
  final String productImage;
  final double price;
  final int quantity;
  final String? selectedVariantId;
  final Map<String, String>? selectedVariants; // e.g., {'size': 'Large', 'color': 'Red'}
  final bool isAvailable;
  final int maxQuantity;

  CartItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.quantity,
    this.selectedVariantId,
    this.selectedVariants,
    this.isAvailable = true,
    required this.maxQuantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      productImage: json['product_image'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      selectedVariantId: json['selected_variant_id'] as String?,
      selectedVariants: json['selected_variants'] != null
          ? Map<String, String>.from(json['selected_variants'] as Map)
          : null,
      isAvailable: json['is_available'] as bool? ?? true,
      maxQuantity: json['max_quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product_name': productName,
      'product_image': productImage,
      'price': price,
      'quantity': quantity,
      'selected_variant_id': selectedVariantId,
      'selected_variants': selectedVariants,
      'is_available': isAvailable,
      'max_quantity': maxQuantity,
    };
  }

  double get totalPrice => price * quantity;

  CartItem copyWith({
    String? id,
    String? productId,
    String? productName,
    String? productImage,
    double? price,
    int? quantity,
    String? selectedVariantId,
    Map<String, String>? selectedVariants,
    bool? isAvailable,
    int? maxQuantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImage: productImage ?? this.productImage,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      selectedVariantId: selectedVariantId ?? this.selectedVariantId,
      selectedVariants: selectedVariants ?? this.selectedVariants,
      isAvailable: isAvailable ?? this.isAvailable,
      maxQuantity: maxQuantity ?? this.maxQuantity,
    );
  }
}

class Wishlist {
  final String id;
  final String userId;
  final List<WishlistItem> items;
  final DateTime createdAt;

  Wishlist({
    required this.id,
    required this.userId,
    this.items = const [],
    required this.createdAt,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) {
    return Wishlist(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((i) => WishlistItem.fromJson(i as Map<String, dynamic>))
              .toList() ??
          [],
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'items': items.map((i) => i.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
    };
  }
}

class WishlistItem {
  final String id;
  final String productId;
  final String productName;
  final String productImage;
  final double price;
  final double? originalPrice;
  final bool isAvailable;
  final DateTime addedAt;

  WishlistItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    this.originalPrice,
    this.isAvailable = true,
    required this.addedAt,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      productImage: json['product_image'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: json['original_price'] != null
          ? (json['original_price'] as num).toDouble()
          : null,
      isAvailable: json['is_available'] as bool? ?? true,
      addedAt: DateTime.parse(json['added_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'product_name': productName,
      'product_image': productImage,
      'price': price,
      'original_price': originalPrice,
      'is_available': isAvailable,
      'added_at': addedAt.toIso8601String(),
    };
  }
}