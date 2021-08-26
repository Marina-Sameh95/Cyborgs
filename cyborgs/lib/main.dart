import 'package:cyborgs/GUI/RegisterFormScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cyborgs Technology',
        home: Container(
            alignment: Alignment.center,
            child: Container(
               child: SplashScreen(
                seconds: 3,
                backgroundColor: Colors.white,
                loaderColor: Color.fromARGB(250, 81, 182, 136),
                image: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fill,
                ),
                photoSize: 100,
                loadingText: Text(
                  'Loading...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Color.fromARGB(250, 81, 182, 136),
                  ),
                ),
                navigateAfterSeconds: RegisterFormScreen(),

              ),
            ))),
  ));
}
