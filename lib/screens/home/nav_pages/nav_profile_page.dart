import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:form_field_validator/form_field_validator.dart';

class NavProfilePage extends StatefulWidget {
  const NavProfilePage({super.key});

  @override
  State<NavProfilePage> createState() => _NavProfilePageState();
}

class _NavProfilePageState extends State<NavProfilePage> {
  late final GlobalKey<FormState> _formkey;
  late final TextEditingController _nomController;
  late final TextEditingController _prenomController;
  late final TextEditingController _phoneController;
  @override
  void initState() {
    _formkey = GlobalKey<FormState>();
    _nomController = TextEditingController(text: "Chebbi");
    _prenomController = TextEditingController(text: "Yahya");
    _phoneController = TextEditingController(
      text: "23115000",
    ); // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/user_image.jpg"),
              ),
              const SizedBox(height: 30),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _prenomController,
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: "Prenom",
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Veuillez saisir votre nom"),
                ]).call,
              ),
              SizedBox(height: 20),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nomController,
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: "Nom",
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "* Veuillez saisir votre nom"),
                ]).call,
              ),
              const SizedBox(height: 20),
              IntlPhoneField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Numero telephone',
                ),
                initialCountryCode: 'TN',
                validator: (phone) {
                  if (phone == null || phone.number.trim().isEmpty) {
                    return "* Veuillez saisir votre numero telephone";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: const Text("Modifier mon profil"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: const Text("Deconnecter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
