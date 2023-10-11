import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scr/src/constants/images.dart';
import 'package:scr/src/constants/sizes.dart';
import 'package:scr/src/constants/texts.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/features/controllers/user_controller.dart';
import 'package:scr/src/features/screens/login/pre_use_screen.dart';

int _signInActive = 1;
bool obscureText = false;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController enterCodeController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController =TextEditingController();
  TextEditingController signupRePasswordController =TextEditingController();
  bool rememberUser = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    emailController.dispose();
    passwordController.dispose();
    enterCodeController.dispose();
    signupEmailController.dispose();
    signupPasswordController.dispose();
    signupRePasswordController.dispose();
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

  // Widget changePage(BuildContext context) {
  //   Widget child;
  //   if (_signInActive == 0) {
  //     child = _buildFormSignUp();
  //   } else if (_signInActive == 1) {
  //     child = _buildFormLogin();
  //   } else {
  //     child = _buildFormCodeInput();
  //   }
  //   return child;
  // }

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
            child: _buildFormLogin()),
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
            _buildPasswordInputField(tPassword, passwordController),
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
                    String email = emailController.text;
                    String password = passwordController.text;
                    login(context, email, password);
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>const PreUse(),
                                  ),
                                );
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
            _buildInputField(tEmail, signupEmailController),
            const SizedBox(
              height: tFormHeight - 15,
            ),
            _buildPasswordInputField(tPassword, signupPasswordController),
            const SizedBox(
              height: tFormHeight - 15,
            ),
            _buildPasswordInputField(tConfirmPassword, signupRePasswordController),
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
                                setState(() {_signInActive = 1;});
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
              "Please input your code int the Kit to use out app",
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
                    setState(() {_signInActive = 0;});
                  },
                  child: Text("Buy Now".toUpperCase()),
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
                                setState(() {_signInActive = 1;});
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

  Widget _buildPasswordInputField(String text, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      obscureText : obscureText,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.fingerprint),
          labelText: text,
          hintText: text,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            onPressed: (){
              setState(() {
              obscureText = !obscureText;
            });
              print(obscureText);},
            icon: const Icon(Icons.remove_red_eye_sharp),
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
