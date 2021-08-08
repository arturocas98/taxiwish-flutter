import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:taxiwish/src/pages/register/register_controller.dart';
import 'package:taxiwish/src/utils/colors.dart';
import 'package:taxiwish/src/widgets/button_app.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterController registerController = new RegisterController();
  bool _obscureText = true;
  bool _obscureConfirmText = true;
  void _showPassword() {
    setState(() {
      _obscureText = !_obscureText;

    });
  }

  void _showConfirmPassword() {
    setState(() {
      _obscureConfirmText = !_obscureConfirmText;
    });
  }

  @override
  void initState() {
    // TODO: implement initStat
    print('init state');
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      print('metodo scheduler');
      registerController.init(context);
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
              _textLogin(),

              _textFieldUsername(),
              _textFieldCorreo(),
              _textFieldContrasena(),
              _textFieldConfirmContrasena(),
              _buttonLogin()
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



  Widget _textLogin(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30,vertical:15),
      child: Text(
        'REGISTRATE',
        style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _textFieldCorreo(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: registerController.emailController,
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
        controller: registerController.passwordController,
        obscureText: _obscureText,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: GestureDetector(
              onTap: _showPassword,
              child: Icon(
                  _obscureText ?Icons.visibility : Icons.visibility_off,
                  color:colors.primaryColor
              ),
            )
        ),
      ),
    );
  }

  Widget _textFieldUsername(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical:10),
      child: TextField(
        controller: registerController.usernameController,
        decoration: InputDecoration(
            hintText : "Usuario123",
            labelText: 'Nombre de usuario',
            suffixIcon: Icon(
                Icons.person_outline,
                color:colors.primaryColor
            )
        ),

      ),
    );
  }

  Widget _textFieldConfirmContrasena(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical:15),
      child: TextField(
        controller: registerController.confirmpasswordController,
        obscureText: _obscureConfirmText,
        decoration: InputDecoration(
            labelText: 'Confirmar contraseña',
            suffixIcon: GestureDetector(
              onTap : _showConfirmPassword,
              child: Icon(
                  _obscureConfirmText ?Icons.visibility : Icons.visibility_off,
                  color:colors.primaryColor
              ),
            )
        ),
      ),
    );
  }

  Widget _buttonLogin(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25,horizontal: 30),
      child: ButtonApp(
        onPressedButton: registerController.register,
        color:colors.primaryColor,
        text:'Registrate',

      ),
    );
  }
}
