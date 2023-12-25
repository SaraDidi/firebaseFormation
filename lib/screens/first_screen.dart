import 'package:flutter/material.dart';
import 'package:flutter_application_formatiom/screens/sign_up_screen.dart';
import '../app_constants.dart';
import '../config.dart';
import '../widget/my_button.dart';
import 'login_screen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: AppBar().preferredSize.height * 3),
            Image.network(
            'https://firebasestorage.googleapis.com/v0/b/smart-formation.appspot.com/o/chaise.png?alt=media&token=309598ac-4062-42d6-b3b2-a6a6404359de'),
            SizedBox(height: fullHeight(context) * 0.03),
            Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: fullWidth(context) * 0.07),
                child: Text(
                  "Optimize your space using tech and creativity in africa",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize10(context) * 1.65),
                )),
            SizedBox(height: fullHeight(context) * 0.03),
            Center(
              child: Text("Fitting your furnitures in your space before buying",
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                      fontSize: fontSize10(context))),
            ),
            SizedBox(height: fullHeight(context) * 0.04),
            MyButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                title: 'Log In'),
            SizedBox(height: fullHeight(context) * 0.02),
            MyButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                );
              },
              title: 'Sign Up',
              color: AppConstants.buttonColor.withOpacity(0.9),
              textColor: AppConstants.secondColor,
            ),
            SizedBox(height: fullHeight(context) * 0.03),
            Center(
              child: SizedBox(
                width: fullWidth(context) * 0.75,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "By tapping Create Account and using Minifurs, you agree to our ",
                    style: TextStyle(
                        fontSize: fontSize10(context) * 0.85,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600),
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Terms of Service & Privacy Policy',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
