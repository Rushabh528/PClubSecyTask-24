import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:secytask/navbar/MyItems/uploadProduct.dart';

class myItemPreview extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final List<String> images;
  final VoidCallback refreshParent;

  const myItemPreview({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemDescription,
    required this.images,
    required this.refreshParent,
  }) : super(key: key);

  @override
  State<myItemPreview> createState() => _myItemPreviewState();
}

class _myItemPreviewState extends State<myItemPreview> {
  @override
  Widget build(BuildContext context) {
    final CarouselController carouselController = CarouselController();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Item Preview",
          style: const TextStyle(
              color: Color(0xffFCF6F5),
              fontFamily: 'Piazzolla_24pt',
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color(0xff990011),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      carouselController: carouselController,
                      options: CarouselOptions(
                        height: 200,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                      ),
                      items: widget.images
                          .map((item) => Container(
                                child: Center(
                                    child: Image.file(
                                  File(item),
                                  fit: BoxFit.cover,
                                  height: 200,
                                )),
                              ))
                          .toList(),
                    ),
                    Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              carouselController.previousPage();
                            },
                            icon: Icon(Icons.arrow_back_ios),
                          ),
                          IconButton(
                            onPressed: () {
                              carouselController.nextPage();
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.itemName}",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${widget.itemDescription}",
                  style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Price: Rs.${widget.itemPrice}",
                  style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      productCards.removeAt(productCards.length - 1);
                    });
                    widget.refreshParent(); // Fixed missing parentheses
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Product deleted successfully!')),
                    );
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff990011).withOpacity(0.9),
                      ),
                      width: double.infinity,
                      height: 55,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            "Delete Product",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
