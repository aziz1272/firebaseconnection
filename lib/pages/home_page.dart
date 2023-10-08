import 'package:firebaseconnection/services/auth_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthServices ser = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Asosiy"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Email: azizbek@gmail.com",
                  style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Parol: 280604",
                  style: TextStyle(color: Colors.greenAccent, fontSize: 16),
                ),
                const SizedBox(
                  height: 76,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all(Colors.greenAccent),
                      overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                      elevation: MaterialStateProperty.all(2),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      tapTargetSize: MaterialTapTargetSize.padded),
                  onPressed: (){
                    AuthServices service = AuthServices();
                    service.logout(context);
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
