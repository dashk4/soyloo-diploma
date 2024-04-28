import 'package:diploma/constants/values.dart';
import 'package:diploma/global/app_colors.dart';
import 'package:diploma/global/custom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  final String email;
  final String phone;
  ProfilePage({super.key, required this.email, required this.phone});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void logout(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/');
  }

  AppRole role = AppRole.consumer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: role == AppRole.consumer ? "Хувь хүн" : "Байгуулга",
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
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/profile.png'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.email,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(width: 5),
                        Text(widget.phone),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              color: AppColors.gray600,
              height: 1,
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(Icons.bookmark),
                SizedBox(width: 5),
                Text('Захиалгын түүх'),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                logout(context);
              },
              child: const Row(
                children: [
                  Icon(Icons.logout),
                  SizedBox(width: 5),
                  Text('Системээс гарах'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
