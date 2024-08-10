import 'dart:convert';

class CompanyAttachement {
  final String id;
  final String companyId;
  final String imagePath;
  final String createdAt;
  final String updatedAt;

  CompanyAttachement(
      {required this.id,
      required this.companyId,
      required this.imagePath,
      required this.createdAt,
      required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'companyId': companyId,
      'imagePath': imagePath,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory CompanyAttachement.fromMap(Map<String, dynamic> map) {
    return CompanyAttachement(
        id: map['id'],
        companyId: map["companyId"],
        imagePath: map["imagePath"],
        createdAt: map["createdAt"],
        updatedAt: map["updatedAt"]);
  }

  factory CompanyAttachement.fromJson(String source) =>
      CompanyAttachement.fromMap(json.decode(source));
}
