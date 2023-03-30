import 'package:app_digimon/src/providers/digimon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => DigimonProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Digimon App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Digimon Wiki'),
            centerTitle: true,
          ),
          body: const Home(),
        ),
      ),
    );
  }
}
