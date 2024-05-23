import 'dart:io';

import 'package:flutter/material.dart';
import 'package:secytask/helpers/appbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:secytask/navbar/profile/editProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profilePage extends StatefulWidget {
  String name;
  String email;
  String contact;

  profilePage({
    Key? key,
    required this.name,
    required this.email,
    required this.contact,
  }) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    setState(() {
      _image = imagePath != null ? File(imagePath) : null;
    });
  }

  Future<void> _saveImage(File image) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('profile_image', image.path);
  }

  Future<void> _pickimageGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _saveImage(_image!);
    }
  }

  Future<void> _pickimageCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      _saveImage(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar0(title: "Profile"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Color(0xffFCF6F5), // Set your desired app bar color here
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10),
                child: Container(
                  height: 128,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
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
                                            _pickimageCamera();
                                            Navigator.pop(context);
                                          },
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.camera_alt_outlined,
                                            ),
                                            title: Text("Camera"),
                                          ),
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            _pickimageGallery();
                                            Navigator.pop(context);
                                          },
                                          child: ListTile(
                                            leading: Icon(
                                              Icons.photo,
                                            ),
                                            title: Text("Gallery"),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 44,
                                backgroundImage:
                                    _image != null ? FileImage(_image!) : null,
                                child: _image == null
                                    ? Icon(
                                        Icons.upload,
                                        size: 30,
                                        color: Colors.grey,
                                      )
                                    : null,
                              ),
                              if (_image == null)
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 15,
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${widget.name}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Inter",
                                  color: Color(0xff990011),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.email}",
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Color(0xff990011),
                              ),
                            ),
                            Text(
                              "${widget.contact}",
                              style: TextStyle(
                                fontFamily: "Inter",
                                color: Color(0xff990011),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => editProfile(
                      name: widget.name,
                      email: widget.email,
                      contact: widget.contact,
                    ),
                  ),
                );
                if (result != null && result is Map<String, String>) {
                  setState(() {
                    widget.name = result['name']!;
                    widget.email = result['email']!;
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 4,
                  shadowColor: const Color(0xFF000000),
                  child: ListTile(
                    tileColor: const Color(0xff990011).withOpacity(0.2),
                    title: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontFamily: "Inter",
                      ),
                    ),
                    trailing: Icon((Icons.arrow_forward_ios)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                'Version 1.0.0',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
