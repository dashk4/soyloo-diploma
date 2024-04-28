import 'dart:async';

import 'package:diploma/constants/values.dart';
import 'package:flutter/material.dart';

import '../global/app_sizes.dart';
import '../global/button.dart';
import '../main.dart';

/// @author mmunkhsuld

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool isLoading = true;
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Utility.clearStates(context);
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
    // SharedRepository.getUser().then((value) {
    //   if (value != null) {
    //     if (value.accessToken!.isNotEmpty) {
    //       MyApp.accessToken = value.accessToken;
    //       BlocProvider.of<UserCubit>(context).initUser(value);

    //       // while(context.canPop()) {
    //       //   context.pop();
    //       // }
    //       // context.replace("/main");
    //       ///TODO fade animation
    //       ///

    //       Timer(const Duration(seconds: 1), () {
    //         Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(builder: (context) => const SliverMainScreen()),
    //         );
    //       });
    //     }
    //   } else {
    //     setState(() {
    //       isLoading = false;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: isLoading == false
          ? const SizedBox()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutHorizontal, vertical: AppSizes.layoutBottom),
              child: Row(
                children: [
                  Expanded(
                    child: Button(
                      onPressed: () {
                        // BlocProvider.of<AuthCubit>(context).setRole(AppRole.org);
                        // context.push("/boarding");
                        SetAble(AppRole.org);
                        MyApp.role = AppRole.org;
                        Navigator.pushNamed(context, "/boarding");
                      },
                      text: "Борлуулагч",
                      buttonType: ButtonType.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Button(
                      onPressed: () {
                        // BlocProvider.of<AuthCubit>(context).setRole(AppRole.consumer);
                        SetAble(AppRole.consumer);
                        MyApp.role = AppRole.consumer;
                        Navigator.pushNamed(context, "/boarding");
                        // context.push("/boarding");
                      },
                      text: "Түрээслэгч",
                      buttonType: ButtonType.primary,
                    ),
                  ),
                ],
              ),
            ),
      body: Center(
        child: ClipOval(
          child: Image.asset(
            "assets/images/hotel1.png",
            width: 280,
          ),
        ),
      ),
    );
  }
}
