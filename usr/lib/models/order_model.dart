import 'user_model.dart';
import 'cart_model.dart';

class Order {
  final String id;
  final String userId;
  final String orderNumber;
  final List<OrderItem> items;
  final double subtotal;
  final double shippingCost;
  final double tax;
  final double discount;
  final double totalAmount;
  final OrderStatus status;
  final PaymentMethod paymentMethod;
  final PaymentStatus paymentStatus;
  final Address shippingAddress;
  final Address? billingAddress;
  final String? trackingNumber;
  final String? courierService;
  final DateTime? estimatedDeliveryDate;
  final DateTime? deliveredAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<OrderStatusHistory> statusHistory;

  Order({
    required this.id,
    required this.userId,
    required this.orderNumber,
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    required this.tax,
    required this.discount,
    required this.totalAmount,
    required this.status,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.shippingAddress,
    this.billingAddress,
    this.trackingNumber,
    this.courierService,
    this.estimatedDeliveryDate,
    this.deliveredAt,
    required this.createdAt,
    required this.updatedAt,
    this.statusHistory = const [],
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      orderNumber: json['order_number'] as String,
      items: (json['items'] as List<dynamic>)
          .map((i) => OrderItem.fromJson(i as Map<String, dynamic>))
          .toList(),
      subtotal: (json['subtotal'] as num).toDouble(),
      shippingCost: (json['shipping_cost'] as num).toDouble(),
      tax: (json['tax'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      status: OrderStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => OrderStatus.pending,
      ),
      paymentMethod: PaymentMethod.values.firstWhere(
        (e) => e.name == json['payment_method'],
        orElse: () => PaymentMethod.card,
      ),
      paymentStatus: PaymentStatus.values.firstWhere(
        (e) => e.name == json['payment_status'],
        orElse: () => PaymentStatus.pending,
      ),
      shippingAddress:
          Address.fromJson(json['shipping_address'] as Map<String, dynamic>),
      billingAddress: json['billing_address'] != null
          ? Address.fromJson(json['billing_address'] as Map<String, dynamic>)
          : null,
      trackingNumber: json['tracking_number'] as String?,
      courierService: json['courier_service'] as String?,
      estimatedDeliveryDate: json['estimated_delivery_date'] != null
          ? DateTime.parse(json['estimated_delivery_date'] as String)
          : null,
      deliveredAt: json['delivered_at'] != null
          ? DateTime.parse(json['delivered_at'] as String)
          : null,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      statusHistory: (json['status_history'] as List<dynamic>?)
              ?.map((h) =>
                  OrderStatusHistory.fromJson(h as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'order_number': orderNumber,
      'items': items.map((i) => i.toJson()).toList(),
      'subtotal': subtotal,
      'shipping_cost': shippingCost,
      'tax': tax,
      'discount': discount,
      'total_amount': totalAmount,
      'status': status.name,
      'payment_method': paymentMethod.name,
      'payment_status': paymentStatus.name,
      'shipping_address': shippingAddress.toJson(),
      'billing_address': billingAddress?.toJson(),
      'tracking_number': trackingNumber,
      'courier_service': courierService,
      'estimated_delivery_date': estimatedDeliveryDate?.toIso8601String(),
      'delivered_at': deliveredAt?.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'status_history': statusHistory.map((h) => h.toJson()).toList(),
    };
  }
}

class OrderItem {
  final String id;
  final String productId;
  final String productName;
  final String productImage;
  final double price;
  final int quantity;
  final Map<String, String>? selectedVariants;

  OrderItem({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.quantity,
    this.selectedVariants,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      productImage: json['product_image'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'] as int,
      selectedVariants: json['selected_variants'] != null
          ? Map<String, String>.from(json['selected_variants'] as Map)
          : null,
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
      'selected_variants': selectedVariants,
    };
  }

  double get totalPrice => price * quantity;
}

class OrderStatusHistory {
  final OrderStatus status;
  final DateTime timestamp;
  final String? note;

  OrderStatusHistory({
    required this.status,
    required this.timestamp,
    this.note,
  });

  factory OrderStatusHistory.fromJson(Map<String, dynamic> json) {
    return OrderStatusHistory(
      status: OrderStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => OrderStatus.pending,
      ),
      timestamp: DateTime.parse(json['timestamp'] as String),
      note: json['note'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.name,
      'timestamp': timestamp.toIso8601String(),
      'note': note,
    };
  }
}

enum OrderStatus {
  pending,
  confirmed,
  processing,
  shipped,
  outForDelivery,
  delivered,
  cancelled,
  returned,
  refunded,
}

enum PaymentMethod {
  card,
  upi,
  netBanking,
  wallet,
  cashOnDelivery,
  giftCard,
}

enum PaymentStatus {
  pending,
  processing,
  completed,
  failed,
  refunded,
}