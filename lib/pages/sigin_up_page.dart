import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseconnection/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/auth_services.dart';
class SignUpPage extends StatefulWidget {
  static const String id = "sign_up_page";
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  User? user;

  signIn() async {
    UserModel model = UserModel(
      email: emailController.text.trim(),
      password: passController.text.trim(),
    );
    AuthServices services = AuthServices();
    services.login(model).then((value) {
      setState(() {
        user = value;
      });
    });
  }


  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, LoginPage.id);
          },
          icon: const Icon(Icons.arrow_back,color: Colors.greenAccent,),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.words,
                controller: nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  errorBorder: InputBorder.none,
                  hintText: "Ismingizni kiriting",
                  hintStyle: TextStyle(color: Colors.black45),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      )),
                  labelText: "Ismingizni kiriting",
                  labelStyle: TextStyle(
                    color: Colors.greenAccent,
                  ),
                ),
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Ismingizni kiritmadingiz";
                  }
                  return null;
                },
              ),
              SizedBox(height: 36,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textCapitalization: TextCapitalization.words,
                controller: emailController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  errorBorder: InputBorder.none,
                  hintText: "Emailni kiriting",
                  hintStyle: TextStyle(color: Colors.black45),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      )),
                  labelText: "Emailni kiriting",
                  labelStyle: TextStyle(
                    color: Colors.greenAccent,
                  ),
                ),
                onSaved: (String? value) {},
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Iltimos emailingizni qaytadan kiritib ko'ring";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 36),
              TextFormField(
                obscureText: _obscureText,
                obscuringCharacter: '*',
                keyboardType: TextInputType.visiblePassword,
                controller: passController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  errorBorder: InputBorder.none,
                  hintText: "Parolni kiriting",
                  hintStyle: const TextStyle(color: Colors.black45),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  focusedErrorBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.red)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      )),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.blue,
                      )),
                  labelText: "Parolni kiriting",
                  labelStyle: const TextStyle(
                    color: Colors.greenAccent,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.black87
                    ),
                    onPressed: _toggle,
                  ),
                ),
                onSaved: (String? value) {},
                validator: (String? value) {
                  if(value!.isEmpty){
                    return "Parolni noto'g'ri kiritdingiz";
                  }
                },
              ),
              const SizedBox(height: 36),
              ElevatedButton(
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.greenAccent),
                    overlayColor: MaterialStateProperty.all(Colors.greenAccent),
                    elevation: MaterialStateProperty.all(2),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    tapTargetSize: MaterialTapTargetSize.padded),
                onPressed: (){
                  if (_formKey.currentState!.validate()) {}
                  signIn();
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
