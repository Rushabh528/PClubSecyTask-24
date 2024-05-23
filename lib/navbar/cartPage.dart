import 'package:flutter/material.dart';
import 'package:secytask/helpers/appbar.dart';
import 'package:secytask/widgets/cartCard.dart';

class cartPage extends StatefulWidget {
  const cartPage({
    super.key,
    required this.cartItems,
  });

  final List<Map<String, String>> cartItems;

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  void _removeFromCart(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Item removed from cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar0(title: "Cart"),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.remove_shopping_cart_sharp,
                    size: 30,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: widget.cartItems.length,
              itemBuilder: (context, index) {
                final item = widget.cartItems[index];

                final itemName = item['name'] ?? 'Unknown';
                final itemPrice = item['price'] ?? '0';
                final itemDescription =
                    item['description'] ?? 'No description available';
                final itemImage = item['image'] ?? '';
                final sellerContactDetails =
                    item['sellerContactDetails'] ?? 'Not available';
                final sellerName = item['sellerName'] ?? 'Unknown';
                final sellerAddress = item['sellerAddress'] ?? 'Not available';

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: cartCard(
                    itemName: itemName,
                    itemPrice: itemPrice,
                    itemDescription: itemDescription,
                    itemImage: itemImage,
                    onRemoveFromCart: () {
                      _removeFromCart(index);
                    },
                    sellerContactDetails: sellerContactDetails,
                    sellerName: sellerName,
                    sellerAddress: sellerAddress,
                  ),
                );
              },
            ),
    );
  }
}
