import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:halaqat_wasl_manager_app/data/charity_data.dart';
import 'package:halaqat_wasl_manager_app/extensions/screen_size.dart';
import 'package:halaqat_wasl_manager_app/repo/charity/charity_operation_repo.dart';
import 'package:halaqat_wasl_manager_app/shared/nav.dart';
import 'package:halaqat_wasl_manager_app/shared/set_up.dart';
import 'package:halaqat_wasl_manager_app/shared/widgets/app_custom_button.dart';
import 'package:halaqat_wasl_manager_app/theme/app_colors.dart';
import 'package:halaqat_wasl_manager_app/theme/app_text_style.dart';
import 'package:halaqat_wasl_manager_app/ui/auth/log_in_screen.dart';
import 'package:halaqat_wasl_manager_app/ui/home/home_screen.dart';

class AuthGateScreen extends StatelessWidget {
  const AuthGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: SetupSupabase.sharedSupabase.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final authState = snapshot.data;

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (authState == null || authState.session == null) {
          return LogInScreen();
        }

        

        return FutureBuilder(
          future: CharityOperationRepo.gettingCharityDataFromDB(),
          builder: (context, userSnapshot) {
            if (userSnapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(body: Center(child: CircularProgressIndicator()));
            }

            if (userSnapshot.hasError || !userSnapshot.hasData) {
              return Scaffold(
                body: SizedBox(
                  width: context.getWidth(),
                  child: Column(
                    spacing: 24,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'You\'re not authorized to get in with this app',
                        style: AppTextStyle.sfPro60048,
                      ),

                      AppCustomButton(
                        label: 'Sign up as Charity',
                        buttonColor: AppColors.primaryAppColor,
                        width: context.getWidth(multiplied: 0.3),
                        height: context.getHeight(multiplied: 0.045),
                        onPressed: () {
                          context.moveToWithReplacement(
                            context: context,
                            screen: LogInScreen(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }

            final charity = userSnapshot.data!;
            final role = charity.role;

            GetIt.I.get<CharityData>().charity = charity;

            if (role == 'charity') {
              return HomeScreen();
            } else {
              return Scaffold(
                body: Center(child: Text('You need to go $role app')),
              ); // or driver screen
            }
          },
        );
      },
    );
  }
}
