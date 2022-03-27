//packege
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//components
import 'package:teste_capyba/components/header_page.dart';
import 'package:teste_capyba/components/input.dart';
// import 'package:teste_capyba/components/modal_upload_photo.dart';

class FormRegisterApp extends StatefulWidget {
  const FormRegisterApp({Key? key}) : super(key: key);

  @override
  State<FormRegisterApp> createState() => _FormRegisterAppState();
}

class _FormRegisterAppState extends State<FormRegisterApp> {
  final _form = GlobalKey<FormState>();
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

  testClick() {
    print('${_nameValue.text} ${_emailValue.text} ${_passwordValue.text} ${_confirmPasswordValue.text} Image: ${image.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HeaderPage(text: 'Cadastro'),
            Form(
              key: _form,
              child: Column(
                children: [
                  (image != null)
                      ? SizedBox(
                          width: 200,
                          height: 200,
                          child: Container(
                            child: ClipRRect(
                              child: Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 200,
                                height: 200,
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(100)),
                                    child: Image.network(
                                        'https://media.istockphoto.com/vectors/profile-anonymous-face-icon-gray-silhouette-person-male-default-vector-id903053114?k=20&m=903053114&s=170667a&w=0&h=PfLuZ_Q-Yh3Qk3cKq7GLcCQFCsqRL1100YjYz5VF2t4=')),
                              ),
                              const Text(
                                'Nenhuma foto adicionada...',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.redAccent),
                              )
                            ],
                          ),
                        ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(12),
                          child: ElevatedButton(
                            onPressed: uploadPhoto,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.camera_alt),
                                Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text('Carregar foto',
                                      style: TextStyle(fontSize: 20)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(12),
                          child: ElevatedButton(
                            onPressed: selectedPhotoFromGallery,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.photo),
                                Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text('Escolher foto',
                                      style: TextStyle(fontSize: 20)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormFieldComponent(
                      keyBoardType: TextInputType.name,
                      prefixIcon: const Icon(Icons.person),
                      autoFocus: true,
                      obscureText: false,
                      controller: _nameValue,
                      labeltext: 'Nome'),
                  TextFormFieldComponent(
                      keyBoardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                      autoFocus: true,
                      obscureText: false,
                      controller: _emailValue,
                      labeltext: 'E-mail'),
                  TextFormFieldComponent(
                      keyBoardType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(Icons.password),
                      autoFocus: true,
                      obscureText: true,
                      controller: _passwordValue,
                      labeltext: 'Senha'),
                  TextFormFieldComponent(
                      keyBoardType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(Icons.password),
                      autoFocus: true,
                      obscureText: true,
                      controller: _confirmPasswordValue,
                      labeltext: 'Confirme sua senha'),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 24),
                    child: ElevatedButton(
                      onPressed: () {
                        print('${_nameValue} ${_emailValue} ${_passwordValue} ${_confirmPasswordValue} Image: ${image}');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.login),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Text('Cadastrar',
                                style: TextStyle(fontSize: 20)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
