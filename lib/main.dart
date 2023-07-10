import 'package:bus_ticket_reseravtion_app/screen/available_bus_list.dart';
import 'package:bus_ticket_reseravtion_app/screen/booking_screen.dart';
import 'package:bus_ticket_reseravtion_app/screen/home_screen.dart';
import 'package:bus_ticket_reseravtion_app/screen/signin_screen.dart';
import 'package:bus_ticket_reseravtion_app/screen/signup_screen.dart';
import 'package:bus_ticket_reseravtion_app/screen/splash_screen.dart';
import 'package:bus_ticket_reseravtion_app/screen/ticket_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'constant/app_color.dart';
import 'constant/app_routes_constant.dart';
import 'controller/auth_controller.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(428, 926),
      useInheritedMediaQuery: true,
      builder: (context, index) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutesConstant.splash,
          theme: ThemeData(
            primarySwatch: AppColors.colorPrimarySwatch,
          ),
          getPages: [
            GetPage(
                name: AppRoutesConstant.splash,
                page: () => const AppSplashScreen()),
            GetPage(name: AppRoutesConstant.signup, page: () => SignupPage()),
            GetPage(name: AppRoutesConstant.login, page: () => SignInScreen()),
            GetPage(name: AppRoutesConstant.homePage, page: () => HomeScreen()),
            GetPage(name: AppRoutesConstant.busList, page: () => AvailableBusList()),
            GetPage(name: AppRoutesConstant.ticketBooking, page: () => TicketBookingScreen()),
            GetPage(name: AppRoutesConstant.ticket, page: () => TicketDetailsPage()),
          ],
        );
      },
    );
  }
}
