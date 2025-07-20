import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/features/auth/data/model/log_in_request_model.dart';
import 'package:mkr_mart/features/auth/ui/controller/login_controller.dart';
import 'package:mkr_mart/features/auth/ui/screen/sign_up_screen.dart';
import 'package:mkr_mart/features/auth/ui/widgets/app_logo.dart';
import 'package:mkr_mart/features/common/ui/screen/main_bottom_nav_screen.dart';
import 'package:mkr_mart/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:mkr_mart/features/common/ui/widgets/show_snack_bar_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String name = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController _loginController = Get.find<LoginController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  AppLogo(height: 90, width: 90),
                  Text("Welcome back", style: textTheme.titleLarge),
                  Text(
                    "Please enter your Email and password",
                    style: textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: "Enter your Email"),
                    validator: (String? value) {
                      String emailValue = value ?? '';
                      if (EmailValidator.validate(emailValue) == false) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                    ),
                    validator: (String? value) {
                      if ((value?.length ?? 0) <= 4) {
                        return "Enter your password more then 6 or 6 letter";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  GetBuilder<LoginController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: CenterCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTapLoginButton,
                          child: Text("Log in"),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have any account?"),
                      TextButton(
                        onPressed: _onTapSignUpButton,
                        child: Text("Sign up"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  Future<void> _onTapLoginButton() async {
    //Navigator.pushNamed(context, SignUpScreen.name);
    if (_formKey.currentState!.validate()) {
      LogInRequestModel model = LogInRequestModel(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      final bool isSuccess = await _loginController.logIn(model);
      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          MainBottomNavScreen.name,
          (predicate) => false,
        );
      } else {
        ShowSnackBarMessage(
          // ignore: use_build_context_synchronously
          context,
          _loginController.errorMessage!,
          true,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }
}
