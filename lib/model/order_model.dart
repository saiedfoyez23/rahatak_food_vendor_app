class OrderModel {
  OrderModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory OrderModel.fromJson(Map<String, dynamic> json){
    return OrderModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.data,
    required this.meta,
  });

  final List<OrderData> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<OrderData>.from(json["data"]!.map((x) => OrderData.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class OrderData {
  OrderData({
    required this.id,
    required this.customer,
    required this.store,
    required this.orderId,
    required this.paymentMethod,
    required this.shippingFee,
    required this.total,
    required this.status,
    required this.paymentStatus,
    required this.items,
    required this.deliveryLocation,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? customer;
  final String? store;
  final String? orderId;
  final String? paymentMethod;
  final int? shippingFee;
  final double? total;
  final String? status;
  final String? paymentStatus;
  final List<Item> items;
  final DeliveryLocation? deliveryLocation;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory OrderData.fromJson(Map<String, dynamic> json){
    return OrderData(
      id: json["_id"],
      customer: json["customer"],
      store: json["store"],
      orderId: json["order_id"],
      paymentMethod: json["payment_method"],
      shippingFee: json["shipping_fee"],
      total: json["total"],
      status: json["status"],
      paymentStatus: json["payment_status"],
      items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      deliveryLocation: json["delivery_location"] == null ? null : DeliveryLocation.fromJson(json["delivery_location"]),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

}

class DeliveryLocation {
  DeliveryLocation({
    required this.location,
    required this.title,
    required this.governorate,
    required this.state,
    required this.city,
    required this.phone,
    required this.id,
  });

  final Location? location;
  final String? title;
  final String? governorate;
  final String? state;
  final String? city;
  final String? phone;
  final String? id;

  factory DeliveryLocation.fromJson(Map<String, dynamic> json){
    return DeliveryLocation(
      location: json["location"] == null ? null : Location.fromJson(json["location"]),
      title: json["title"],
      governorate: json["governorate"],
      state: json["state"],
      city: json["city"],
      phone: json["phone"],
      id: json["_id"],
    );
  }

}

class Location {
  Location({
    required this.coordinates,
    required this.type,
  });

  final List<double> coordinates;
  final String? type;

  factory Location.fromJson(Map<String, dynamic> json){
    return Location(
      coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x)),
      type: json["type"],
    );
  }

}

class Item {
  Item({
    required this.product,
    required this.quantity,
    required this.discount,
    required this.id,
  });

  final String? product;
  final int? quantity;
  final int? discount;
  final String? id;

  factory Item.fromJson(Map<String, dynamic> json){
    return Item(
      product: json["product"],
      quantity: json["quantity"],
      discount: json["discount"],
      id: json["_id"],
    );
  }

}

class Meta {
  Meta({
    required this.total,
  });

  final int? total;

  factory Meta.fromJson(Map<String, dynamic> json){
    return Meta(
      total: json["total"],
    );
  }

}
