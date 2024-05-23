import 'package:flutter/material.dart';
import 'package:secytask/navbar/Product/productPreview.dart';
import '../navbar/chatPage/chatPage.dart';
import '../navbar/chatPage/chatListPage.dart';
import '../navbar/chatPage/globals.dart';

class productCard extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final List<String> itemImages;
  final VoidCallback onAddToCart;
  final Function(Map<String, String>) AddToCart;
  final String sellerContactDetails;
  final String sellerName;
  final String sellerAddress;

  const productCard({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.itemDescription,
    required this.itemImages,
    required this.onAddToCart,
    required this.sellerContactDetails,
    required this.sellerName,
    required this.sellerAddress,
    required this.AddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => productPreview(
                itemName: itemName,
                itemPrice: itemPrice,
                itemDescription: itemDescription,
                sellerContactDetails: sellerContactDetails,
                sellerName: sellerName,
                sellerAddress: sellerAddress,
                onAddToCart: AddToCart,
                itemImages: itemImages,
              ),
            ),
          );
        },
        child: Container(
          height: orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height / 2.3
              : MediaQuery.of(context).size.height / 1.1,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 200,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                      itemImages[0],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    itemName,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Text(
                  itemDescription,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "PRICE: Rs.$itemPrice",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: InkWell(
                        onTap: onAddToCart,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0xff990011).withOpacity(0.8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 0.5,
                                blurRadius: 4,
                                offset: Offset(4, 2),
                              ),
                            ],
                          ),
                          width: 100,
                          height: 40,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Add to Cart",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xff990011).withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 0.5,
                              blurRadius: 4,
                              offset: Offset(4, 2),
                            ),
                          ],
                        ),
                        width: 70,
                        height: 40,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              "Buy",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
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
