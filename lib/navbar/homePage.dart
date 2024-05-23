import 'package:flutter/material.dart';
import 'package:secytask/helpers/appbar.dart';
import 'package:secytask/widgets/productCard.dart';

class homePage extends StatefulWidget {
  const homePage({super.key, required this.onAddToCart});
  final Function(Map<String, String>) onAddToCart;

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Map<String, String>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCF6F5),
      appBar: appBar0(title: "Product Page"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              productCard(
                itemName: 'Mattresses',
                itemPrice: '350',
                itemDescription: 'Soft and Comfortable',
                itemImages: [
                  'https://www.godrejinterio.com/imagestore/B2C/56101508SD05928/56101508SD05928_01_803x602.jpg',
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSo2EKhSOvZODoKagRZFiOIXdhA1crkB47xuQ&s'
                ],
                onAddToCart: () {
                  // Construct the item as a Map<String, String>
                  Map<String, String> item = {
                    'name': 'Mattresses',
                    'price': '350',
                    'description': 'Soft and Comfortable',
                    'image':
                        'https://www.godrejinterio.com/imagestore/B2C/56101508SD05928/56101508SD05928_01_803x602.jpg',
                    'sellerContactDetails': '+91 9875634732',
                    'sellerName': 'Raj Verma',
                  };
                  // Call the onAddToCart callback with the item
                  widget.onAddToCart(item);
                },
                sellerContactDetails: '+91 9875634732',
                sellerName: 'Raj Verma',
                sellerAddress: 'Hall-13 B409',
                AddToCart: widget.onAddToCart,
              ),
              productCard(
                  itemName: 'Avon Cycle 21-Gear System',
                  itemPrice: '5000',
                  itemDescription:
                      'Purchased 2 years ago, condition not so bad',
                  itemImages: [
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRihLHZl6HUa_RJi0l2zBMcG7FqmPO8YKnMAA&s',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJ0fCET1WELVP09-Jg5rvmFh3-kN1WPlBmvw&s'
                  ],
                  onAddToCart: () {
                    // Construct the item as a Map<String, String>
                    Map<String, String> item = {
                      'name': 'Avon Cycle 21-Gear System',
                      'price': '5000',
                      'description':
                          'Purchased 2 years ago, condition not so bad',
                      'image':
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRihLHZl6HUa_RJi0l2zBMcG7FqmPO8YKnMAA&s',
                      'sellerContactDetails': '+91 2221112222',
                      'sellerName': 'Parv Singh',
                    };
                    // Call the onAddToCart callback with the item
                    widget.onAddToCart(item);
                  },
                  sellerContactDetails: '+91 2221112222',
                  sellerName: 'Parv Singh',
                  sellerAddress: 'Hall-13 A403',
                  AddToCart: widget.onAddToCart),
              productCard(
                  itemName: 'Bajaj Cooler',
                  itemPrice: '3500',
                  itemDescription: 'Purchased a year ago, 10 L capacity',
                  itemImages: [
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsGTYQ1cMVIOa7MIzX64m80WuEf_u_e65L2w&s',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7HFQyO2GB4ZiaJO37jpaz5Eq4fHThDlgcgA&s'
                  ],
                  onAddToCart: () {
                    // Construct the item as a Map<String, String>
                    Map<String, String> item = {
                      'name': 'Bajaj Cooler',
                      'price': '3500',
                      'description': 'Purchased a year ago, 10 L capacity',
                      'image':
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsGTYQ1cMVIOa7MIzX64m80WuEf_u_e65L2w&s',
                      'sellerContactDetails': '+91 2221112222',
                      'sellerName': 'Ranjan Dutta',
                    };
                    // Call the onAddToCart callback with the item
                    widget.onAddToCart(item);
                  },
                  sellerContactDetails: '+91 2221112222',
                  sellerName: 'Ranjan Dutta',
                  sellerAddress: 'Hall-13 F211',
                  AddToCart: widget.onAddToCart)
            ],
          ),
        ),
      ),
    );
  }
}
