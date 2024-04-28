import 'package:diploma/controller/LmsContoller.dart';
import 'package:diploma/models/business_room_model.dart';
import 'package:diploma/models/posts_model.dart';
import 'package:diploma/screens/home/room_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostsModel> posts = [];
  List<BusinessRoomModel> businessRoom = [];
  bool searching = false;
  List<PostsModel> searchBasedData = [];
  List<PostsModel> search = [];
  int maxPrice = 0;

  @override
  void initState() {
    super.initState();
    searchBussinessRoom("");
    searchHotelRoom("");
  }

  Future<void> searchHotelRoom(String text) async {
    List<PostsModel> data;
    data = await getPosts(0, 0, 0, 0, 0, text, 100);

    setState(() {
      searchBasedData = data.where((post) => post.postTypes.contains("POST_PLACE")).toList();
      searching = text.isNotEmpty;
    });
  }

  Future<void> searchBussinessRoom(String text) async {
    List<PostsModel> data;
    data = await getPosts(0, 0, 0, 0, 0, text, 100);

    setState(() {
      search = data.where((post) => post.postTypes.contains("POST_APARTMENT")).toList();
      // searching = text.isNotEmpty;
    });
  }

  List<PostsModel> getPost() {
    if (posts.isEmpty) {
      return [];
    } else {
      return posts.getRange(0, posts.length).toList();
    }
  }

  final List<String> items = List.generate(10, (index) => '10 ${index + 1}');

  @override
  Widget build(BuildContext context) {
    print('posts ${searchBasedData}');
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 150),
          child: Column(
            children: [
              Container(
                height: 60,
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xffF9FAEA)),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/icons/Search.svg'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        maxLines: 1,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        onChanged: (text) {
                          searchHotelRoom(text);
                        },
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: "Inter"),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 12, bottom: 8, top: 8, right: 12),
                          hintText: "Та ямар түрээсийн өрөө хайж байна вэ?",
                          hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Түрээсийн өрөө',
                    style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xff007EF2),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.maxFinite,
                height: 250,
                child: PageView.builder(
                  itemCount: searchBasedData.length,
                  controller: PageController(initialPage: 0, viewportFraction: 0.9),
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  color: index % 2 == 0 ? Colors.blue : Colors.green,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RoomsDetailScreen()));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RoomOrder(
                                              title: search[index].title,
                                              address: search[index].address,
                                              price: search[index].price,
                                              id: search[index].id,
                                              area: search[index].area,
                                              rooms: search[index].rooms,
                                            ),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Image.asset(
                                            'assets/images/hotel1.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 5),
                                  height: 25,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: index % 2 == 0 ? Colors.blue : Colors.green,
                                    borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "${"10"}% OFF",
                                      style: TextStyle(fontSize: 14, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 25,
                                  child: Text(
                                    searchBasedData[index].title,
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/location.svg',
                                    width: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: SizedBox(
                                      height: 25,
                                      child: Text(
                                        searchBasedData[index].address,
                                        style: const TextStyle(fontSize: 16, color: Color(0xff7F7F7F)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 25,
                                  child: Text(
                                    '${searchBasedData[index].price} MNT',
                                    style: const TextStyle(fontSize: 16, color: Color(0xff7F7F7F)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                height: 60,
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xffF9FAEA)),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/icons/Search.svg'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        maxLines: 1,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        onChanged: (text) {
                          searchBussinessRoom(text);
                        },
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: "Inter"),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 12, bottom: 8, top: 8, right: 12),
                          hintText: "Та ямар бизнес уулзалтын өрөө хайж байна вэ?",
                          hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Бизнес уулзалтын өрөө',
                    style: TextStyle(
                      fontFamily: "Inter",
                      color: Color(0xff007EF2),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.maxFinite,
                height: 250,
                child: PageView.builder(
                  itemCount: search.length,
                  controller: PageController(initialPage: 0, viewportFraction: 0.9),
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  color: index % 2 == 0 ? Colors.blue : Colors.green,
                                  borderRadius: BorderRadius.circular(15), // Adjust the radius as needed
                                ),
                                child: Stack(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => RoomsDetailScreen()));
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => RoomOrder(
                                              title: search[index].title,
                                              address: search[index].address,
                                              price: search[index].price,
                                              id: search[index].id,
                                              area: search[index].area,
                                              rooms: search[index].rooms,
                                            ),
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15), // Same as the container's border radius
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Image.asset(
                                            'assets/images/hotel1.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
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
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 25,
                                  child: Text(
                                    search[index].title,
                                    style: TextStyle(fontSize: 16, color: Colors.black),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/location.svg',
                                    width: 15,
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: SizedBox(
                                      height: 25,
                                      child: Text(
                                        search[index].address,
                                        style: const TextStyle(fontSize: 16, color: Color(0xff7F7F7F)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: SizedBox(
                                  height: 25,
                                  child: Text(
                                    '${search[index].price} MNT',
                                    style: const TextStyle(fontSize: 16, color: Color(0xff7F7F7F)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
