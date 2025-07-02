import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:halaqat_wasl_manager_app/shared/set_up.dart';
import 'package:halaqat_wasl_manager_app/theme/app_theme.dart';
import 'package:halaqat_wasl_manager_app/ui/auth/bloc/auth_bloc.dart';
import 'package:halaqat_wasl_manager_app/ui/auth/log_in_screen.dart';
import 'package:halaqat_wasl_manager_app/ui/auth/sign_up_screen.dart';
import 'package:halaqat_wasl_manager_app/ui/home/home_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
  ]);
  
  await dotenv.load(fileName: '.env');

  await SetupSupabase.setUpSupabase();

  await EasyLocalization.ensureInitialized();

    runApp(
      EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
      path:'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: LogInScreen(),
      );
  }
}