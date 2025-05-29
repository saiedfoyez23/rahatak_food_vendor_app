class NotificationModel {
  NotificationModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final Data? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json){
    return NotificationModel(
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

  final List<NotificationData> data;
  final Meta? meta;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      data: json["data"] == null ? [] : List<NotificationData>.from(json["data"]!.map((x) => NotificationData.fromJson(x))),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    );
  }

}

class NotificationData {
  NotificationData({
    required this.id,
    required this.receiver,
    required this.title,
    required this.body,
    required this.time,
    required this.hasRead,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? receiver;
  final String? title;
  final String? body;
  final DateTime? time;
  final bool? hasRead;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory NotificationData.fromJson(Map<String, dynamic> json){
    return NotificationData(
      id: json["_id"],
      receiver: json["receiver"],
      title: json["title"],
      body: json["body"],
      time: DateTime.tryParse(json["time"] ?? ""),
      hasRead: json["has_read"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
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
