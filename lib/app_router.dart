import 'package:diploma/boaring_screen.dart';
import 'package:diploma/screens/auth/login_screen.dart';
import 'package:diploma/screens/auth/signup_screen.dart';
import 'package:diploma/screens/home/profile_page.dart';
import 'package:diploma/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case '/boarding':
        return MaterialPageRoute(
          builder: (_) => const BoardingScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => ProfilePage(email: "", phone: ""),
        );
      case '/signup':
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      // case '/profile/details':
      //   return MaterialPageRoute(
      //     builder: (_) => const DetailsScreen(),
      //   );
      // case '/profile/pin':
      //   return MaterialPageRoute(
      //     builder: (_) => PinChangeScreen(),
      //   );
      // case '/profile/registration':
      //   return MaterialPageRoute(
      //     builder: (_) => const RegistrationScreen(),
      //   );
      // case '/profile/complaint':
      //   return MaterialPageRoute(
      //     builder: (_) => const ComplaintScreen(),
      //   );
      // case '/profile/kiosk':
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => KioskCubit(UserService()),
      //       child: KioskScreen(),
      //     ),
      //   );
      // case '/profile/ebarimt':
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => EbarimtCubit(UserService()),
      //       child: const EbarimtScreen(),
      //     ),
      //   );
      // case '/profile/help':
      //   return MaterialPageRoute(
      //     builder: (_) => const HelpScreen(),
      //   );
      // case '/profile/contact':
      //   return MaterialPageRoute(
      //     builder: (_) => const ContactWebScreen(),
      //   );
      // case '/profile/terms':
      //   return MaterialPageRoute(builder: (_) => const TermsScreen());

      // case '/payment':
      //   return MaterialPageRoute(
      //     builder: (_) => const PaymentScreen(),
      //   );
      // case '/result':
      //   final args = settings.arguments as PaymentResultScreenArguments;
      //   return MaterialPageRoute(
      //     builder: (_) => PaymentResultScreen(
      //       type: args.type,
      //       isSuccess: args.isSuccess,
      //       amount: args.amount,
      //       message: args.message,
      //     ),
      //   );
      // case '/toki/succeed':
      //   return MaterialPageRoute(
      //     builder: (_) => const TokiResultScreen(isSuccess: true),
      //   );
      // case '/toki/failed':
      //   return MaterialPageRoute(
      //     builder: (_) => const TokiResultScreen(isSuccess: false),
      //   );
      // case '/ecommerce/':
      //   return MaterialPageRoute(
      //     builder: (_) => const TokiResultScreen(isSuccess: true),
      //   );
      // case '/transfer':
      //   return MaterialPageRoute(
      //     builder: (_) => const TransferScreen(),
      //   );
      // case '/notification':
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => NotificationCubit(UserService()),
      //       child: const NotificationScreen(),
      //     ),
      //   );
      // case '/statement':
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (BuildContext context) => StatementCubit(StatementService()),
      //       child: const StatementScreen(),
      //     ),
      //   );

      default:
        return null;
    }
  }
}
