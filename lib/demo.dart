import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:veggie_stuffed_shells/second_screen.dart';
import 'package:veggie_stuffed_shells/third_screen.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
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
  int sub_menu_selection = 0;
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
                              builder: (context) => Trasfer(),
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

class Trasfer extends StatefulWidget {
  const Trasfer({Key? key}) : super(key: key);

  @override
  State<Trasfer> createState() => _TrasferState();
}

class _TrasferState extends State<Trasfer> {
  List<Map<String, dynamic>> itellist = [
    {
      "page_view_color": Colors.amberAccent.shade100,
      "pic": [
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
      ],
      "list_row": Colors.amberAccent.shade400,
      "page_view_item_text": "Soup",
      "page_view_item_info": "Soup is a primarily liquid food,\n"
          "generally served warm or hot that is\n"
          "made by combining ingredients of meat\n"
          "or vegetables with stock,\n"
          "milk, or water.",
      "page_view_item_price": "\$12",
      "add_to_cart_color": Colors.amberAccent.shade700,
    },
    {
      "page_view_color": Colors.pink.shade50,
      "pic": [
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
      ],
      "list_row": Colors.pink.shade400,
      "page_view_item_text": "Vege",
      "page_view_item_info": "Veggie and Veg redirect here.\n"
          "For the diet that abstains from animal\n"
          "products and consists mostly of plants,\n"
          "see Veganism. For a vegetarian diet,\n"
          "see Vegetarianism. For other uses of\n"
          "vegetable, see Vegetable (disambiguation).",
      "page_view_item_price": "\$15",
      "add_to_cart_color": Colors.pink.shade900,
    },
    {
      "page_view_color": Colors.greenAccent.shade100,
      "pic": [
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
      ],
      "list_row": Colors.greenAccent.shade400,
      "page_view_item_text": "Chicken",
      "page_view_item_info": "The chicken is a domesticated junglefowl\n"
          "species with attributes of wild species such \n"
          "as the grey and the Ceylon junglefowl that \n"
          "are originally from Southeastern Asia.",
      "page_view_item_price": "\$10",
      "add_to_cart_color": Colors.greenAccent.shade700,
    },
    {
      "page_view_color": Colors.cyan.shade50,
      "pic": [
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
      ],
      "list_row": Colors.cyan.shade400,
      "page_view_item_text": "Drink",
      "page_view_item_info": "DRINKS operates the leading consumer\n"
          "marketplace for high quality and affordable\n"
          "premium wine available for delivery\n"
          "around the United States.",
      "page_view_item_price": "\$14",
      "add_to_cart_color": Colors.cyan.shade900,
    },
    {
      "page_view_color": Colors.purple.shade50,
      "pic": [
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
        "assets/images/vegetable.png",
      ],
      "list_row": Colors.purple.shade400,
      "page_view_item_text": "Sweet",
      "page_view_item_info": "Candy, also called sweets or lollies, is a\n"
          "confection that features sugar as a principal\n"
          "ingredient. The category, called sugar\n"
          "confectionery, encompasses any sweet\n"
          "confection, including chocolate, chewing gum,\n"
          "and sugar candy.",
      "page_view_item_price": "\$9",
      "add_to_cart_color": Colors.purple.shade900,
    },
  ];
  int sub_menu_selection = 0;
  int pic_slide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: itellist[sub_menu_selection]["page_view_color"],
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 720,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 450,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: itellist[sub_menu_selection]["page_view_color"],
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: itellist[sub_menu_selection]
                                      ["add_to_cart_color"],
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Favrote(),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 340,
                          child: PageView.builder(
                            onPageChanged: (value) {
                              setState(
                                () {
                                  pic_slide = value;
                                },
                              );
                            },
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Image.asset(
                                itellist[sub_menu_selection]["pic"][index],
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => Container(
                              height: 8,
                              width: 8,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: pic_slide == index
                                    ? itellist[sub_menu_selection]
                                        ["add_to_cart_color"]
                                    : itellist[sub_menu_selection]["list_row"],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Text(
                      itellist[sub_menu_selection]["page_view_item_text"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Text(
                      itellist[sub_menu_selection]["page_view_item_info"],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Row(
              children: [
                Text(
                  itellist[sub_menu_selection]["page_view_item_price"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Spacer(),
                InkResponse(
                  onTap: () {
                    setState(
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ThirdScreen(),
                            ));
                      },
                    );
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: itellist[sub_menu_selection]["add_to_cart_color"],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Add To Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
