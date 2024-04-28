import 'package:diploma/global/custom_bar.dart';
import 'package:diploma/screens/home/booking_page.dart';
import 'package:diploma/screens/home/profile_page.dart';
import 'package:diploma/screens/home/rooms_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../global/app_colors.dart';
import '../global/button.dart';
import '../global/glassed_menu.dart';
import 'home/home_page.dart';

/// @author mmunkhsuld

class MainScreen extends StatefulWidget {
  final String email;
  final String phone;
  const MainScreen({super.key, required this.email, required this.phone});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  ScrollController scrollController = ScrollController();

  final List<Widget> _widgetOptions = [
    HomePage(),
    BookingPage(id: ""),
    RoomsDetailScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // if (BlocProvider.of<BalanceCubit>(context).state is! BalanceFetched) {
    //   BlocProvider.of<BalanceCubit>(context).fetch();
    // }
  }

  void profilePage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(email: widget.email, phone: widget.phone)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: GlassedMenu(
        items: [
          MenuItem(image: "home.svg", name: "Home"),
          MenuItem(image: "booking.svg", name: "Booking"),
          MenuItem(image: "booking.svg", name: "Status"),
        ],
        selectedTabIndex: _selectedIndex,
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
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
              "Сайн уу, ${widget.phone}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}

//
