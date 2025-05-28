class SettingsModel {
  SettingsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<SettingsData> data;

  factory SettingsModel.fromJson(Map<String, dynamic> json){
    return SettingsModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null ? [] : List<SettingsData>.from(json["data"]!.map((x) => SettingsData.fromJson(x))),
    );
  }

}

class SettingsData {
  SettingsData({
    required this.id,
    required this.v,
    required this.aboutUs,
    required this.createdAt,
    required this.privacyPolicy,
    required this.termsConditions,
    required this.updatedAt,
  });

  final String? id;
  final int? v;
  final String? aboutUs;
  final DateTime? createdAt;
  final String? privacyPolicy;
  final String? termsConditions;
  final DateTime? updatedAt;

  factory SettingsData.fromJson(Map<String, dynamic> json){
    return SettingsData(
      id: json["_id"],
      v: json["__v"],
      aboutUs: json["about_us"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      privacyPolicy: json["privacy_policy"],
      termsConditions: json["terms_conditions"],
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
    );
  }

}
