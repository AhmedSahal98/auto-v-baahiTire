import 'package:baahiTire_app/application/core/widgets/topartwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenter extends StatefulWidget {
  HelpCenter({super.key});

  @override
  _HelpCenterState createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  @override
  final String phoneNumber = "+252613187029";

  void launchWhatsapp() async {
    final Uri phoneUri = Uri.parse('https://wa.me/$phoneNumber');
    launchUrl(phoneUri);
  }

  void makePhoneCall() async {
    final Uri phoneUri = Uri.parse('tel:$phoneNumber');
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      print('Could not launch $phoneUri');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            width: double.infinity,
            color: const Color(0xfff5f5f5),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                      width: 144, height: 120, 'assets/images/baahi.png'),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset('assets/images/arrow-u-up-left.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Need Help?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  "If you have any questions or face issues, please reach out to us "
                  "via WhatsApp or Call. We are here to help you 24/7.",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextButton.icon(
                      icon: Image.asset(
                        "assets/images/whatsapp.png",
                        width: 25,
                      ),
                      style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          overlayColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.black, width: 0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )),
                      onPressed: () {
                        launchWhatsapp();
                      },
                      label: Text(
                        'WhatsApp',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    width: 170,
                    child: TextButton.icon(
                      icon: Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                      style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0),
                          overlayColor: const MaterialStatePropertyAll(
                              Colors.transparent),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.black, width: 0.1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )),
                      onPressed: () {
                        makePhoneCall();
                      },
                      label: const Text(
                        "Call Us",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}