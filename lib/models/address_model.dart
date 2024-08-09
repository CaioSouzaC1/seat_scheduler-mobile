import 'dart:convert';

class AddressModel {
  final String id;
  final String cep;
  final String country;
  final String neighborhood;
  final String street;
  final int number;
  final String? complement;
  final String createdAt;
  final String updatedAt;

  AddressModel({
    required this.id,
    required this.cep,
    required this.country,
    required this.neighborhood,
    required this.street,
    required this.number,
    this.complement,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cep': cep,
      'country': country,
      'neighborhood': neighborhood,
      'street': street,
      'number': number,
      'complement': complement ?? '',
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
        id: map["id"],
        cep: map["cep"],
        country: map["country"],
        neighborhood: map["neighborhood"],
        street: map["street"],
        number: map["number"],
        createdAt: map["createdAt"],
        updatedAt: map["updatedAt"]);
  }

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));
}
