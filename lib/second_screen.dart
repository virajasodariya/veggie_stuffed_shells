import 'package:flutter/material.dart';
import 'package:veggie_stuffed_shells/home_screen.dart';
import 'package:veggie_stuffed_shells/third_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List page_view_color = [
    Colors.amberAccent.shade100,
    Colors.pink.shade50,
    Colors.greenAccent.shade100,
    Colors.cyan.shade50,
    Colors.purple.shade50,
  ];
  List page_view_item_text = [
    "Soup",
    "Vege",
    "Chicken",
    "Drink",
    "Sweet",
  ];
  List page_view_item_info = [
    "Soup is a primarily liquid food,\n"
        "generally served warm or hot that is\n"
        "made by combining ingredients of meat\n"
        "or vegetables with stock,\n"
        "milk, or water.",
    "Veggie and Veg redirect here.\n"
        "For the diet that abstains from animal\n"
        "products and consists mostly of plants,\n"
        "see Veganism. For a vegetarian diet,\n"
        "see Vegetarianism. For other uses of\n"
        "vegetable, see Vegetable (disambiguation).",
    "The chicken is a domesticated junglefowl\n"
        "species with attributes of wild species such \n"
        "as the grey and the Ceylon junglefowl that \n"
        "are originally from Southeastern Asia.",
    "DRINKS operates the leading consumer\n"
        "marketplace for high quality and affordable\n"
        "premium wine available for delivery\n"
        "around the United States.",
    "Candy, also called sweets or lollies, is a\n"
        "confection that features sugar as a principal\n"
        "ingredient. The category, called sugar\n"
        "confectionery, encompasses any sweet\n"
        "confection, including chocolate, chewing gum,\n"
        "and sugar candy.",
  ];
  List page_view_item_price = [
    "\$12",
    "\$10",
    "\$14",
    "\$9",
    "\$15",
  ];
  List add_to_cart_color = [
    Colors.amberAccent.shade700,
    Colors.pink.shade900,
    Colors.greenAccent.shade700,
    Colors.cyan.shade900,
    Colors.purple.shade900,
  ];

  int page_selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffeed4),
      body: PageView.builder(
        onPageChanged: ((value) {
          setState(() {
            page_selected = value;
          });
        }),
        itemCount: 5,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
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
                          color: page_view_color[index],
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
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
                                      color: add_to_cart_color[index],
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
                            Image.asset(
                              "assets/images/vegetable.png",
                              scale: 3,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 146),
                              child: Row(
                                children: List.generate(
                                  5,
                                  (index) => Container(
                                    height: 10,
                                    width: 10,
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: page_selected == index
                                          ? add_to_cart_color[index]
                                          : Colors.grey,
                                      shape: BoxShape.circle,
                                    ),
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
                          page_view_item_text[index],
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
                          page_view_item_info[index],
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Row(
                  children: [
                    Text(
                      page_view_item_price[index],
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
                          color: add_to_cart_color[index],
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
          );
        },
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
  bool favrote = false;
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: () {
        setState(
          () {
            favrote = !favrote;
          },
        );
      },
      child: favrote == true
          ? Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : Icon(
              Icons.favorite_border,
              color: Colors.grey.shade800,
            ),
    );
  }
}
