import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseconnection/pages/sigin_up_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'services/auth_services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CheckUserPage(),
      routes: {
        LoginPage.id:(context) => const LoginPage(),
        SignUpPage.id:(context) => const SignUpPage(),
        HomePage.id: (context) => const HomePage(),
        CheckUserPage.id: (context) => const CheckUserPage(),
      },
    );
  }
}

class CheckUserPage extends StatelessWidget {
  static const String id = "/check";
  const CheckUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthServices().checkUser(),
      builder: (context, hasan) {
        if (hasan.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if(hasan.hasError){
          return Scaffold(
            body: Center(
              child: Text(hasan.error.toString()),
            ),
          );
        } else {
          final data = hasan.data;

          if(data == null){
            return const LoginPage();
          } else {
            return const HomePage();
          }
        }
      },
    );
  }
}