import 'package:flutter/material.dart';
import 'package:secytask/navbar/MyItems/uploadProduct.dart';

class myItems extends StatefulWidget {
  final List<Widget> productCards;

  const myItems({super.key, required this.productCards});

  @override
  State<myItems> createState() => _myItemsState();
}

class _myItemsState extends State<myItems> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _refresh() {
      setState(() {});
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Items",
            style: const TextStyle(
                color: Color(0xffFCF6F5),
                fontFamily: 'Piazzolla_24pt',
                fontWeight: FontWeight.w500),
          ),
          foregroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UploadProduct(
                                refreshParent: _refresh,
                              )));
                },
                icon: Icon(Icons.add))
          ],
          backgroundColor: Color(0xff990011),
        ),
        body: productCards.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload_sharp,
                      size: 30,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Upload new Product',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: widget.productCards.length,
                itemBuilder: (context, index) {
                  return widget.productCards[index];
                }));
  }
}
