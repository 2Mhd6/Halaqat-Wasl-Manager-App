import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/shared/nav.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/app_custom_button.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/gap.dart';
import 'package:halaqat_wasl_manager_app/theme/app_colors.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';
import 'package:halaqat_wasl_manager_app/ui/auth/sign_up_screen.dart';
import 'package:halaqat_wasl_manager_app/ui/auth/widgets/auth_text_field_with_label.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: context.getWidth(multiplied: 0.16)),
          child: SingleChildScrollView(
            child: Column(
              children: [

                Gap.gapH64,
        
                Image.asset('assets/auth/logo-halaqat-wasl.png', width: context.getWidth(), height: context.getHeight(multiplied: 0.14)),
        
                Gap.gapH56,
        
                Container(
                  width: context.getWidth(multiplied: 1),
                  height: context.getHeight(multiplied: 0.6),
                  padding: EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tr('login_screen.login_title'), style: AppTextStyle.sfProBold40),
        
                      Gap.gapH8,
                      
                      Text(tr('login_screen.onboarding_text'), style: AppTextStyle.sfPro60020SecondaryColor),
                      
                      Gap.gapH80,
        
                      AuthTextFieldWithLabel(
                        label: tr('login_screen.email'), 
                        controller: TextEditingController(), 
                        onValidate: null
                      ),
        
                      Gap.gapH32,
        
                      AuthTextFieldWithLabel(
                        label: tr('login_screen.password'), 
                        controller: TextEditingController(), 
                        isPassword: true,
                        onValidate: null
                      ),

                      Gap.gapH8,

                      SizedBox(
                        width: context.getWidth(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(tr('login_screen.forget_password',), style: AppTextStyle.sfPro60016ForgetPassword,)
                          ],
                        ),
                      ),
        
                      Spacer(),
        
                      AppCustomButton(
                        label: tr('login_screen.login'), 
                        buttonColor: AppColors.primaryAppColor, 
                        width: context.getWidth(), 
                        height: context.getHeight(multiplied: 0.05),            
                        onPressed: (){
                          context.moveTo(context: context, screen: SignUpScreen());
                        }
                      ),
        
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}