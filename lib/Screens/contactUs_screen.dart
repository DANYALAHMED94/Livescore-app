import 'package:flutter/material.dart';
import 'help_Center_screen.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();
  final _messageTitleController = TextEditingController();
  final _messageBodyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CONTACT US',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.close, color: Colors.white)),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          // You can add more email validation if needed
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 31, 31, 31),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          // You can add more email validation if needed
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 31, 31, 31),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: 'E-mail',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _messageTitleController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,

                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Please enter your password';
                        //   }
                        //   // You can add more password validation if needed
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 31, 31, 31),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: 'Message Title',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        controller: _messageBodyController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        maxLines: 3,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color.fromARGB(255, 31, 31, 31),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          hintText: 'Message body',
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff9B8BFF)),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  await Future.delayed(Duration(seconds: 2));
                                  // for testing purpose...............
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HelpCenterScreen()));
                                  setState(() {
                                    _isLoading = false;
                                  });
                                }
                              },
                              child: _isLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'CONTACT US',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Divider(
                thickness: 0.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Terms and conditions | Blazescore 2024',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Version - 1.01',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
