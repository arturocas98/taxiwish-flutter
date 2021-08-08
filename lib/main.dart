import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taxiwish/src/pages/home/home_page.dart';
import 'package:taxiwish/src/pages/login/login_page.dart';
import 'package:taxiwish/src/pages/register/register_page.dart';
import 'package:taxiwish/src/utils/colors.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TaxiWish",
      initialRoute: 'home',
      theme: ThemeData(
        fontFamily: 'NimbusSans',
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        primaryColor: colors.primaryColor
      ),
      routes: {
        'home':(BuildContext context)=>HomePage(),
        'login':(BuildContext context)=>LoginPage(),
        'register': (BuildContext context)=> RegisterPage()
      },
    );
  }

}
