import 'package:flutter/material.dart';

class RemoveAdsScreen extends StatefulWidget {
  @override
  State<RemoveAdsScreen> createState() => _RemoveAdsScreenState();
}

class _RemoveAdsScreenState extends State<RemoveAdsScreen> {
  // final _emailController = TextEditingController();
  // // final _passwordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();
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
                    'REMOVE ADS',
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Remove Banner_ads with this in_app purchase. Price is\nN1000.00 per year",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Subscription is valid for one year payment will be made by itune account and renews autmatically every year, Expect option is turned off",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 10),
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
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff9B8BFF)),
                            ),
                            onPressed: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              await Future.delayed(Duration(seconds: 2));
                              setState(() {
                                _isLoading = false;
                              });
                            },
                            child: _isLoading
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'REMOVE ADS',
                                    style: TextStyle(color: Colors.white),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
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
