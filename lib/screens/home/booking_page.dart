import 'package:diploma/controller/LmsContoller.dart';
import 'package:diploma/global/app_colors.dart';
import 'package:diploma/global/custom_bar.dart';
import 'package:diploma/models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class BookingPage extends StatefulWidget {
  final String id;
  const BookingPage({super.key, required this.id});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
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
          title: "Миний захиалга",
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
          child: Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                color: Colors.transparent,
              ),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Өрөөний мэдээлэл',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Booking ID: ${widget.id}',
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  color: Color(0xff101828),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Text(
                              'Booked by: ${posts.title}',
                              style: const TextStyle(
                                fontFamily: "Inter",
                                color: Color(0xff101828),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'No. of guests: ${posts.rooms}',
                              style: const TextStyle(
                                fontFamily: "Inter",
                                color: Color(0xff101828),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Text(
                              'Room Booked: Family room',
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Color(0xff101828),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Check-In',
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          color: Color(0xff101828),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
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
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'Check-Out',
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          color: Color(0xff101828),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        '21 Mar 2024 12:00 AM',
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          color: Color(0xff101828),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            // Order Button
                            // Container(
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(15),
                            //     border: Border.all(
                            //       color: Colors.black,
                            //       width: 1,
                            //     ),
                            //   ),
                            //   child: ElevatedButton(
                            //     onPressed: () {},
                            //     child: const Text(
                            //       'Захиалга цуцлах ',
                            //       style: TextStyle(
                            //         fontFamily: "Inter",
                            //         color: Colors.black,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w600,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
