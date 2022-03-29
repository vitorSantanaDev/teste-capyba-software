//packeges
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teste_capyba/pages/login_page.dart';
import 'package:teste_capyba/services/sign_up_service.dart';

//components

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
      print('Nenhuma foto selecionada.');
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
      print('Nenhuma foto selecionada.');
    }
  }

  signUp() {
    if(_formKey.currentState!.validate()) {
      SignUpService().signUp(_emailValue.text, _passwordValue.text);
      _nameValue.text = "";
      _emailValue.text = "";
      _passwordValue.text = "";
      _confirmPasswordValue.text = "";
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                const Text('Faça seu cadastro',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.5
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _nameValue,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                      prefixIcon: Icon(Icons.person)
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
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
                      prefixIcon: Icon(Icons.email)
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
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
                      prefixIcon: Icon(Icons.password)
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Informe sua senha!';
                      } else if(value.length < 6) {
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
                      prefixIcon: Icon(Icons.password)
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Informe sua senha!';
                      } else if(value.length < 6) {
                        return 'Sua senha deve conter no mínimo 6 caracteres.';
                      } else if(value != _passwordValue.text) {
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
                            child: Text('Cadastrar', 
                              style: TextStyle(
                                fontSize: 20
                              ),
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
