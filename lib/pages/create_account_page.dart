import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/models/create_account_model.dart';
import 'package:seat_scheduler_mobile/repositories/create_account_repository.dart';
import 'package:seat_scheduler_mobile/repositories/create_account_repository_impl.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPage();
}

class _CreateAccountPage extends State<CreateAccountPage> {
  final CreateAccountRepository createAccountRepository =
      CreateAccountRepositoryImpl();

  CreateAccountModel? createAccountModel;
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final cepEC = TextEditingController();
  final cityEC = TextEditingController();
  final complementEC = TextEditingController();
  final countryEC = TextEditingController();
  final emailEC = TextEditingController();
  final nameEC = TextEditingController();
  final neighborhoodEC = TextEditingController();
  final numberEC = TextEditingController();
  final passwordEC = TextEditingController();
  final phoneEC = TextEditingController();
  final stateEC = TextEditingController();
  final streetEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
          child: Text(
            'Criar conta',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameEC,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Nome obrigatório'
                      : null;
                },
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.people_alt),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: emailEC,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Email obrigatório"
                      : null;
                },
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordEC,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Senha obrigatorio"
                      : null;
                },
                decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: phoneEC,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Telefone obrigatório"
                      : null;
                },
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.smartphone_rounded),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: cepEC,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? "Cep obrigatório"
                            : null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Cep',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.pin_drop_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: numberEC,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? "Numero obrigatório"
                            : null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Numero',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.onetwothree_rounded),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: cityEC,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Cidade obrigatório"
                      : null;
                },
                decoration: const InputDecoration(
                  labelText: 'Cidade',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_city_rounded),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: streetEC,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Logradouro obrigatório"
                      : null;
                },
                decoration: const InputDecoration(
                  labelText: 'Logradouro',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.straighten_outlined),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: stateEC,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? "Estado obrigatório"
                            : null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Estado',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.star_rate_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: countryEC,
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? "Pais obrigatório"
                            : null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Pais',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.outlined_flag_rounded),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: neighborhoodEC,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? "Bairro obrigatório"
                      : null;
                },
                decoration: const InputDecoration(
                  labelText: 'Bairro',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.house_sharp),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: complementEC,
                decoration: const InputDecoration(
                  labelText: 'Complemento',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.document_scanner_outlined),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
