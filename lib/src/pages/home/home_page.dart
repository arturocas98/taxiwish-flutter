import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:taxiwish/src/pages/home/home_controller.dart';
import 'package:taxiwish/src/utils/colors.dart';

class HomePage extends StatelessWidget {
  HomeController homeController = new HomeController();


  @override
  Widget build(BuildContext context) {
    homeController.init(context);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            color: colors.primaryColor,
            child: Column(
              children: [
                _bannerApp(context),
                SizedBox(height: 50),
                _textSelectYourRol(),
                SizedBox(height: 30),
                _imageTypeUser('assets/img/pasajero.png',context),
                SizedBox(
                  height: 10,
                ),
                textTypeUser("Cliente"),
                SizedBox(height: 30),
                _imageTypeUser('assets/img/driver.png',context),
                SizedBox(
                  height: 10,
                ),
                textTypeUser("Conductor")
              ],
            ),
          ),
        )
    );
  }

  Widget _bannerApp(BuildContext context) {
    return ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height * 0.30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/img/taxiwish_logo.png",
              width: 150,
              height: 100,
            ),
            Text(
              "Fácil y rápido",
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }

  Widget _textSelectYourRol() {
    return Text(
      'SELECCIONA TU ROL',
      style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'OneDay'),
    );
  }

  Widget _imageTypeUser(String image,BuildContext context) {
    return GestureDetector(
      onTap: homeController.goToLoginPage,
      child: CircleAvatar(
        backgroundImage: AssetImage(image),
        radius: 50,
        backgroundColor: Colors.grey[900],
      ),
    );
  }

  Widget textTypeUser(String typeUser) {
    return Text(
      typeUser,
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
  }

/*decoration: BoxDecoration(
  gradient: LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [Colors.white30, colors.primaryColor]
  )
  ),*/
}
