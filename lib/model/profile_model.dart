class ProfileModel {
  ProfileModel({
     this.success,
     this.message,
     this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory ProfileModel.fromJson(Map<String, dynamic> json){
    return ProfileModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.v,
    required this.balance,
    required this.createdAt,
    required this.isActive,
    required this.isApproved,
    required this.isDeleted,
    required this.store,
    required this.updatedAt,
  });

  final String? id;
  final String? email;
  final int? v;
  final int? balance;
  final DateTime? createdAt;
  final bool? isActive;
  final bool? isApproved;
  final bool? isDeleted;
  final Store? store;
  final DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      id: json["_id"],
      email: json["email"],
      v: json["__v"],
      balance: json["balance"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      isActive: json["is_active"],
      isApproved: json["is_approved"],
      isDeleted: json["is_deleted"],
      store: json["store"] == null ? null : Store.fromJson(json["store"]),
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
  final List<Category> categories;
  final String? contact;
  final String? cover;
  final DateTime? createdAt;
  final String? description;
  final String? image;
  final bool? isActive;
  final bool? isDeleted;
  final List<LocationElement> locations;
  final int? ratings;
  final String? status;
  final DateTime? updatedAt;
  final List<WorkingHour> workingHours;

  factory Store.fromJson(Map<String, dynamic> json){
    return Store(
      id: json["_id"],
      name: json["name"],
      v: json["__v"],
      categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
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

class Category {
  Category({
    required this.id,
    required this.name,
    required this.icon,
  });

  final String? id;
  final String? name;
  final String? icon;

  factory Category.fromJson(Map<String, dynamic> json){
    return Category(
      id: json["_id"],
      name: json["name"],
      icon: json["icon"],
    );
  }

}

class LocationElement {
  LocationElement({
    required this.location,
    required this.governorate,
    required this.state,
    required this.locationLink,
    required this.id,
  });

  final LocationLocation? location;
  final String? governorate;
  final String? state;
  final String? locationLink;
  final String? id;

  factory LocationElement.fromJson(Map<String, dynamic> json){
    return LocationElement(
      location: json["location"] == null ? null : LocationLocation.fromJson(json["location"]),
      governorate: json["governorate"],
      state: json["state"],
      locationLink: json["location_link"],
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
