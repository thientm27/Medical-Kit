import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/constants/images.dart';
import 'package:scr/src/features/screens/login/login_screen.dart';
import 'package:scr/src/features/controllers/user_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/sizes.dart';
import '../../../constants/texts.dart';
class PreUse extends StatefulWidget {
  const PreUse({Key? key}) : super(key: key);

  @override
  State<PreUse> createState() => _PreUseState();
}

launchURL() async {
  const url = 'https://hvpexe.github.io/Medkit-landingpage/index.html';
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

class _PreUseState extends State<PreUse> {
  late Size mediaSize;
  final TextEditingController enterCodeController = TextEditingController();

  @override
  void dispose() {
    enterCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    mediaSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: tOnBoardingPage1Color,
        body: Stack(
          children: [
            Positioned(top: 30, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Image(
        image: AssetImage(logo),
        height: 150,
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
        width: mediaSize.width,
        height: 520,
        child: Card(
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
    )),
    child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: _buildFormCodeInput()),
    ),
    );
  }

  Widget _buildFormCodeInput() {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Input Code",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            _buildInputField("Enter your code here", enterCodeController),
            const SizedBox(
              height: tFormHeight-20,
            ),
            const Text(
              "Please input your code int the Kit to use our app",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: tFormHeight+10,
            ),
            const SizedBox(
              height: tFormHeight - 10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final enteredText = enterCodeController.text;
                    preLogin(context, enteredText);
                  },
                  child: Text("Sign up".toUpperCase()),
                )),
            const SizedBox(
              height: tFormHeight - 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    launchURL();
                  },
                  child:const Text('Buy now!'),
                  ),
                const SizedBox(
                  width: double.infinity,
                  height: tFormHeight - 10,
                ),
                TextButton(
                  onPressed: () {
                  },
                  child: Text.rich(
                    TextSpan(
                      text: tHaveAccount,
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                            text: " $tLogin",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>const LoginScreen(),
                                  ),
                                );
                              }
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String text, TextEditingController controller ) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person_outline_outlined),
          labelText: text,
          hintText: text,
          border: const OutlineInputBorder(),
          suffixIcon: const IconButton(
            onPressed: null,
            icon: Icon(null),
          )),
    );
  }

}


