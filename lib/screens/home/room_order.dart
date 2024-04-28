import 'package:diploma/global/app_colors.dart';
import 'package:diploma/global/custom_bar.dart';
import 'package:diploma/screens/home/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';

class RoomOrder extends StatefulWidget {
  final String title;
  final String address;
  final double price;
  final String id;
  final double area;
  final int rooms;

  const RoomOrder(
      {super.key, required this.title, required this.address, required this.price, required this.id, required this.area, required this.rooms});

  @override
  createState() => new _RoomOrderState();
}

class _RoomOrderState extends State<RoomOrder> {
  // CalendarController _controller;
  @override
  void initState() {
    super.initState();
    // _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Захиалга өгөх",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/hotel1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 25,
                          child: Text(
                            'Ulaanbaator',
                            style: TextStyle(fontSize: 16, color: Color(0xff7F7F7F)),
                          ),
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/icons/location.svg',
                        width: 35,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xff003F79),
                          borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                        ),
                        child: const Center(
                          child: Text(
                            "FAST WIFI",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xff003F79),
                          borderRadius: BorderRadius.circular(5), // Adjust the radius as needed
                        ),
                        child: const Center(
                          child: Text(
                            "FAST WIFI",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/location.svg',
                        width: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 25,
                          child: Text(
                            widget.address,
                            style: const TextStyle(fontSize: 16, color: Color(0xff7F7F7F)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Order Button
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 25,
                      child: Text(
                        "${widget.price.toString()} ₮",
                        style: const TextStyle(fontSize: 16, color: Color(0xff7F7F7F)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => BookingPage(id: widget.id),
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
                      child: const Text(
                        'Захиалга өгөх',
                        style: TextStyle(
                          fontFamily: "Inter",
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
