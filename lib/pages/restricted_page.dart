//packages
import 'package:flutter/material.dart';

class RestrictedPage extends StatelessWidget {
  const RestrictedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(0, 233, 99, 1),
        title: const Text('Área restrita',
            style: TextStyle(color: Colors.black87)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('images/icon-sad.png', fit: BoxFit.cover),
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
    );
  }
}
