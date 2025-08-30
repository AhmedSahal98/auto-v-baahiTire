import 'package:baahiTire_app/application/screens/helpCenter.dart';
import 'package:flutter/material.dart';

class Topartwidget extends StatelessWidget {
  const Topartwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      color: Color(0xfff5f5f5),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(width: 144, height: 120, 'assets/images/baahi.png'),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return HelpCenter();
                        },
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);
                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Image.asset('assets/images/headphone1.jpeg'),
                ),
                SizedBox(width: 20),
                Image.asset('assets/images/notif1.jpeg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
