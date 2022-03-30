//packages
import 'package:flutter/material.dart';

//providers

//services

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

  getToken(String email) {
    
  }

  setUpdateDataUser() {
    if(_newFormKey.currentState!.validate()) {
      
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Form(
              key: _newFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Olá',
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
                                  child: Image.asset('images/icon_person.png', fit: BoxFit.cover),
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
                                  onPressed: () {},
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
                                  onPressed: () {},
                                  child: Row(
                                    children: const [
                                      Text(
                                        'Editar foto',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(0, 233, 99, 1)),
                                      ),
                                      Icon(Icons.file_copy_sharp,
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
        ),
      );
    }
  }
