import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shasfacrm/const/rkconst.dart';
import 'package:shasfacrm/screens/desktope/mainpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String validEmail = "reza_asong";
  String validPassword = "1234";
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  StateMachineController? controller;
  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.dispose();
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    const double width = 400;
    return Container(
      decoration: BoxDecoration(color: RKConst.bgcolor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            width: width,
            height: 500,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SizedBox(
                    height: width,
                    width: width,
                    child: RiveAnimation.asset(
                      "assets/login_bear.riv",
                      fit: BoxFit.fitWidth,
                      onInit: (artboard) {
                        controller = StateMachineController.fromArtboard(
                          artboard,

                          /// from rive, you can see it in rive editor
                          "Login Machine",
                        );
                        if (controller == null) return;

                        artboard.addController(controller!);
                        isChecking = controller?.findInput("isChecking");
                        numLook = controller?.findInput("numLook")?..change(90);
                        isHandsUp = controller?.findInput("isHandsUp");
                        trigSuccess = controller?.findInput("trigSuccess");
                        trigFail = controller?.findInput("trigFail");
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: width,
                    decoration: ShapeDecoration(
                      color: RKConst.cardcolor,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 0.50, color: RKConst.bordercolor),
                          borderRadius: RKConst.borderRadius),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          maxLength: 20,
                          buildCounter: (context,
                                  {currentLength = 0,
                                  isFocused = false,
                                  maxLength = 20}) =>
                              const SizedBox(),
                          focusNode: emailFocusNode,
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "نام کاربری",
                            suffixIcon: Icon(
                              Icons.person_4_rounded,
                              size: 20,
                            ),
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                          onChanged: (value) {
                            numLook?.change(90 - (value * 2).length.toDouble());
                          },
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          maxLength: 20,
                          buildCounter: (context,
                                  {currentLength = 0,
                                  isFocused = false,
                                  maxLength = 20}) =>
                              const SizedBox(),
                          focusNode: passwordFocusNode,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: "رمز عبور",
                            suffixIcon: Icon(
                              Icons.lock,
                              size: 20,
                            ),
                          ),
                          obscureText: true,
                          style: Theme.of(context).textTheme.bodyMedium,
                          onChanged: (value) {},
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'رمز عبور را فراموش کرده اید؟',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: RKConst.purplecolor,
                              borderRadius: RKConst.borderRadius),
                          child: ElevatedButton(
                            onPressed: _submit,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.subdirectory_arrow_left_rounded),
                                SizedBox(width: 5),
                                Text("ورود به سیستم"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submit() async {
    FocusScope.of(context).unfocus();
    await Future.delayed(const Duration(milliseconds: 1500));
    final email = emailController.text;
    final password = passwordController.text;

    if (email == validEmail && password == validPassword) {
      trigSuccess?.change(true);
      await Future.delayed(const Duration(milliseconds: 600));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainPage(),
          ));
    } else {
      trigFail?.change(true);
    }
  }
}
