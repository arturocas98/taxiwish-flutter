import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:taxiwish/src/pages/login/login_controller.dart';
import 'package:taxiwish/src/utils/colors.dart';
import 'package:taxiwish/src/widgets/button_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    
  LoginController loginController = new LoginController();

  @override
  void initState() {
    // TODO: implement initStat
    print('init state');
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      print('metodo scheduler');
      loginController.init(context);
    });

  }

  @override
  Widget build(BuildContext context) {
    print('metodo build');
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(context),
            _textDescription(),
            _textLogin(),
            SizedBox(height:MediaQuery.of(context).size.height * 0.12),
            _textFieldCorreo(),
            _textFieldContrasena(),
            _buttonLogin(),
            _textTieneCuenta()
          ],
        ),
      )
    );
  }

  Widget _bannerApp(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: colors.primaryColor,
        height: MediaQuery.of(context).size.height * 0.22,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/img/taxiwish_logo_white.png",
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

  Widget _textDescription(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
      child: Text(
        'Continua con tu',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 24,
          fontFamily: 'NimbusSans'
        ),
      ),
    );
  }

  Widget _textLogin(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'LOGIN',
        style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _textFieldCorreo(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
          controller: loginController.emailController,
          decoration: InputDecoration(
            labelText: 'Correo',
            suffixIcon: Icon(
              Icons.email_outlined,
              color:colors.primaryColor
            )
          ),

      ),
    );
  }

  Widget _textFieldContrasena(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical:15),
      child: TextField(
        controller: loginController.passwordController,
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: Icon(
                Icons.remove_red_eye,
                color:colors.primaryColor
            )
        ),
      ),
    );
  }

  Widget _buttonLogin(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25,horizontal: 30),
      child: ButtonApp(
          onPressedButton: loginController.login,
          color:colors.primaryColor,
          text:'Iniciar Sesión',

      ),
    );
  }

  Widget _textTieneCuenta(){
    return Container(
      margin: EdgeInsets.only(bottom: 60),
      child: Text(
        'No tienes cuenta?',
        style: TextStyle(
          fontSize: 15,
          color:Colors.grey
        ),
      ),
    );
  }

}
