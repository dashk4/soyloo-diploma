import 'package:diploma/controller/LmsContoller.dart';
import 'package:diploma/global/app_sizes.dart';
import 'package:diploma/global/button.dart';
import 'package:diploma/global/custom_bar.dart';
import 'package:diploma/global/input.dart';
import 'package:diploma/helper/input_validations.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _postTypeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final GlobalKey _buttonKey = GlobalKey();
  bool _isLoading = false;

  // late UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // userModel = BlocProvider.of<UserCubit>(context).userModel ?? UserModel.fromJson({});
    // _firstnameController.text = userModel.user!.firstname ?? "";
    // _lastnameController.text = userModel.user!.lastname ?? "";
    // _memberCountController.text = "${userModel.user!.memberCount ?? 1}";
    // _orgType.text = userModel.user!.role == "ORG_EXTERNAL" ? "Гадаад" : "Дотоод";
    // _addressController.text = userModel.user!.address ?? "";
    // _registrationController.text = (MyApp.role == AppRole.consumer
    //     ? userModel.user!.registration.toString().length == 10
    //         ? userModel.user!.registration!.toString().substring(2, 10)
    //         : ""
    //     : userModel.user!.registration)!;

    // if (userModel.user!.registration!.length == 10) {
    //   for (int i = 0; i < AppValues.alphabet.length; i++) {
    //     if (userModel.user!.registration!.substring(0, 1) == AppValues.alphabet[i]) {
    //       _first = i;
    //     }
    //     if (userModel.user!.registration!.substring(1, 2) == AppValues.alphabet[i]) {
    //       _second = i;
    //     }
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Зар оруулах"),
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutHorizontal, vertical: 16),
        child: Button(
          text: "Хадгалах",
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              setState(() {
                _isLoading = true; // Set loading state to true
              });
              String address = _adressController.text;
              int area = int.parse(_areaController.text);
              String descrition = _descriptionController.text;
              int postType = int.parse(_postTypeController.text);
              int price = int.parse(_priceController.text);
              int rooms = int.parse(_roomsController.text);
              String title = _titleController.text;

              // userModel.user!.lastname = _lastnameController.text;
              // userModel.user!.memberCount = int.parse(_memberCountController.text);
              // userModel.user!.address = _addressController.text;
              // userModel.user!.registration = "${AppValues.alphabet[_first]}${AppValues.alphabet[_second]}${_registrationController.text}";
              await addPost(address, area, descrition, postType, price, rooms, title);
              setState(() {
                _isLoading = false; // Set loading state to false after operation
              });
            }
          },
          buttonType: ButtonType.primary,
          isLoading: _isLoading,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutHorizontal, vertical: AppSizes.layoutVertical),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Input(
                      controller: _adressController,
                      label: "Хаяг",
                      hint: "Хаяг",
                      textLines: 2,
                      inputType: TextInputType.text,
                      onValidate: (text) => InputValidations.fieldValidation(text),
                    ),
                    const SizedBox(height: AppSizes.betweenSize),
                    Input(
                      controller: _roomsController,
                      label: "Өрөөний тоо",
                      hint: "Өрөөний тоо",
                      inputType: TextInputType.number,
                      onValidate: (text) => InputValidations.numberValidation(text),
                    ),
                    const SizedBox(height: AppSizes.betweenSize),
                    const SizedBox(height: AppSizes.betweenSize),
                    Input(
                      controller: _areaController,
                      label: "Хэмжээ",
                      hint: "Хэмжээ",
                      inputType: TextInputType.number,
                      onValidate: (text) => InputValidations.numberValidation(text),
                    ),
                    const SizedBox(height: AppSizes.betweenSize),
                    Input(
                      controller: _postTypeController,
                      label: "Өрөөний төрөл",
                      hint: "Өрөөний төрөл",
                      inputType: TextInputType.number,
                      onValidate: (text) => InputValidations.numberValidation(text),
                    ),
                    const SizedBox(height: AppSizes.betweenSize),
                    Input(
                      controller: _priceController,
                      label: "Үнэ",
                      hint: "Үнэ",
                      inputType: TextInputType.number,
                      onValidate: (text) => InputValidations.numberValidation(text),
                    ),
                    const SizedBox(height: AppSizes.betweenSize),
                    Input(
                      controller: _titleController,
                      label: "Title",
                      hint: "Title",
                      inputType: TextInputType.text,
                      onValidate: (text) => InputValidations.fieldValidation(text),
                    ),
                    const SizedBox(height: AppSizes.betweenSize),
                    Input(
                      controller: _descriptionController,
                      label: "Дэлгэрэнгүй",
                      hint: "Дэлгэрэнгүй",
                      inputType: TextInputType.text,
                      textLines: 4,
                      onValidate: (text) => InputValidations.fieldValidation(text),
                      isEnabled: true,
                    ),
                    const SizedBox(height: AppSizes.betweenSize),
                    const SizedBox(height: AppSizes.betweenSize),

                    // Button(
                    //   key: _buttonKey,
                    //   text: "Хадгалах",
                    //   onPressed: () {
                    //     if (formKey.currentState!.validate()) {
                    //       // userModel.user!.firstname = _firstnameController.text;
                    //       // userModel.user!.lastname = _lastnameController.text;
                    //       // userModel.user!.memberCount = int.parse(_memberCountController.text);
                    //       // userModel.user!.address = _addressController.text;
                    //       // userModel.user!.registration = "${AppValues.alphabet[_first]}${AppValues.alphabet[_second]}${_registrationController.text}";
                    //       // BlocProvider.of<UserCubit>(context).updateUser(userModel);

                    //       final buttonContext = _buttonKey.currentContext;
                    //       if (buttonContext != null) {
                    //         FocusScope.of(buttonContext).unfocus();
                    //       }
                    //     }
                    //   },
                    //   buttonType: ButtonType.primary,
                    //   // isLoading: state is UserLoading,
                    // )
                  ],
                ),
              ),
            ),
          ),
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
