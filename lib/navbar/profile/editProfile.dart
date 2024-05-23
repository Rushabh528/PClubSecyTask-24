import 'package:flutter/material.dart';
import '../navBar.dart';

class editProfile extends StatefulWidget {
  final String name;
  final String email;
  final String contact;
  const editProfile(
      {super.key,
      required this.name,
      required this.email,
      required this.contact});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller1.text = widget.name;
    controller2.text = widget.email;
    controller3.text = widget.contact;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: const TextStyle(
              color: Color(0xffFCF6F5),
              fontFamily: 'Piazzolla_24pt',
              fontWeight: FontWeight.w500),
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xff990011),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                cursorColor: Color(0xff990011),
                controller: controller1,
                decoration: InputDecoration(
                    hintText: widget.name,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff990011))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.0),
              Text(
                "Email",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                cursorColor: Color(0xff990011),
                controller: controller2,
                decoration: InputDecoration(
                    hintText: widget.email,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff990011))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.0),
              Text(
                "Contact No.",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                cursorColor: Color(0xff990011),
                controller: controller3,
                decoration: InputDecoration(
                    hintText: widget.contact,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff990011))),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit mobile number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  setState(() {
                    name0 = controller1.text;
                    email0 = controller2.text;
                  });
                  Navigator.pop(context, {
                    'name': controller1.text,
                    'email': controller2.text,
                    'contact': controller3.text,
                  });
                },
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff990011).withOpacity(0.9),
                    ),
                    width: 260,
                    height: 55,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Update Profile",
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
