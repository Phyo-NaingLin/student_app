import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import './views/pages/home_page.dart';
import './controllers/student_controller.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Provider Tutorial",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}