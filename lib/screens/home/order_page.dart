import 'package:diploma/controller/LmsContoller.dart';
import 'package:diploma/global/app_colors.dart';
import 'package:diploma/global/app_sizes.dart';
import 'package:diploma/global/button.dart';
import 'package:diploma/global/custom_bar.dart';
import 'package:diploma/models/posts_model.dart';
import 'package:diploma/screens/home/total_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class OrderPage extends StatefulWidget {
  final String title;
  final String address;
  final double price;
  final String id;
  final double area;
  final int rooms;
  const OrderPage(
      {super.key, required this.id, required this.title, required this.address, required this.price, required this.area, required this.rooms});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late PostsModel posts;

  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    final data = await getPost(widget.id);
    // if (data.where((post) => post.postTypes.contains("POST_APARTMENT"))) {
    //   setState(() {
    //     posts = data;
    //   });
    // } else if (data.where((post) => post.postTypes.contains("POST_PLACE"))) {
    //   setState(() {
    //     businessRoom = data;
    //   });
    // }
    // final filteredPosts = data.where((post) => post.postTypes.contains("POST_APARTMENT") || post.postTypes.contains("POST_PLACE"));
    setState(() {
      posts = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('~id ${posts.toString()}');
    return Scaffold(
        appBar: CustomAppBar(
          title: "Захиалгын хураангуй",
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
        bottomSheet: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppSizes.layoutHorizontal, vertical: 16),
          child: Button(
            text: "Төлбөр төлөх",
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TotalPaymentScreen(id: widget.id, price: widget.price)));
            },
            buttonType: ButtonType.primary,
            // isLoading: _isLoading,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(25),
          child: Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage('assets/images/hotel1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.title,
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      color: Color(0xff101828),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    widget.address,
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      color: Color(0xff101828),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "${widget.price}₮",
                                    style: const TextStyle(
                                      fontFamily: "Inter",
                                      color: Color(0xff101828),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Booking Date',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '20 Mar 2024 10:00 AM',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Check-in',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '20 Mar 2024 10:00 AM',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Chcek-out',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '20 Mar 2024 10:00 AM',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Rooms',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${widget.rooms}",
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            color: AppColors.gray600,
                            height: 1,
                          ),
                          const SizedBox(height: 20),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Amount',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "${widget.price}₮",
                                style: const TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          // Order Button
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
