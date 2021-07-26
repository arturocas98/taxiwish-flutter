import 'package:flutter/material.dart';
import 'package:taxiwish/src/utils/colors.dart';
class ButtonApp extends StatelessWidget {

  Color? color;
  String? text;
  Color? textColor;
  IconData? icon;
  Function? onPressedButton;

  /*ButtonApp(Color color,String text){
    this.color = color;
    this.text = text;
  }*/

  ButtonApp({
    this.color = Colors.black,
    this.textColor = Colors.white,
    this.icon  = Icons.arrow_forward_ios ,
    this.onPressedButton,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        onPressedButton!();
      },
      color: color,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child:Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                    text!,
                    style: TextStyle(
                      fontSize: 16
                    ),
                )
            )
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 50,
              child: CircleAvatar(
                radius: 15,
                child: Icon(
                    icon,
                    color: colors.primaryColor,

                ),
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
        textColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      )
    );
  }
}
