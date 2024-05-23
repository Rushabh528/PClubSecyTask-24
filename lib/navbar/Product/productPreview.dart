import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:secytask/navbar/chatPage/chatListPage.dart';
import 'package:secytask/navbar/chatPage/chatPage.dart';
import 'package:secytask/navbar/chatPage/globals.dart';

class productPreview extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final List<String> itemImages; // Changed to a list of image URLs
  final Function(Map<String, String>) onAddToCart;

  final String sellerContactDetails;
  final String sellerName;
  final String sellerAddress;

  const productPreview({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemDescription,
    required this.itemImages,
    required this.sellerContactDetails,
    required this.sellerName,
    required this.sellerAddress,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CarouselController carouselController = CarouselController();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Product Preview",
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
                      items: itemImages
                          .map((item) => Container(
                                child: Center(
                                    child: Image.network(
                                  item,
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
                  "$itemName",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$itemDescription",
                  style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Price: Rs.$itemPrice",
                  style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Text(
                      "Seller Details:",
                      style: TextStyle(
                          fontSize: 23,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Name: $sellerName",
                  style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Address: $sellerAddress",
                  style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Contact No.: $sellerContactDetails",
                  style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Map<String, String> item = {
                          'name': itemName,
                          'price': itemPrice,
                          'description': itemDescription,
                          'image': itemImages[0],
                        };
                        onAddToCart(item);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff990011).withOpacity(0.9),
                        ),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 55,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Add to Cart",
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
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                height: 60,
                                child: Column(
                                  children: [
                                    Text(
                                      "Your purchase was successful!",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Close"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    chatConversations.add(
                                      ChatConversation(
                                        sellerName: sellerName,
                                        sellerContactDetails:
                                            sellerContactDetails,
                                        lastMessage:
                                            'Hello, I am interested in your product.',
                                        lastMessageTime: DateTime.now(),
                                      ),
                                    );

                                    Navigator.pop(context);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => chatPage(
                                          sellerName: sellerName,
                                          sellerContactDetails:
                                              sellerContactDetails,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text("Go to Chat"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff990011).withOpacity(0.9),
                        ),
                        width: MediaQuery.of(context).size.width / 2.5,
                        height: 55,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Buy",
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
