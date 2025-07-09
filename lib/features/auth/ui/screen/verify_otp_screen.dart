import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/features/auth/data/model/verify_otp_request_model.dart';
import 'package:mkr_mart/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:mkr_mart/features/auth/ui/widgets/app_logo.dart';
import 'package:mkr_mart/features/common/ui/screen/main_bottom_nav_screen.dart';
import 'package:mkr_mart/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:mkr_mart/features/common/ui/widgets/show_snack_bar_message.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});
  final String email;

  static final String name = "/verify-otp";

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  String? otp;

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
                  SizedBox(height: 100),
                  AppLogo(height: 90, width: 90),
                  Text("Verify Otp", style: textTheme.titleLarge),
                  Text(
                    "we already send a 4 digit pin to this ${widget.email} ",
                    textAlign: TextAlign.center,
                    style: textTheme.headlineMedium,
                  ),
                  SizedBox(height: 24),
                  PinCodeTextField(
                    controller: _otpController,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    appContext: context,
                    keyboardType: TextInputType.number,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 45,
                      fieldWidth: 40,
                    ),
                    validator: (String? value) {
                      if (value == null || value.length < 4) {
                        return "please insert otp";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 16),
                  GetBuilder<VerifyOtpController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: CenterCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTapVerifyButton,
                          child: Text("Verify Otp"),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapVerifyButton() async {
    otp = _otpController.text.trim();
    if (_formKey.currentState!.validate()) {
      VerifyOtpRequestModel model = VerifyOtpRequestModel(
        email: widget.email,
        otp: otp!,
      );
      final bool isSuccess = await Get.find<VerifyOtpController>().verifyOtp(
        model,
      );

      if (isSuccess) {
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          MainBottomNavScreen.name,
          (predicate) => false,
        );
        ShowSnackBarMessage(
          // ignore: use_build_context_synchronously
          context,
          "Congratulations,Otp successfully verify",
        );
      } else {
        ShowSnackBarMessage(
          // ignore: use_build_context_synchronously
          context,
          Get.find<VerifyOtpController>().errorMessage!,
          true,
        );
      }
    }
  }

  // @override
  // void dispose() {
  //   _otpController.dispose();

  //   super.dispose();
  // }
}
