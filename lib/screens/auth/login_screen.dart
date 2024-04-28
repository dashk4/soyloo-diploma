import 'package:diploma/controller/LmsContoller.dart';
import 'package:diploma/main.dart';
import 'package:diploma/models/user_model.dart';
import 'package:diploma/screens/home/home_page.dart';
import 'package:diploma/screens/home/organization/org_add_post.dart';
import 'package:diploma/screens/home/organization/org_home_screen.dart';
import 'package:diploma/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/values.dart';
import '../../global/app_colors.dart';
import '../../global/app_sizes.dart';
import '../../global/button.dart';
import '../../global/custom_bar.dart';
import '../../global/input.dart';
import '../../helper/input_validations.dart';
import '../splash_screen.dart';

/// @author mmunkhsuld

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController pinController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    // final cubit = BlocProvider.of<AuthCubit>(context);
    AppRole role = AppRole.consumer;
    print('emailController ${emailController.text}');

    return Scaffold(
      appBar: CustomAppBar(
        title: role == AppRole.consumer ? "Хувь хүн" : "Байгууллага",
        actionWidget: IconButton(
          icon: SvgPicture.asset("assets/icons/icon_question.svg"),
          iconSize: 20,
          splashRadius: 25,
          splashColor: Colors.transparent,
          highlightColor: AppColors.gray200,
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpScreen()));
          },
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutHorizontal, vertical: AppSizes.layoutVertical),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // const CircledIcon(
                //   color: AppColors.primary500,
                //   color1: AppColors.primary100,
                //   color2: AppColors.primary50,
                //   svg: "icon_smile.svg",
                // ),
                const SizedBox(height: AppSizes.betweenSize),
                Text(
                  "Нэвтрэх",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(height: AppSizes.betweenSize * 3),
                role == AppRole.consumer
                    ? Input(
                        controller: emailController,
                        label: "N-Mейл",
                        hint: "user@gmail.com",
                        inputType: TextInputType.emailAddress,
                        length: 40,
                        prefix: Container(
                          margin: const EdgeInsets.only(left: 6),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            "assets/icons/icon_phone.svg",
                            colorFilter: const ColorFilter.mode(AppColors.gray500, BlendMode.srcIn),
                            width: 8,
                            height: 8,
                          ),
                        ),
                        onChanged: (text) => InputValidations.emailValidation(text),
                        onValidate: (text) => InputValidations.emailValidation(text),
                      )
                    : Input(
                        controller: usernameController,
                        label: "Нэвтрэх нэр",
                        hint: "Байгууллагын регистр",
                        length: 7,
                        inputType: TextInputType.number,
                        prefix: Container(
                          margin: const EdgeInsets.only(left: 6),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            "assets/icons/icon_user.svg",
                            colorFilter: const ColorFilter.mode(AppColors.gray500, BlendMode.srcIn),
                            width: 8,
                            height: 8,
                          ),
                        ),
                        onChanged: (text) => InputValidations.orgRegisterValidation(text),
                        onValidate: (text) => InputValidations.orgRegisterValidation(text),
                      ),
                const SizedBox(height: AppSizes.betweenSize),
                role == AppRole.consumer
                    ? Input(
                        controller: pinController,
                        label: "Пин код",
                        hint: "****",
                        inputType: TextInputType.number,
                        hideText: true,
                        length: 4,
                        prefix: Container(
                          margin: const EdgeInsets.only(left: 6),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            "assets/icons/icon_locked.svg",
                            colorFilter: const ColorFilter.mode(AppColors.gray500, BlendMode.srcIn),
                            width: 8,
                            height: 8,
                          ),
                        ),
                        onChanged: (text) => InputValidations.phoneValidation(text),
                        onValidate: (text) => InputValidations.pinValidation(text),
                      )
                    : Input(
                        controller: pinController,
                        label: "Нууц код",
                        hint: "Нууц код",
                        inputType: TextInputType.number,
                        hideText: true,
                        prefix: Container(
                          margin: const EdgeInsets.only(left: 6),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            "assets/icons/icon_locked.svg",
                            colorFilter: const ColorFilter.mode(AppColors.gray500, BlendMode.srcIn),
                            width: 8,
                            height: 8,
                          ),
                        ),
                        onChanged: (text) => InputValidations.passwordValidation(text),
                        onValidate: (text) => InputValidations.passwordValidation(text),
                      ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: Button(
                        height: 48,
                        buttonType: ButtonType.transparent,
                        onPressed: () {
                          // cubit.setForgot(true);
                          Navigator.pushNamed(context, "/phone");
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            role == AppRole.consumer ? 'Пин кодоо мартсан?' : 'Нууц үг мартсан?',
                            style: Theme.of(context).textTheme.labelMedium!.copyWith(color: AppColors.primary700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.betweenSize * 2),
                MyApp.role == AppRole.consumer
                    ? Button(
                        buttonType: ButtonType.primary,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // cubit.login(usernameController.text, pinController.text);
                            print('emailController.text ${emailController.text}');
                            print('emailController.text ${emailController.text}');

                            UserModel data = await login(emailController.text, pinController.text);
                            Navigator.pushAndRemoveUntil(
                                context, MaterialPageRoute(builder: (context) => MainScreen(email: data.email, phone: data.phone)), (route) => false);
                          }
                          // bool isChecked = await SharedRepository.getTerms();
                          // if (formKey.currentState!.validate() && isChecked) {
                          //   cubit.login(usernameController.text, pinController.text);
                          // } else {

                          // }
                        },
                        text: "Нэвтрэх",
                        // isLoading: state is AuthLoading,
                      )
                    : Button(
                        buttonType: ButtonType.primary,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // cubit.login(usernameController.text, pinController.text);
                            print('emailController.text ${emailController.text}');
                            print('emailController.text ${emailController.text}');
                            UserModel data = await login(emailController.text, pinController.text);
                            print('~data ${data.id}');
                            Navigator.pushAndRemoveUntil(
                                context, MaterialPageRoute(builder: (context) => OrgHomeScreen(data: data)), (route) => false);
                          }
                          // bool isChecked = await SharedRepository.getTerms();
                          // if (formKey.currentState!.validate() && isChecked) {
                          //   cubit.login(usernameController.text, pinController.text);
                          // } else {

                          // }
                        },
                        text: "Нэвтрэх",
                        // isLoading: state is AuthLoading,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
