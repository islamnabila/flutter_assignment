import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List Product = [
    {"name": "Product 1", "Price": 125},
    {"name": "Product 2", "Price": 129},
    {"name": "Product 3", "Price": 125},
    {"name": "Product 4", "Price": 885},
    {"name": "Product 5", "Price": 896},
    {"name": "Product 6", "Price": 862},
    {"name": "Product 7", "Price": 176},
    {"name": "Product 8", "Price": 551},
    {"name": "Product 9", "Price": 456},
    {"name": "Product 10", "Price": 622},
    {"name": "Product 11", "Price": 455},
    {"name": "Product 12", "Price": 456},
    {"name": "Product 13", "Price": 182},
    {"name": "Product 14", "Price": 128},
    {"name": "Product 15", "Price": 286},
    {"name": "Product 16", "Price": 500},
  ];

  List<int> counters = List.filled(16, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: Product.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        Product[index]["name"],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(Product[index]["Price"].toString()),
                      trailing: Column(
                        children: [
                          Expanded(child: Text("Count: ${counters[index]}")),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (counters[index] == 5) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("Close"))
                                            ],
                                            title: Text("Congratulations!"),
                                            content: Text(
                                                " You've bought 5 ${Product[index]["name"]}"),
                                          ));
                                } else {
                                  setState(() {
                                    counters[index]++;
                                  });
                                }
                              },
                              child: Text("Buy Now"),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(
                  counters: counters,
                ),
              ));
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final List<int> counters;
  const CartPage({super.key, required this.counters});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int totalProducts = 0;
  @override
  void initState() {
    super.initState();
    for (int count in widget.counters) {
      if (count >= 1) {
        totalProducts++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: Center(
          child: Text(
        "Total Products: $totalProducts",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
    );
  }
}
