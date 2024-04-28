import 'package:diploma/global/custom_bar.dart';
import 'package:diploma/screens/home/room_order.dart';
import 'package:flutter/material.dart';

const Color ACCENT_COLOR = Colors.blue; // Placeholder color

class RoomsDetailScreen extends StatefulWidget {
  @override
  _RoomsDetailScreenState createState() => _RoomsDetailScreenState();
}

class _RoomsDetailScreenState extends State<RoomsDetailScreen> {
  bool onTab = true; // Define onTab outside the build method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Баталгаажуулах",
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Container(
              width: 331,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xffF2F4F7),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    minWidth: 165,
                    color: onTab ? ACCENT_COLOR : const Color(0xffF2F4F7),
                    child: Text(
                      'Өрөө',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: onTab ? Colors.white : const Color(0xff667085),
                          ),
                    ),
                    onPressed: () {
                      setState(() {
                        onTab = true;
                      });
                    },
                  ),
                  MaterialButton(
                    minWidth: 165,
                    color: onTab ? const Color(0xffF2F4F7) : ACCENT_COLOR,
                    child: Text(
                      'Миний авсан',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: onTab ? const Color(0xff667085) : Colors.white,
                          ),
                    ),
                    onPressed: () {
                      setState(() {
                        onTab = false;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            onTab == true
                ? Expanded(
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
                            color: const Color(0xffA3B1F7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage('assets/images/hotel1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Lotus Office',
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              color: Color(0xff101828),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Text(
                                            'Байшингийн санал болгож буй бусад байгууламжууд нь дундын амралтын өрөө',
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              color: Color(0xff101828),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          // Order Button
                                          ElevatedButton(
                                            onPressed: () {
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => RoomOrder()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                backgroundColor: Colors.blue),
                                            child: const Text(
                                              'Захиалах',
                                              style: TextStyle(
                                                fontFamily: "Inter",
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Expanded(
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
                            color: const Color(0xffFFB5B5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 150,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        image: AssetImage('assets/images/hotel1.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Lotus Hotel',
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              color: Color(0xff101828),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const Text(
                                            'Байшингийн санал болгож буй бусад байгууламжууд нь дундын амралтын өрөө',
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              color: Color(0xff101828),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          // Order Button
                                          ElevatedButton(
                                            onPressed: () {
                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => RoomOrder()));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(15),
                                                ),
                                                backgroundColor: Colors.blue),
                                            child: const Text(
                                              'Захиалах',
                                              style: TextStyle(
                                                fontFamily: "Inter",
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
