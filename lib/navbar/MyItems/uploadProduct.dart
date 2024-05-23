import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/myItemsCard.dart';

List<Widget> productCards = [];

class UploadProduct extends StatefulWidget {
  final VoidCallback refreshParent;

  const UploadProduct({super.key, required this.refreshParent});

  @override
  State<UploadProduct> createState() => _UploadProductState();
}

class _UploadProductState extends State<UploadProduct> {
  List<String> images = [];
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {
        images.add(pickedFile.path);
      });
    }
  }

  Future<void> _pickImageCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      if (!mounted) return;
      setState(() {
        images.add(pickedFile.path);
      });
    }
  }

  void _removeImage(int index) {
    if (!mounted) return;
    setState(() {
      images.removeAt(index);
    });
  }

  void _uploadProduct() {
    if (controller1.text.isEmpty ||
        controller2.text.isEmpty ||
        controller3.text.isEmpty ||
        images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields and upload at least one image'),
        ),
      );
      return;
    }

    setState(() {
      productCards.add(
        myItemsCard(
          itemName: controller1.text,
          itemPrice: controller3.text,
          itemDescription: controller2.text,
          images: images,
          Remove: () {
            productCards.removeAt(productCards.length - 1);
            widget.refreshParent();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Product removed successfully!')),
            );
          },
          refresh: widget.refreshParent,
        ),
      );

      controller1.clear();
      controller2.clear();
      controller3.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Product uploaded successfully!')),
    );

    widget.refreshParent();

    Navigator.pop(context);
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload a Product")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PRODUCT NAME",
                style: TextStyle(
                    color: Color(0xff990011).withOpacity(0.6),
                    fontFamily: 'Montserrat',
                    fontSize: 13),
              ),
              TextFormField(
                cursorColor: Color(0xff990011),
                controller: controller1,
                decoration: InputDecoration(
                    hintText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff990011))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(height: 25),
              Text(
                "PRODUCT DESCRIPTION",
                style: TextStyle(
                    color: Color(0xff990011).withOpacity(0.6),
                    fontFamily: 'Montserrat',
                    fontSize: 13),
              ),
              TextFormField(
                cursorColor: Color(0xff990011),
                controller: controller2,
                decoration: InputDecoration(
                    hintText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff990011))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(height: 25),
              Text(
                "PRODUCT PRICE",
                style: TextStyle(
                    color: Color(0xff990011).withOpacity(0.6),
                    fontFamily: 'Montserrat',
                    fontSize: 13),
              ),
              TextFormField(
                cursorColor: Color(0xff990011),
                controller: controller3,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                    hintText: "",
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff990011))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(height: 25),
              Text(
                "UPLOAD A PHOTO/PHOTOS",
                style: TextStyle(
                    color: Color(0xff990011).withOpacity(0.6),
                    fontFamily: 'Montserrat',
                    fontSize: 13),
              ),
              SizedBox(height: 10),
              Center(
                child: OutlinedButton(
                    style: ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(Size(160, 50))),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Container(
                              height: 115,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _pickImageCamera();
                                      Navigator.pop(context);
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.camera_alt_outlined,
                                      ),
                                      title: Text("Choose From Camera"),
                                    ),
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      _pickImageGallery();
                                      Navigator.pop(context);
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.photo,
                                      ),
                                      title: Text("Choose From Gallery"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Icon(Icons.upload), Text("Select Files")],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              images.isNotEmpty
                  ? Container(
                      height: 200,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Image.file(
                                File(images[index]),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Positioned(
                                right: 0,
                                child: GestureDetector(
                                  onTap: () => _removeImage(index),
                                  child: Container(
                                    color: Colors.black54,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  : Container(),
              SizedBox(height: 20),
              InkWell(
                onTap: _uploadProduct,
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
                          "Upload Product",
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
    );
  }
}
