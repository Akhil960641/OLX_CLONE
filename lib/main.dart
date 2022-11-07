import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:olx_flutter/Flash_screen.dart';
import 'package:olx_flutter/Login_page.dart';


import 'Homepage.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
 // WidgetsFlutterBinding();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context,AsyncSnapshot snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  FlashScreen(

            ),
          );
        }else{
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: Colors.cyan[900]),

            home:StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomePage(
                      
                    );
                  }
                  else{
                    return LoginPage();

                  }

                }
            ),
          );
        }

    },);
  }
}
