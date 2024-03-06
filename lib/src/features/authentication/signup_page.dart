import 'package:flutter/material.dart';
import 'package:zipzap/src/app_colors.dart';
import 'package:zipzap/src/features/authentication/login_page.dart';
import 'package:zipzap/src/reusable_widgets/loader.dart';
import 'package:zipzap/src/reusable_widgets/logo_widget.dart';
import 'package:zipzap/src/reusable_widgets/zipzap_button.dart';
import 'package:zipzap/src/reusable_widgets/zipzap_textfield.dart';
import 'package:zipzap/src/utils/validators/regex.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _preferedPasswordController =
      TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;
  bool isLoading = false;
  bool setisLoading = false;

  RegExp emailRegex = RegExp(RegexExpressions().emailPattern);
  RegExp pass = RegExp(RegexExpressions().passregex);
  //String phonePattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
  RegExp phoneregex = RegExp(RegexExpressions().phonePattern);

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return setisLoading == true
        ? const Loader()
        : Scaffold(
            // appBar: CustomAppBar(
            //   logo: const AppBarText(),
            //   title: 'Sign Up'.toUpperCase(),
            // ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: [
                      Form(
                        key: _formKey,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 3),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const LogoWidget(),
                                const SizedBox(height: 20),
                                const Text(
                                  'Sign up for the best all in one experience',
                                  style: TextStyle(
                                      fontSize: 16.0, color: AppColors.white),
                                ),
                                const SizedBox(height: 10),
                                ZizapTextField(
                                  hintText: 'E-mail',
                                  controller: _emailEditingController,
                                  trailing: const Icon(Icons.email),
                                  onChanged: (x) {},
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Must not be empty';
                                    } else if (!emailRegex.hasMatch(value)) {
                                      return 'Please enter a valid Email.';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ZizapTextField(
                                  hintText: 'Phone',
                                  onChanged: (x) {},
                                  trailing: const Icon(Icons.phone),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Must not be empty';
                                    } else if (!phoneregex.hasMatch(value)) {
                                      return 'Please enter a valid phone number.';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ZizapTextField(
                                  hintText: 'Password',
                                  onChanged: (x) {},
                                  controller: _passwordController,
                                  trailing: !_obscureText
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  trailingTapped: () {
                                    _toggle();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Must not be empty';
                                    } else if (_passwordController
                                            .text.length <=
                                        4) {
                                      return 'Password should be more than 4 letters';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ZizapTextField(
                                  hintText: 'Confirm Password',
                                  onChanged: (x) {},
                                  controller: _preferedPasswordController,
                                  trailing: !_obscureText
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  trailingTapped: () {
                                    _toggle();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Must not be empty';
                                    } else if (_preferedPasswordController
                                            .text !=
                                        _passwordController.text) {
                                      return 'passwords do not match';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                ZipzapButton(
                                    child: isLoading
                                        ? const CircularProgressIndicator(
                                            color: AppColors.primaryColor,
                                          )
                                        : const Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.primaryColor),
                                          ),
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          isLoading = true;
                                          setisLoading = true;
                                          Future.delayed(
                                                  const Duration(seconds: 2))
                                              .then((value) => {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return const LoginPage();
                                                    }))
                                                  });
                                        });
                                      }
                                    }),
                                const SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return const LoginPage();
                                    }));
                                  },
                                  child: RichText(
                                      text: const TextSpan(
                                          text: 'Already have an account? ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w300,
                                              color: AppColors.white),
                                          children: [
                                        TextSpan(
                                          text: 'Log in',
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.green),
                                        )
                                      ])),
                                )
                              ],
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 129, 126, 126),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 30,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 234, 228, 228),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
