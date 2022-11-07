import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.white,
      Colors.cyan,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 30.0,
      fontFamily: 'lato',
    );

return Scaffold(
      backgroundColor: Colors.cyan,
      body:Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/Logo.png',color:Colors.white,height: 70,width: 50),
            SizedBox(height: 10,),
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText(
              'Buy or Sell',
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
          onTap: () {
            print("Tap Event");
          },
        ),

          ],
        ),
      ) ,
    );
  }
}
