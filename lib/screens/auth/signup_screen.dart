import 'package:diploma/controller/LmsContoller.dart';
import 'package:diploma/main.dart';
import 'package:diploma/models/user_model.dart';
import 'package:diploma/screens/auth/login_screen.dart';
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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pthoneContoller = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController pinController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    // final cubit = BlocProvider.of<AuthCubit>(context);
    AppRole role = AppRole.consumer;
    print('emailController ${emailController.text}');

    void navigateSplash() {
      Navigator.pushNamed(context, "/boarding");
    }

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
                  "Бүртгүүлэх",
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
                        controller: emailController,
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
                // Input(
                //   controller: pthoneContoller,
                //   label: "Утасны дугаар",
                //   hint: "9999999",
                //   inputType: TextInputType.phone,
                //   hideText: true,
                //   length: 8,
                //   prefix: Container(
                //     margin: const EdgeInsets.only(left: 6),
                //     padding: const EdgeInsets.symmetric(vertical: 12),
                //     child: SvgPicture.asset(
                //       "assets/icons/icon_locked.svg",
                //       colorFilter: const ColorFilter.mode(AppColors.gray500, BlendMode.srcIn),
                //       width: 8,
                //       height: 8,
                //     ),
                //   ),
                //   onChanged: (text) => InputValidations.phoneValidation(text),
                //   onValidate: (text) => InputValidations.phoneValidation(text),
                // ),
                Input(
                  controller: pthoneContoller,
                  label: "Утасны дугаар",
                  hint: "9999999",
                  length: 8,
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
                  onChanged: (text) => InputValidations.phoneValidation(text),
                  onValidate: (text) => InputValidations.phoneValidation(text),
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

                const SizedBox(height: AppSizes.betweenSize * 2),
                MyApp.role == AppRole.consumer
                    ? Button(
                        buttonType: ButtonType.primary,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // cubit.login(usernameController.text, pinController.text);
                            print('emailController.text ${emailController.text}');
                            print('emailController.text ${pthoneContoller.text}');

                            await signup(emailController.text, pinController.text, pthoneContoller.text);
                            navigateSplash();
                          }
                          // bool isChecked = await SharedRepository.getTerms();
                          // if (formKey.currentState!.validate() && isChecked) {
                          //   cubit.login(usernameController.text, pinController.text);
                          // } else {

                          // }
                        },
                        text: "Бүртгүүлэх",
                        // isLoading: state is AuthLoading,
                      )
                    : Button(
                        buttonType: ButtonType.primary,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            // cubit.login(usernameController.text, pinController.text);
                            print('emailController.text ${emailController.text}');
                            print('emailController.text ${pthoneContoller.text}');

                            await signup(emailController.text, pinController.text, pthoneContoller.text);
                            navigateSplash();
                          }
                          // bool isChecked = await SharedRepository.getTerms();
                          // if (formKey.currentState!.validate() && isChecked) {
                          //   cubit.login(usernameController.text, pinController.text);
                          // } else {

                          // }
                        },
                        text: "Бүртгүүлэх",
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
