import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_managemnet/core/routing/app_router.dart';
import 'package:food_managemnet/core/routing/routes.dart';
import 'package:food_managemnet/views/home_screens/home_screen.dart';
import 'package:food_managemnet/views/authentication_screens/register_screen.dart';
import 'package:food_managemnet/views/welcome_screen.dart';
import 'package:get/get.dart';

class FoodManagementApp extends StatelessWidget {
  const FoodManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FOOD MANAGEMENT APP',
          supportedLocales: [
            Locale('en'),
            Locale('ar')
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          localeResolutionCallback: (deviceLocale, supportedLocals) {
            //this function will determine the initial language of the application
            // if the Device language is supported  then we relay on it else we will take supportedLocals[0]
            for (var locale in supportedLocals) {
              if (deviceLocale != null &&
                  deviceLocale.languageCode == locale.languageCode) {
                return deviceLocale;
              }
            }

            return supportedLocals.first;
          },
          //home: child,
          initialRoute: Routes.homeScreen,
          routes: AppRouter.routes,

        );
      },
      child: WelcomeScreen(),
    );
  }
}
