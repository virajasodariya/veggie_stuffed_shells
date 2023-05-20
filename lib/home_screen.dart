import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:veggie_stuffed_shells/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List menu_text = [
    "Soup",
    "Vege",
    "Chicken",
    "Drink",
    "Sweet",
  ];
  List menu_icon = [
    "assets/images/soup icon.png",
    "assets/images/vegetable icon.png",
    "assets/images/Chicken icon.png",
    "assets/images/Drink icon.png",
    "assets/images/Sweet icon.png",
  ];

  List sub_menu_color = [
    Colors.amberAccent.shade100,
    Colors.pink.shade50,
    Colors.greenAccent.shade100,
    Colors.cyan.shade50,
    Colors.purple.shade50,
  ];
  List sub_menu_text_color = [
    Colors.amberAccent.shade700,
    Colors.pink.shade900,
    Colors.greenAccent.shade700,
    Colors.cyan.shade900,
    Colors.purple.shade900,
  ];
  List sub_menu_price = [
    "\$12",
    "\$10",
    "\$14",
    "\$9",
    "\$15",
  ];

  int menu_selection = 0;
  int bottom_nav_selection = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: bottom_nav_selection,
        onTap: ((value) {
          setState(
            () {
              bottom_nav_selection = value;
            },
          );
        }),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.notification_add_outlined),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person_outline),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Row(
                  children: [
                    Text(
                      "Hi, Mina!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/mina profile picture.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 30, top: 10),
                  hintText: "Search foods...",
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                  suffixIcon: Icon(
                    Icons.mic,
                    color: Colors.orange,
                  ),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      InkResponse(
                        onTap: () {
                          setState(
                            () {
                              menu_selection = index;
                            },
                          );
                        },
                        child: Container(
                          height: 75,
                          width: 75,
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                            color: menu_selection == index
                                ? Colors.white
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              menu_selection == index
                                  ? BoxShadow(
                                      color: Colors.orange,
                                      offset: Offset(1, 1),
                                      blurRadius: 10,
                                      spreadRadius: -8,
                                    )
                                  : BoxShadow(color: Colors.white),
                            ],
                          ),
                          child: Image.asset(
                            menu_icon[index],
                            scale: 3.50,
                            color: menu_selection == index
                                ? Colors.orange
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),
                      Text(
                        menu_text[index],
                        style: TextStyle(
                          color: menu_selection == index
                              ? Colors.black
                              : Colors.grey,
                          fontWeight: menu_selection == index
                              ? FontWeight.bold
                              : FontWeight.w500,
                          fontSize: menu_selection == index ? 18 : 16,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            Container(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkResponse(
                    onTap: () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SecondScreen(),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 325,
                      width: 225,
                      margin: EdgeInsets.only(left: 25),
                      decoration: BoxDecoration(
                        color: sub_menu_color[index],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/vegetable.png",
                            scale: 5,
                          ),
                          SizedBox(height: 5),
                          Text(
                            menu_text[index],
                            style: TextStyle(
                              color: sub_menu_text_color[index],
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            sub_menu_price[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 150, top: 10),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Favrote(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Favrote extends StatefulWidget {
  const Favrote({Key? key}) : super(key: key);

  @override
  State<Favrote> createState() => _FavroteState();
}

class _FavroteState extends State<Favrote> {
  bool favarote = false;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        setState(
          () {
            favarote = !favarote;
          },
        );
      },
      child: favarote == true
          ? Icon(
              Icons.favorite,
              color: Colors.red,
              size: 24,
            )
          : Icon(
              Icons.favorite_border,
              color: Colors.red.shade500,
              size: 24,
            ),
    );
  }
}
