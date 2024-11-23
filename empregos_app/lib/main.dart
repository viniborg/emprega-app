import 'package:empregos_app/providers/qualification_provider.dart';
import 'package:empregos_app/view/home_page.dart';
import 'package:empregos_app/view/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user_model.dart';
import 'providers/job_provider.dart';

void main() {
  runApp(EmpregosApp());
}

class EmpregosApp extends StatelessWidget {
  EmpregosApp({super.key});

  User usuario = User(
    nome: 'Vinicius Correa',
    email: 'vinicius.b.correa@hotmail.com',
    cargo: 'Desenvolvedor Flutter',
    localizacao: 'Criciúma, SC',
    dataNascimento: '30/06/1998',
    imagemUrl: 'https://images.vexels.com/content/145908/preview/male-avatar-maker-2a7919.png',
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JobsProvider()),
        ChangeNotifierProvider(create: (_) => QualificationsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {'/profile': (context) => UserProfilePage(user: usuario)},
      ),
    );
  }
}
