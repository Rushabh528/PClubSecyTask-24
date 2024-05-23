import 'package:flutter/material.dart';
import 'package:secytask/navbar/chatPage/chatListPage.dart';
import 'package:secytask/navbar/chatPage/chatPage.dart';
import 'package:secytask/navbar/chatPage/globals.dart';

class cartCard extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String itemDescription;
  final String itemImage;
  final VoidCallback onRemoveFromCart;

  final String sellerContactDetails;
  final String sellerName;
  final String sellerAddress;

  const cartCard({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.itemDescription,
    required this.itemImage,
    required this.onRemoveFromCart,
    required this.sellerContactDetails,
    required this.sellerName,
    required this.sellerAddress,
  });

  @override
  State<cartCard> createState() => _cartCardState();
}

class _cartCardState extends State<cartCard> {
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      height: orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height / 2.3
          : MediaQuery.of(context).size.height / 1.1,
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
          border: Border.all(width: 2), borderRadius: BorderRadius.circular(5)),
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
                    borderRadius: BorderRadius.circular(5)),
                child: Image.network(
                  "${widget.itemImage}",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Center(
                child: Text(
              "${widget.itemName}",
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.w800),
            )),
            Text(
              "${widget.itemDescription}",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "PRICE: Rs.${widget.itemPrice}",
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: InkWell(
                    onTap: widget.onRemoveFromCart,
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
                            "Remove",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
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
                                    sellerName: widget.sellerName,
                                    sellerContactDetails:
                                        widget.sellerContactDetails,
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
                                      sellerName: widget.sellerName,
                                      sellerContactDetails:
                                          widget.sellerContactDetails,
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
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
