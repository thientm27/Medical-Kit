import 'package:flutter/material.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/constants/images.dart';
import 'package:scr/src/features/screens/login/login_screen.dart';
import 'package:scr/src/features/controllers/user_controller.dart';
class PreUse extends StatefulWidget {
  const PreUse({Key? key}) : super(key: key);

  @override
  _PreUseState createState() => _PreUseState();
}

class _PreUseState extends State<PreUse> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: tOnBoardingPage1Color,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            Image(
              image: const AssetImage(logo),
              height: size.height * 0.2,
            ),
            const SizedBox(height: 20.0), // Add some spacing between the image and text input
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textController, // Assign the controller to the TextField
                decoration: const  InputDecoration(
                  labelText: "Enter Your Code Here!", // Placeholder text for the input field
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final enteredText = _textController.text;
                preLogin(context, enteredText);
              },
              child:const Text("Sign up!"),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to another page when the text is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const LoginScreen(),
                  ),
                );
              },
              child:const Text(
                "If you are already a user, log in here!",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
