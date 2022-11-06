import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:olx_flutter/Homepage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  var colorizeColors = [
    Colors.white,
    Colors.cyan,
  ];

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  bool flag = true;
  var valid = GlobalKey<FormState>();

  auth({required email, required password}) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: (password)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)));
  }

  authLogin({required email, required password}) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: (password)).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),)));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (flag == false) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: valid,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * .2,
                  ),
                  Container(
                      child: Text('LOGIN',
                          style: TextStyle(
                              fontSize: 40,
                              color: Colors.black,
                              debugLabel: "login",
                              fontWeight: FontWeight.bold)),
                      color: Colors.white),
                  SizedBox(
                    height: size.height * .17,
                  ),
                  Container(
                    width: size.width * .89,
                    color: Colors.grey.shade100,
                    child: TextFormField(
                      controller: Email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 95)),
                          hintText: 'Email'),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .04,
                  ),
                  Container(
                    width: size.width * .89,
                    color: Colors.grey.shade100,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'no data';
                        } else if (value.length < 8) {
                          return 'too short';
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: Password,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 95)),
                          hintText: 'Password'),
                    ),
                  ),
                  SizedBox(height: size.height * .07),
                  InkWell(
                      onTap: () {auth(email: Email.text, password: Password.text);


                        if (valid.currentState!.validate()) {
                          print('Clicked');
                        }






                      },
                      child: Container(
                        width: size.width * .35,
                        height: size.width * .09,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.cyan),
                        child: Center(child: Text('Click')),
                      )),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("already a user...!"),
                      InkWell(
                          onTap: () {
                            setState(() {
                              flag = true;
                            });
                          },
                          child: Text(
                            '  login',
                            style: TextStyle(color: Colors.blue),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .2,
                ),
                Container(
                    child: Text('SIGNUP',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            debugLabel: "login",
                            fontWeight: FontWeight.bold)),
                    color: Colors.white),
                SizedBox(
                  height: size.height * .17,
                ),
                Container(
                  width: size.width * .89,
                  color: Colors.grey.shade100,
                  child: TextFormField(
                    controller: Email,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 95)),
                        hintText: 'Email'),
                  ),
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                Container(
                  width: size.width * .89,
                  color: Colors.grey.shade100,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'no data';
                      } else if (value.length < 8) {
                        return 'too short';
                      }
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: Password,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 95)),
                        hintText: 'Password'),
                  ),
                ),
                SizedBox(height: size.height * .07),
                InkWell(
                    onTap: () {

                      authLogin(email: Email.text, password: Password.text);
                      if (valid.currentState!.validate()) {
                        print('Clicked');
                      }
                    },
                    child: Container(
                      width: size.width * .35,
                      height: size.width * .09,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.cyan),
                      child: Center(child: Text('Click')),
                    )),
                SizedBox(
                  height: size.height * .05,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account...!"),
                    InkWell(
                        onTap: () {
                          setState(() {
                            flag = false;
                          });
                        },
                        child: Text(
                          '  login',
                          style: TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
