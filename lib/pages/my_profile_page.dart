//packages
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

//providers
import 'package:teste_capyba/provider/user_provider.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final _newFormKey = GlobalKey<FormState>();
  final _newNameValue = TextEditingController();
  final _newEmailValue = TextEditingController();
  final _newPasswordValue = TextEditingController();
  final _newConfirmPasswordValue = TextEditingController();
  XFile? image;

  snackBar(String message) {
    return SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.redAccent,
    );
  }

  uploadPhoto() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(source: ImageSource.camera);
      if (file != null) {
        setState(() {
          image = file;
        });
      }
    } catch (error) {
      snackBar('Não foi possível capturar a foto.');
    }
  }

  selectedPhotoFromGallery() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        setState(() {
          image = file;
        });
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar('Nenhuma foto selecionada'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Meu perfil',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: const Color.fromRGBO(0, 233, 99, 1),
          centerTitle: true,
        ),
        body: Consumer<UserProvider>(
          builder: (BuildContext context, UserProvider values, Widget? child) {
            _newNameValue.text = values.user.name;
            _newEmailValue.text = values.user.email;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Form(
                  key: _newFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Olá, bem vindo ao seu perfil ${values.user.name}',
                        style: const TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -1.5,
                            color: Colors.white),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    child: ClipRRect(
                                      child: values.user.photo != null
                                          ? Image.file(
                                              File(values.user.photo!.path))
                                          : Image.asset(
                                              'images/icon_person.png',
                                              fit: BoxFit.cover),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(150)),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: ElevatedButton(
                                      onPressed: uploadPhoto,
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Tirar uma nova foto',
                                            style: TextStyle(
                                                color: Colors.black87),
                                          ),
                                          Icon(Icons.camera,
                                              color: Colors.black87)
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: TextButton(
                                      onPressed: selectedPhotoFromGallery,
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Escolher uma nova foto',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 233, 99, 1)),
                                          ),
                                          Icon(Icons.image,
                                              color:
                                                  Color.fromRGBO(0, 233, 99, 1))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          controller: _newNameValue,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nome',
                              prefixIcon: Icon(Icons.person)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'O deve informar seu nome.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          controller: _newEmailValue,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E-mail',
                              prefixIcon: Icon(Icons.email)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe o email corretamente.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          controller: _newPasswordValue,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nova senha',
                              prefixIcon: Icon(Icons.password)),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe sua senha!';
                            } else if (value.length < 6) {
                              return 'Sua senha deve conter no mínimo 6 caracteres.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: TextFormField(
                          controller: _newConfirmPasswordValue,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirme sua nova senha',
                            prefixIcon: Icon(Icons.password),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Informe sua senha!';
                            } else if (value.length < 6) {
                              return 'Sua senha deve conter no mínimo 6 caracteres.';
                            } else if (value != '') {
                              return 'As senhas não correspondem, tente novamente.';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.app_registration_rounded),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    'Editar informações',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
