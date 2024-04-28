import 'dart:ffi';

import 'package:diploma/controller/LmsContoller.dart';
import 'package:diploma/global/app_colors.dart';
import 'package:diploma/global/app_sizes.dart';
import 'package:diploma/global/button.dart';
import 'package:diploma/global/custom_bar.dart';
import 'package:diploma/global/input.dart';
import 'package:diploma/helper/input_validations.dart';
import 'package:diploma/models/user_model.dart';
import 'package:diploma/screens/home/organization/org_add_post.dart';
import 'package:diploma/screens/home/organization/org_my_post.dart';
import 'package:diploma/screens/home/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrgHomeScreen extends StatefulWidget {
  final UserModel data;
  OrgHomeScreen({super.key, required this.data});

  @override
  State<OrgHomeScreen> createState() => _OrgHomeScreenState();
}

class _OrgHomeScreenState extends State<OrgHomeScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _postTypeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final GlobalKey _buttonKey = GlobalKey();
  int _first = 0, _second = 0;
  @override
  void initState() {
    super.initState();
  }

  void profilePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(email: widget.data.email, phone: widget.data.phone)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hideLeadingBtn: true,
        leadingPressed: () {},
        actionWidget: IconButton(
          splashColor: Colors.transparent,
          highlightColor: AppColors.gray300,
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/icon_bell.svg"),
        ),
        widgetTitle: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8, top: 8, right: 8),
              width: 48,
              height: 48,
              child: Button(
                onPressed: () => profilePage(),
                iconPath: "icons/icon_user.svg",
                buttonType: ButtonType.bordered,
                text: '',
                child: SizedBox(
                  width: double.maxFinite,
                  child: Image.network(
                    "https://services.usug.mn/files/profiles/jpg?timestamp=${DateTime.now().millisecondsSinceEpoch}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              "Сайн уу, ${widget.data.phone}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Button(
              iconPath: "icons/icon_user.svg",
              background: AppColors.primary600,
              text: "Зар оруулах",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddPostScreen()));
              },
              buttonType: ButtonType.primary,
              // isLoading: state is UserLoading,
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              iconPath: "icons/icon_user.svg",
              background: AppColors.primary600,
              text: "Таны зар",
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPostScreen(data: widget.data)));
              },
              buttonType: ButtonType.primary,
              // isLoading: state is UserLoading,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _adressController.dispose();
    _areaController.dispose();
    _descriptionController.dispose();
    _postTypeController.dispose();
    _priceController.dispose();
    _roomsController.dispose();
    _titleController.dispose();

    super.dispose();
  }
}
