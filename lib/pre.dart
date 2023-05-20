import 'package:flutter/material.dart';

class Pre extends StatefulWidget {
  const Pre({Key? key}) : super(key: key);

  @override
  State<Pre> createState() => _PreState();
}

class _PreState extends State<Pre> {
  List color = [
    Colors.purple,
    Colors.cyan,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.lightBlue,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkResponse(
                  onTap: () {
                    setState(
                      () {},
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: color[index],
                    margin: EdgeInsets.symmetric(horizontal: 10),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
