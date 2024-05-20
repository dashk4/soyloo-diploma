import 'package:diploma/global/app_colors.dart';
import 'package:diploma/global/button.dart';
import 'package:diploma/global/custom_bar.dart';
import 'package:diploma/global/shared_repo.dart';
import 'package:diploma/screens/home/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TermsScreen extends StatefulWidget {
  final String title;
  final String address;
  final double price;
  final String id;
  final double area;
  final int rooms;
  const TermsScreen(
      {super.key, required this.id, required this.title, required this.address, required this.price, required this.area, required this.rooms});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    // Initialize the WebViewController here to avoid unnecessary recreations.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Үйлчилгээний нөхцөл",
        hideLeadingBtn: true,
        actionWidget: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/icon_question.svg",
            color: AppColors.gray500,
          ),
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
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Expanded(
              child: Text(
                  "`Өрөө түрээслэх гэрээ` нь Монгол улсын Иргэний хуулийн 318-332 дугаар зүйлийг үндэслэж нийцсэн байна. Мөн хуулийн 318 дугаар зүйлийн 318.1-д”Түрээсийн гэрээгээр түрээслүүлэгч нь түрээслэгчийн эзэмшил, ашиглалтад аж ахуйн үйл ажиллагаа явуулах болон дүрэмд заасан зорилгоо биелүүлэхэд нь зориулж тодорхой хөрөнгө шилжүүлэх, түрээслэгч нь гэрээгээр тохирсон түрээсийн төлбөрийг төлөх үүргийг тус тус хүлээнэ” гэж заасан.Уг гэрээнд мөн хуулийн 318-332 дугаар зүйлд түрээслэх өрөө, түрээсийн хугацаа, түрээсийн төлбөр,түрээслэгч, түрээслүүлэгчийн эрх, үүрэг, хариуцлага  зэрэг гол нөхцлийг тусгасан байна.Уг гэрээнд гэрээний аль нэг тал нь үүргээ биелүүлээгүй тохиолдолд үүсэх үр дагаврыг бүрэн хариуцах, хохирлыг бүрэн арилгах асуудлыг тодорхой тусгана.Энэ нь өрөөний түрээсийн апп-аар өрөө түрээслэх захиалга өгч байгаа хүн,хуулийн этгээдэд түрээслүүлэгчийн гэрээний үүрэг,хариуцлага тодорхой байх,улмаар маргаан үүссэн тохиолдолд шүүхийн журмаар эрхээ хамгаалуулах итгэл,үнэмшил төрүүлэх, эрх зүйн хамгаалалтыг бий болгоно гэж үзэж байна.Талууд өндөр үнийн дүнтэй, удаан хугацаагаар өрөө түрээслэх гэх зэрэг шаардлагатай тохиолдол гэж үзвэл Нотариатын тухай хуулийн Үйлчлүүлэгчийн эрх гэсэн 28 дугаар зүйлийн 28.2.2-д заасан эрхийн хүрээнд гэрээ болон холбогдох баримт бичгийг хүргүүлж, цахим хэлбэрээр тайлбар өгч,гэрээг нотариатаар баталгаажуулах боломжтой байна."),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.blue,
                  activeColor: Colors.white,
                  focusColor: Colors.blue,
                  hoverColor: Colors.blue,
                  side: const BorderSide(width: 1, color: Colors.blue),
                  value: isChecked,
                  onChanged: (value) async {
                    setState(() {
                      isChecked = value!;
                    });
                    await SharedRepository.setTerms(value!);
                  },
                ),
                Expanded(
                  child: Text(
                    "Би үйлчилгээний нөхцөлийг хүлээн зөвшөөрч байна.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            isChecked == false
                ? Button(
                    text: "Үргэлжлүүлэх",
                    onPressed: () async {},
                    buttonType: ButtonType.warning,
                    // isLoading: _isLoading,
                  )
                : Button(
                    text: "Үргэлжлүүлэх",
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPage(
                              id: widget.id,
                              title: widget.title,
                              price: widget.price,
                              area: widget.area,
                              rooms: widget.rooms,
                              address: widget.address),
                        ),
                      );
                    },
                    buttonType: ButtonType.primary,
                    // isLoading: _isLoading,
                  ),
            const SizedBox(height: 39),
          ],
        ),
      ),
    );
  }
}
