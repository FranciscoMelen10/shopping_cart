import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/Logo.svg', height: 250),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.black), 
              ),
              child: Text("Sign In", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
