//packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//providers
import 'package:teste_capyba/provider/user_provider.dart';

//app
import 'package:teste_capyba/app/app.dart';

Future<void> main() async => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MyApp(),
    ));
