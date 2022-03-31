//packeges
import 'package:flutter/material.dart';

//components
import 'package:teste_capyba/components/register_form.dart';
import 'package:teste_capyba/services/login_service.dart';

//pages
import 'package:teste_capyba/pages/home_page.dart';

class FormLoginApp extends StatefulWidget {
  const FormLoginApp({Key? key}) : super(key: key);

  @override
  State<FormLoginApp> createState() => _FormLoginAppState();
}

class _FormLoginAppState extends State<FormLoginApp> {
  final _formKey = GlobalKey<FormState>();
  final _emailValue = TextEditingController();
  final _passwordValue = TextEditingController();

  late bool emailValidate = !RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(_emailValue.text);

  final snackBar = const SnackBar(
    content: Text(
      'Email ou senha são inválidos',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.redAccent,
  );

  signIn() async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (_formKey.currentState!.validate()) {
      final loginSucsses =
          await SignInService().signIn(_emailValue.text, _passwordValue.text);
      await SignInService().signIn(_emailValue.text, _passwordValue.text);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      if (loginSucsses) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        _passwordValue.clear();
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Seja bem vindo',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.5),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
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
                      } else if (emailValidate) {
                        return 'Por favor digite um e-mail válido.';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
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
                  padding: const EdgeInsets.all(24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: ElevatedButton(
                      onPressed: () {
                        signIn();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.login_rounded),
                          Padding(
                            padding: EdgeInsets.all(16),
                            child: Text(
                              'Fazer login',
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text('Ainda não tem conta? :('),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FormRegisterApp()));
                    },
                    child: const Text('Cadastre-se agora! ;)'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
