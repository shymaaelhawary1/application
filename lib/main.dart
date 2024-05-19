import 'package:application/core/cubit/parent_cubit.dart';
import 'package:application/core/my%20theme.dart';
import 'package:application/featuers/authentication/login/veiw/page/login_page.dart';
import 'package:application/featuers/authentication/onboarding/view/page/onboarding_page.dart';
import 'package:application/featuers/authentication/registration/view/page/registration_page.dart';
import 'package:application/featuers/dashboard/model/card/veiw/page/card_page.dart';
import 'package:application/featuers/dashboard/model/orderMenu/veiw/OrderMenu_page.dart';
import 'package:application/featuers/dashboard/veiw/dashboard_Page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(onBoarding: onBoarding),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool onBoarding;

  const MyApp({Key? key, required this.onBoarding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParentCubit.instance,
      child: BlocBuilder<ParentCubit, ParentState>(
        builder: (context, state) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            useInheritedMediaQuery: true,
            initialRoute: onBoarding ? 'dashboard' : 'onboarding', 
            onGenerateRoute: MyRoutes.onGenerateRoute,
            theme: MyTheme.instance.light,
            darkTheme: MyTheme.instance.dark,
            themeMode: ParentCubit.instance.themeMode,
          );
        },
      ),
    );
  }
}

class MyRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'dashboard':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const DashboardPage(),
        );

      case 'onboarding':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnBoardingPage(),
        );

      case 'new_product':
        return MaterialPageRoute(builder: (_) => const NewProductPage());

      case 'login':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const LoginPage(),
        );

      case 'registration':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const RegistrationPage(),
        );

      case 'card':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ReservationPage(),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnBoardingPage(),
        );
    }
  }
}
