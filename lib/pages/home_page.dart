//packages
import 'package:flutter/material.dart';

//pages
import 'package:teste_capyba/pages/login_page.dart';
import 'package:teste_capyba/pages/my_profile_page.dart';
import 'package:teste_capyba/pages/restricted_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.black87),
          ),
          backgroundColor: const Color.fromRGBO(0, 233, 99, 1),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromRGBO(0, 233, 99, 1),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyProfilePage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Meu perfil',
                          style: TextStyle(fontSize: 24, color: Colors.black87),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.person, color: Colors.black87),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Home',
                          style: TextStyle(fontSize: 24, color: Colors.black87),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.home, color: Colors.black87),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RestrictedPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Área restrita',
                          style: TextStyle(fontSize: 24, color: Colors.black87),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.security, color: Colors.black87),
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Sair da conta',
                          style: TextStyle(fontSize: 24, color: Colors.black87),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.logout, color: Colors.black87),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
        body: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child:
                        Image.asset('images/icon-sad.png', fit: BoxFit.cover),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'Infelizmente não deu tempo de concluir essa área.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 233, 99, 1),
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
