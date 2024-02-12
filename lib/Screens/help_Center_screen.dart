import 'package:flutter/material.dart';
import 'contactUs_screen.dart';

class HelpCenterScreen extends StatefulWidget {
  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final _searchHelpController = TextEditingController();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'HELP CENTER',
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
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        controller: _searchHelpController,
                        style: TextStyle(color: Colors.black),
                        cursorColor: Colors.black,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your query';
                          }
                          // You can add more email validation if needed
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
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
                          hintText: 'Search For Help',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            'Not Convinced?',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
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
                                      await Future.delayed(
                                          Duration(seconds: 2));

                                      // for testing purpose........
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ContactUsScreen()));
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
