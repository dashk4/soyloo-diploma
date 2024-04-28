import 'dart:async';

import 'package:diploma/controller/LmsContoller.dart';
import 'package:diploma/global/app_colors.dart';
import 'package:diploma/global/app_sizes.dart';
import 'package:diploma/global/button.dart';
import 'package:diploma/global/custom_bar.dart';
import 'package:diploma/global/input.dart';
import 'package:diploma/helper/input_validations.dart';
import 'package:diploma/screens/home/booking_page.dart';
import 'package:flutter/material.dart';

class TotalPaymentScreen extends StatefulWidget {
  final String id;
  final double price;
  const TotalPaymentScreen({super.key, required this.id, required this.price});

  @override
  State<TotalPaymentScreen> createState() => _TotalPaymentScreenState();
}

class _TotalPaymentScreenState extends State<TotalPaymentScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _adressController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _postTypeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _roomsController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final GlobalKey _buttonKey = GlobalKey();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void loader() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      // Show success popup modal
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.primary600,
            content: const Text(
              "Захиалга амжилттай",
              style: TextStyle(
                fontFamily: "Inter",
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  "Цахиалга харах",
                  style: TextStyle(
                    fontFamily: "Inter",
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage(id: widget.id)));
                },
              ),
            ],
          );
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Төлбөр"),
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutHorizontal, vertical: 16),
        child: Button(
          text: "Төлөх",
          onPressed: () {
            if (formKey.currentState!.validate()) {
              setState(() {
                isLoading = true;
              });
              loader();
            }
          },
          buttonType: ButtonType.primary,
          isLoading: isLoading,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          color: AppColors.grayBlue300,
                          child: Column(
                            children: [
                              const Text(
                                'Нийт үнэ',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${widget.price}₮',
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  color: Colors.blue,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutHorizontal, vertical: AppSizes.layoutVertical),
                          child: Column(
                            children: [
                              const Text(
                                'Төлбөрийн нөхцөл',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Input(
                                controller: _adressController,
                                label: "Карт эзэмшигчийн нэр",
                                hint: "Карт эзэмшигчийн нэр",
                                textLines: 1,
                                inputType: TextInputType.text,
                                onValidate: (text) => InputValidations.fieldValidation(text),
                              ),
                              const SizedBox(height: AppSizes.betweenSize),
                              Input(
                                controller: _roomsController,
                                length: 10,
                                label: "Картны дугаар",
                                hint: "***********",
                                inputType: TextInputType.number,
                                onValidate: (text) => InputValidations.numberValidation(text),
                              ),
                              const SizedBox(height: AppSizes.betweenSize),
                              const SizedBox(height: AppSizes.betweenSize),
                              Row(
                                children: [
                                  Container(
                                    width: 150,
                                    child: Input(
                                      controller: _areaController,
                                      length: 4,
                                      label: "Дуусах хугацаа",
                                      hint: "MM/YY",
                                      inputType: TextInputType.number,
                                      onValidate: (text) => InputValidations.numberValidation(text),
                                    ),
                                  ),
                                  const SizedBox(width: AppSizes.betweenSize),
                                  Container(
                                    width: 150,
                                    child: Input(
                                      controller: _postTypeController,
                                      label: "CVV",
                                      length: 4,
                                      hint: "****",
                                      inputType: TextInputType.number,
                                      onValidate: (text) => InputValidations.numberValidation(text),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
