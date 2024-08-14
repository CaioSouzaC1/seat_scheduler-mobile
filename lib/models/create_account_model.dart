import 'dart:convert';

class CreateAccountModel {
  final String cep;
  final String city;
  final String complement;
  final String country;
  final String email;
  final String name;
  final String neighborhood;
  final String number;
  final String password;
  final String phone;
  final String state;
  final String street;

  CreateAccountModel(
      {required this.cep,
      required this.city,
      required this.complement,
      required this.country,
      required this.email,
      required this.name,
      required this.neighborhood,
      required this.number,
      required this.password,
      required this.phone,
      required this.state,
      required this.street});

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'city': city,
      'complement': complement,
      'country': country,
      'email': email,
      'name': name,
      'neighborhood': neighborhood,
      'number': number,
      'password': password,
      'phone': phone,
      'state': state,
      'street': street,
    };
  }

  factory CreateAccountModel.fromMap(Map<String, dynamic> map) {
    return CreateAccountModel(
        cep: map['cep'],
        city: map['city'],
        complement: map['complement'],
        country: map['country'],
        email: map['email'],
        name: map['name'],
        neighborhood: map['neighborhood'],
        number: map['number'],
        password: map['password'],
        phone: map['phone'],
        state: map['state'],
        street: map['street']);
  }

  factory CreateAccountModel.fromJson(String data) =>
      CreateAccountModel.fromMap(jsonDecode(data));
}
