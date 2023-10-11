
import 'package:flutter/material.dart';
import 'package:scr/src/constants/images.dart';
import 'package:scr/src/constants/sizes.dart';
import 'package:scr/src/constants/texts.dart';
import 'package:scr/src/constants/colors.dart';
import 'package:scr/src/features/controllers/user_controller.dart';
import 'package:scr/src/features/models/model_user.dart';
import 'package:uuid/uuid.dart';

bool obscureText = false;

class RegisterScreen extends StatefulWidget {
  final String productId;
  const RegisterScreen({Key? key,
 required this.productId}
  ) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late Size mediaSize;
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupPasswordController =TextEditingController();
  TextEditingController signupNameController =TextEditingController();
  bool rememberUser = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    signupEmailController.dispose();
    signupPasswordController.dispose();
    signupNameController.dispose();
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
            child: _buildFormSignUp()),
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
             _buildInputField(tName, signupNameController),
            const SizedBox(
              height: tFormHeight - 15,
            ),
            _buildInputField(tEmail, signupEmailController),
            const SizedBox(
              height: tFormHeight - 15,
            ),
            _buildPasswordInputField(tPassword, signupPasswordController),
            const SizedBox(
              height: tFormHeight - 15,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    User user = User(
                      id: const Uuid().v4(),
                      name: signupNameController.text,
                      email: signupEmailController.text,
                      password: signupPasswordController.text,
                      gender: 1,
                      status: 1,
                      productId: widget.productId
                    );
                    signUp(context, user);
                  },
                  child: Text(tSignUp.toUpperCase()),
                )),
            const SizedBox(
              height: tFormHeight - 10,
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
