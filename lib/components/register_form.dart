//packeges
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:teste_capyba/models/user.dart';
import 'package:teste_capyba/provider/user_provider.dart';

//services
import 'package:teste_capyba/services/sign_up_service.dart';

//pages
import 'package:teste_capyba/pages/login_page.dart';

class FormRegisterApp extends StatefulWidget {
  const FormRegisterApp({Key? key}) : super(key: key);

  @override
  State<FormRegisterApp> createState() => _FormRegisterAppState();
}

class _FormRegisterAppState extends State<FormRegisterApp> {
  final _formKey = GlobalKey<FormState>();
  final _nameValue = TextEditingController();
  final _emailValue = TextEditingController();
  final _passwordValue = TextEditingController();
  final _confirmPasswordValue = TextEditingController();
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

  signUp() async {
    if (image == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(snackBar('Por favor insira uma foto'));
    } else if (_formKey.currentState!.validate()) {
      var response = await SignUpService()
          .signUp(_nameValue.text, _emailValue.text, _passwordValue.text);

      if (response) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(snackBar('Este e-mail já existe.'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    late User user = User(
        name: _nameValue.text,
        email: _emailValue.text,
        password: _passwordValue.text,
        photo: image);
    UserProvider userProvider = Provider.of(context);
    userProvider.setUser(user);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastro',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: const Color.fromRGBO(0, 233, 99, 1),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Faça seu cadastro',
                  style: TextStyle(
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
                                child: image != null
                                    ? Image.file(File(image!.path),
                                        fit: BoxFit.fill)
                                    : Image.asset(
                                        'images/icon_person.png',
                                        fit: BoxFit.contain,
                                      ),
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
                                      'Tirar foto',
                                      style: TextStyle(color: Colors.black87),
                                    ),
                                    Icon(Icons.camera, color: Colors.black87)
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
                                      'Escolher foto',
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 233, 99, 1)),
                                    ),
                                    Icon(Icons.image,
                                        color: Color.fromRGBO(0, 233, 99, 1))
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
                    keyboardType: TextInputType.text,
                    controller: _nameValue,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                        prefixIcon: Icon(Icons.person)),
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
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailValue,
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
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _passwordValue,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
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
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _confirmPasswordValue,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirme sua senha',
                      prefixIcon: Icon(Icons.password),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe sua senha!';
                      } else if (value.length < 6) {
                        return 'Sua senha deve conter no mínimo 6 caracteres.';
                      } else if (value != _passwordValue.text) {
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
                      onPressed: () {
                        signUp();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.app_registration_rounded),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Cadastrar',
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
      ),
    );
    // return Padding(
  }
}
