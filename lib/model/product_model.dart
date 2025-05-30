class ProductModel {
  ProductModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
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

  final List<ProductData> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<ProductData>.from(json["data"]!.map((x) => ProductData.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class ProductData {
  ProductData({
    required this.id,
    required this.name,
    required this.images,
    required this.category,
    required this.store,
    required this.description,
    required this.discount,
    required this.variations,
    required this.timeRequired,
    required this.isDeleted,
    required this.ratings,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? name;
  final List<String> images;
  final String? category;
  final String? store;
  final String? description;
  final int? discount;
  final List<Variation> variations;
  final int? timeRequired;
  final bool? isDeleted;
  final int? ratings;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory ProductData.fromJson(Map<String, dynamic> json){
    return ProductData(
      id: json["_id"],
      name: json["name"],
      images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
      category: json["category"],
      store: json["store"],
      description: json["description"],
      discount: json["discount"],
      variations: json["variations"] == null ? [] : List<Variation>.from(json["variations"]!.map((x) => Variation.fromJson(x))),
      timeRequired: json["time_required"],
      isDeleted: json["is_deleted"],
      ratings: json["ratings"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}

class Variation {
  Variation({
    required this.size,
    required this.price,
    required this.id,
  });

  final String? size;
  final dynamic price;
  final String? id;

  factory Variation.fromJson(Map<String, dynamic> json){
    return Variation(
      size: json["size"],
      price: json["price"],
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
