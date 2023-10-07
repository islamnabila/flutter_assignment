import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List photo = [
    {
      "img":
      "https://sassafras.in/cdn/shop/products/SFTOPS40908-1.jpg?v=1666420733",
      "title": "Pullover",
      "color": "Black",
      "Size": "L",
      "Price": "51",
      "count": 0,
    },
    {
      "img":
      "https://adn-static1.nykaa.com/nykdesignstudio-images/pub/media/catalog/product/7/e/tr:w-270,/7eecdb0RIGO102_4.jpg?rnd=20200526195200",
      "title": "T-Shirt",
      "color": "Gray",
      "Size": "L",
      "Price": "30",
      "count": 0,
    },
    {
      "img":
      "https://www.yellowclothing.net/cdn/shop/files/U6A0123_1024x1024.jpg?v=1691476403",
      "title": "Sport dress",
      "color": "Black",
      "Size": "M",
      "Price": "43",
      "count": 0,
    },
  ];
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: Icon(Icons.search, color: Colors.black),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10),
              child: Text(
                "My Bag",
                style: TextStyle(
                    color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: photo.length,
                itemBuilder: (context, index) {
                  int itemTotal =
                  (int.parse(photo[index]["Price"]) * photo[index]["count"])
                      .toInt();
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    height: 110,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          child: AspectRatio(
                            aspectRatio: 16 / 16,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(photo[index]["img"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 5, top: 8, bottom: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                photo[index]["title"],
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Colors: ${photo[index]["color"]}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Size: ${photo[index]["Size"]}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          if (photo[index]["count"] > 0) {
                                            photo[index]["count"]--;
                                            totalAmount -=
                                                int.parse(photo[index]["Price"]);
                                          }
                                        });
                                      },
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Container(
                                    child: Text("${photo[index]["count"]}"),
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                        )
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          photo[index]["count"]++;
                                          totalAmount +=
                                              int.parse(photo[index]["Price"]);
                                        });
                                      },
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 12, top: 10, bottom: 5),
                          child: Column(
                            children: [
                              Icon(
                                FontAwesomeIcons.ellipsisVertical,
                                size: 20,
                                color: Colors.grey,
                              ),
                              Spacer(),
                              Text(
                                '${photo[index]["Price"]}\$',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Total Amount:",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  Spacer(),
                  Text(
                    "${totalAmount}\$",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    final message = SnackBar(content: Text("Congratulation"));
                    ScaffoldMessenger.of(context).showSnackBar(message);
                  },
                  child: Text(
                    "CHECK OUT",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
