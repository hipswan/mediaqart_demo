import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<Map<String, String>> products = [
  {
    "product": "One",
    "company": "MediaQart",
    "price": "404",
    "image":
        "https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80",
  },
  {
    "product": "Two",
    "company": "fdfe",
    "price": "550",
    "image":
        "https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80"
  },
  {
    "product": "Three",
    "company": "MediaQart",
    "price": "355",
    "image":
        "https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80"
  },
  {
    "product": "Four",
    "company": "MediaQart",
    "price": "500",
    "image":
        "https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80"
  },
  {
    "product": "Five",
    "company": "MediaQart",
    "price": "555",
    "image":
        "https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80",
  },
  {
    "product": "Six",
    "company": "MediaQart",
    "price": "505",
    "image":
        "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80"
  },
];

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _current = 0;
  List<Widget> imageSliders;

  @override
  void initState() {
    super.initState();
    products.forEach((e) => print(e["product"]));
    imageSliders = products
        .map(
          (product) => Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(product["image"],
                  fit: BoxFit.cover, width: 1000.0),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                            autoPlay: false,
                            enlargeCenterPage: false,
                            aspectRatio: 1.5,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: products.map((product) {
                          int index = products.indexOf(product);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _current == index
                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                  : Color.fromRGBO(0, 0, 0, 0.4),
                            ),
                          );
                        }).toList(),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Placeholder(
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
