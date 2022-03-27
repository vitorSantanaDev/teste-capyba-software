//packege
import 'package:flutter/material.dart';
import 'package:teste_capyba/components/header_page.dart';
import 'package:teste_capyba/components/input.dart';
import 'package:teste_capyba/pages/register_page.dart';

//components

class FormLoginApp extends StatefulWidget {
  const FormLoginApp({Key? key}) : super(key: key);

  @override
  State<FormLoginApp> createState() => _FormLoginAppState();
}

class _FormLoginAppState extends State<FormLoginApp> {
  final _form = GlobalKey<FormState>();
  final _emailValue = TextEditingController();
  final _passwordValue = TextEditingController();

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
            HeaderPage(text: 'Login'),
            Form(
              key: _form,
              child: Column(
                children: [
                  TextFormFieldComponent(
                      keyBoardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.email),
                      autoFocus: true,
                      obscureText: false,
                      controller: _emailValue,
                      labeltext: 'E-mail'),
                  TextFormFieldComponent(
                      autoFocus: true,
                      keyBoardType: TextInputType.visiblePassword,
                      prefixIcon: const Icon(Icons.password),
                      obscureText: true,
                      controller: _passwordValue,
                      labeltext: 'Senha'),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 24),
                    child: ElevatedButton(
                      onPressed: () {
                        print('${_emailValue.text}, ${_passwordValue.text}');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.login),
                          Padding(
                            padding: EdgeInsets.all(12),
                            child:
                                Text('Login', style: TextStyle(fontSize: 20)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Não possui conta?',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: ((context) => const RegisterPage())));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.app_registration_rounded),
                                Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text('Cadastre-se',
                                      style: TextStyle(fontSize: 20)),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
