import 'package:bsppl/Utils/routes/routes_name.dart';
import 'package:bsppl/features/Dashboard/presentation/page/dashboard_page.dart';
import 'package:bsppl/features/Home/presentation/page/home_page.dart';
import 'package:bsppl/features/Login/presentation/login_view.dart';
import 'package:bsppl/features/QrCodeScanner/presentation/qr_code_scanner_page.dart';
import 'package:bsppl/features/Splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashView:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());
      case RoutesName.loginView:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.homePage:
        return MaterialPageRoute(builder: (BuildContext context) => const HomePage());
      case RoutesName.dashboardView:
        return MaterialPageRoute(builder: (BuildContext context) => const DashboardView());
      case RoutesName.qrCodeScanner:
        return MaterialPageRoute(builder: (BuildContext context) => const QrCodeScannerPage());
      /*case RoutesName.customerRegistrationFormPage:
        return MaterialPageRoute(builder: (BuildContext context) => const CustomerRegistrationFormPage());
      case RoutesName.viewSyncRecordPage:
        return MaterialPageRoute(builder: (BuildContext context) => const ViewSyncRecordPage());*/
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
