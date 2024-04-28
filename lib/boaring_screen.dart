import 'package:diploma/constants/values.dart';
import 'package:flutter/material.dart';

import '../global/app_colors.dart';
import '../global/app_sizes.dart';
import '../global/button.dart';
import '../main.dart';

/// @author mmunkhsuld

class BoardingContent {
  String title;
  String image;
  Color color;

  BoardingContent(this.title, this.image, this.color);
}

List<BoardingContent> contents = [
  BoardingContent(MyApp.role == AppRole.consumer ? "Хялбар түрээсийн боломж" : "Хялбар зар тавих", "hotel1.png", AppColors.primary700),
  BoardingContent(MyApp.role == AppRole.consumer ? "Хялбар түрээсийн боломж" : "Хялбар зар тавих", "hotel1.png", AppColors.primary500),
  BoardingContent(MyApp.role == AppRole.consumer ? "Хялбар түрээсийн боломж" : "Хялбар зар тавих", "hotel1.png", AppColors.primary900),
];

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  double _currentPageValue = 0.0;
  int _currentPage = 0;
  late PageController pageController = PageController(viewportFraction: 0.8);
  AppRole currentRole = AppRole.consumer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
    // currentRole = BlocProvider.of<AuthCubit>(context).role;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        color: contents[_currentPage].color,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (index) => setState(() => _currentPage = index),
                  itemBuilder: (context, index) {
                    return _buildPageWithAnimation(index);
                  },
                  itemCount: contents.length,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  contents[_currentPage].title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: AppColors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppSizes.layoutTop),
                child: _buildPageIndicator(),
              ),
              if (currentRole == AppRole.consumer)
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutHorizontal),
                  child: Button(
                    onPressed: () {
                      // BlocProvider.of<AuthCubit>(context).setForgot(false);
                      // context.push("/phone");
                      // Navigator.pushNamed(context, "/phone");
                      Navigator.pushNamed(context, "/signup");
                    },
                    text: "Бүртгүүлэх",
                    buttonType: ButtonType.bordered,
                  ),
                ),
              currentRole == AppRole.consumer
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutVertical, vertical: 12),
                      child: Button(
                        onPressed: () {
                          // context.push("/login");
                          Navigator.pushNamed(context, "/login");
                        },
                        text: "Нэвтрэх",
                        buttonType: ButtonType.primary,
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutVertical, vertical: 12),
                      child: Button(
                        onPressed: () {
                          // context.push("/login");
                          Navigator.pushNamed(context, "/login");
                        },
                        text: "Нэвтрэх",
                        buttonType: ButtonType.primary,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageWithAnimation(int index) {
    Matrix4 matrix = Matrix4.identity();
    double scaleFactor = .8;
    double height = MediaQuery.sizeOf(context).height / 5 * 2;
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale = scaleFactor + (_currentPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(left: 16, right: 16, top: AppSizes.layoutTop, bottom: AppSizes.layoutBottom),
        decoration: BoxDecoration(
          color: _currentPage == index ? AppColors.white : AppColors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(32),
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.asset("assets/images/${contents[index].image}"),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        contents.length,
        (index) => Stack(
          children: [
            Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: _currentPage == index ? AppColors.white : AppColors.primary100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
