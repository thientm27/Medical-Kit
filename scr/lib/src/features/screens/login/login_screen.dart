import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scr/src/constants/images.dart';
import 'package:scr/src/constants/sizes.dart';
import 'package:scr/src/constants/texts.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/features/screens/mainpage/main_page.dart';

bool _signInActive = true;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

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
            child: _signInActive ? _buildFormLogin() : _buildFormSignUp()),
      ),
    );
  }

  Widget _buildFormLogin() {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              tLogin,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            _buildInputField(tEmail, emailController),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            _buildInputField(tPassword, passwordController, isPassword: true),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            _buildRememberForgot(),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const HomePage()));
                  },
                  child: Text(tLogin.toUpperCase()),
                )),
            const SizedBox(
              width: double.infinity,
              height: tFormHeight - 10,
            ),
            Center(
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "OR",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: tFormHeight - 10,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text.rich(
                    TextSpan(
                      text: tDontHaveAccount,
                      style: Theme.of(context).textTheme.bodyLarge,
                      children: [
                        TextSpan(
                            text: " $tSignUp",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  _signInActive = false;
                                });
                              }),
                      ]
                    ),
                  ),
                ),
              ],
            ),)
          ],
        ),
      ),
    );
  }

  Widget _buildFormSignUp() {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              tSignUp,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            _buildInputField(tEmail, emailController),
            const SizedBox(
              height: tFormHeight - 15,
            ),
            _buildInputField(tPassword, passwordController, isPassword: true),
            const SizedBox(
              height: tFormHeight - 15,
            ),
            _buildInputField(tConfirmPassword, passwordController, isPassword: true),
            const SizedBox(
              height: tFormHeight+10,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {        
                  },
                  child: Text(tSignUp.toUpperCase()),
                )),
            const SizedBox(
              height: tFormHeight - 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                                setState(() {_signInActive = true;});
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

  Widget _buildInputField(String text, TextEditingController controller,
      {isPassword = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: isPassword
              ? const Icon(Icons.fingerprint)
              : const Icon(Icons.person_outline_outlined),
          labelText: text,
          hintText: text,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: null,
            icon: isPassword
                ? const Icon(Icons.remove_red_eye_sharp)
                : const Icon(null),
          )),
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 0.7,
              child: Checkbox(
                  value: rememberUser,
                  onChanged: (value) {
                    setState(() {
                      rememberUser = value!;
                    });
                  }),
            ),
            const Text(
              "Remember me",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            )
          ],
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              tForgotPassword,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ))
      ],
    );
  }
}
