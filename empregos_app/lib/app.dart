import 'package:empregos_app/providers/qualification_provider.dart';
import 'package:empregos_app/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/job_provider.dart';


class EmpregosApp extends StatelessWidget {
  const EmpregosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JobsProvider()),
        ChangeNotifierProvider(create: (_) => QualificationsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Empregos App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}
