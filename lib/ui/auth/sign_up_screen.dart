import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/shared/nav.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/app_custom_button.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/gap.dart';
import 'package:halaqat_wasl_manager_app/theme/app_colors.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';
import 'package:halaqat_wasl_manager_app/ui/auth/widgets/auth_text_field_with_label.dart';
import 'package:halaqat_wasl_manager_app/ui/home/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: context.getWidth(multiplied: 0.16),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Gap.gapH64,

                Image.asset(
                  'assets/auth/logo-halaqat-wasl.png',
                  width: context.getWidth(),
                  height: context.getHeight(multiplied: 0.14),
                ),

                Gap.gapH56,

                Container(
                  width: context.getWidth(multiplied: 1),
                  height: context.getHeight(multiplied: 0.62),
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr('sign_up_screen.sign_up_title'),
                        style: AppTextStyle.sfProBold40,
                      ),

                      Gap.gapH8,

                      Text(
                        tr('sign_up_screen.onboarding_text'),
                        style: AppTextStyle.sfPro60020SecondaryColor,
                      ),

                      Gap.gapH32,

                      Form(
                        
                        child: Column(
                          children: [
                            AuthTextFieldWithLabel(
                              label: tr('sign_up_screen.email'),
                              controller: TextEditingController(),
                              onValidate: null,
                            ),

                          Gap.gapH16,

                          AuthTextFieldWithLabel(
                              label: tr('sign_up_screen.password'),
                              controller: TextEditingController(),
                              isPassword: true,
                              onValidate: null,
                            ),

                          Gap.gapH16,

                          AuthTextFieldWithLabel(
                              label: tr('sign_up_screen.charity_number'), 
                              controller: TextEditingController(), 
                              isCharity: true,
                              onValidate: null
                            ),
                          ],
                        )
                      ),

                      Spacer(),

                      AppCustomButton(
                        label: tr('sign_up_screen.sign_up'),
                        buttonColor: AppColors.primaryAppColor,
                        width: context.getWidth(),
                        height: context.getHeight(multiplied: 0.05),
                        onPressed: () {
                          // Check the validation here 

                          // After Checking go to Auth Gate screen and then to Home screen

                          context.moveToWithReplacement(context: context, screen: HomeScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
