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
  final Store? store;
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
      store: json["store"] == null ? null : Store.fromJson(json["store"]),
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

class Store {
  Store({
    required this.id,
    required this.name,
    required this.v,
    required this.categories,
    required this.contact,
    required this.cover,
    required this.createdAt,
    required this.description,
    required this.image,
    required this.isActive,
    required this.isDeleted,
    required this.locations,
    required this.ratings,
    required this.status,
    required this.updatedAt,
    required this.workingHours,
  });

  final String? id;
  final String? name;
  final int? v;
  final List<String> categories;
  final String? contact;
  final String? cover;
  final DateTime? createdAt;
  final String? description;
  final String? image;
  final bool? isActive;
  final bool? isDeleted;
  final List<LocationElement> locations;
  final dynamic ratings;
  final String? status;
  final DateTime? updatedAt;
  final List<WorkingHour> workingHours;

  factory Store.fromJson(Map<String, dynamic> json){
    return Store(
      id: json["_id"],
      name: json["name"],
      v: json["__v"],
      categories: json["categories"] == null ? [] : List<String>.from(json["categories"]!.map((x) => x)),
      contact: json["contact"],
      cover: json["cover"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      description: json["description"],
      image: json["image"],
      isActive: json["is_active"],
      isDeleted: json["is_deleted"],
      locations: json["locations"] == null ? [] : List<LocationElement>.from(json["locations"]!.map((x) => LocationElement.fromJson(x))),
      ratings: json["ratings"],
      status: json["status"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      workingHours: json["working_hours"] == null ? [] : List<WorkingHour>.from(json["working_hours"]!.map((x) => WorkingHour.fromJson(x))),
    );
  }

}

class LocationElement {
  LocationElement({
    required this.governorate,
    required this.state,
    required this.locationLink,
    required this.location,
    required this.id,
  });

  final String? governorate;
  final String? state;
  final String? locationLink;
  final LocationLocation? location;
  final String? id;

  factory LocationElement.fromJson(Map<String, dynamic> json){
    return LocationElement(
      governorate: json["governorate"],
      state: json["state"],
      locationLink: json["location_link"],
      location: json["location"] == null ? null : LocationLocation.fromJson(json["location"]),
      id: json["_id"],
    );
  }

}

class LocationLocation {
  LocationLocation({
    required this.type,
    required this.coordinates,
  });

  final String? type;
  final List<double> coordinates;

  factory LocationLocation.fromJson(Map<String, dynamic> json){
    return LocationLocation(
      type: json["type"],
      coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x)),
    );
  }

}

class WorkingHour {
  WorkingHour({
    required this.from,
    required this.to,
    required this.id,
  });

  final String? from;
  final String? to;
  final String? id;

  factory WorkingHour.fromJson(Map<String, dynamic> json){
    return WorkingHour(
      from: json["from"],
      to: json["to"],
      id: json["_id"],
    );
  }

}

class Variation {
  Variation({
    required this.size,
    required this.price,
    required this.id,
  });

  var size;
  var price;
  var id;

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
