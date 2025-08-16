import 'package:baahiTire_app/application/core/widgets/topartwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baahiTire_app/application/core/widgets/shirkadaha.dart';
import 'package:baahiTire_app/cubit/shirkadaahaState.dart';
import 'package:baahiTire_app/cubit/shirkadahaCubits.dart';
import 'package:baahiTire_app/model/shirkadahaModel.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<SlidersModel>? banners = [];
  bool addwidth = false;
  final List<Map<String, String>> transactions = [
    {
      'icon': 'assets/images/hormuud.png',
      'title': 'Hormuud',
      'date': 'Jan 18, 2025  7:30 AM',
      'amount': '\$25.00',
      'phone': '612504073',
    },
    {
      'icon': 'assets/images/somnet.png',
      'title': 'Somnet',
      'date': 'Jan 8, 2025  8:30 AM',
      'amount': '\$25.00',
      'phone': '612204073',
    },
    {
      'icon': 'assets/images/somtel.png',
      'title': 'somtel',
      'date': 'Jan 5, 2025  7:30 AM',
      'amount': '\$25.00',
      'phone': '613879652',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShirkadahaCubits, ShirkadahaStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          banners = state.shirkadahaSliders;
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Topartwidget(),
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    height: double.infinity,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        BlocProvider.of<ShirkadahaCubits>(context)
                            .getData(isRefresh: true);
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            Transform.translate(
                              offset: const Offset(0, -15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 6,
                                            ),
                                            Shirkadaha(),
                                            CarouselSlider(
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  clipBehavior: Clip.none,
                                                  height: 180,
                                                  autoPlayInterval:
                                                      Duration(seconds: 2),
                                                  autoPlayCurve:
                                                      Curves.fastOutSlowIn,
                                                  viewportFraction: 1.05,
                                                  onPageChanged:
                                                      (index, reason) {
                                                    setState(() {
                                                      _currentIndex = index;
                                                    });
                                                  },
                                                ),
                                                items: banners!.map((banner) {
                                                  return GestureDetector(
                                                      onTap: () {
                                                        if (banner.url !=
                                                                null &&
                                                            banner.url!
                                                                .isNotEmpty) {
                                                          launchUrl(Uri.parse(
                                                              banner.url!));
                                                        }
                                                      },
                                                      child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 3),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(16),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl:
                                                                banner.slider!,
                                                            fit: BoxFit.cover,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            errorWidget:
                                                                (context, error,
                                                                    stackTrace) {
                                                              return Container(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300,
                                                                child: Center(
                                                                  child: Icon(
                                                                    Icons
                                                                        .broken_image,
                                                                    size: 40,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ));
                                                }).toList()),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            AnimatedSmoothIndicator(
                                                activeIndex: _currentIndex,
                                                count: banners!.length,
                                                effect: WormEffect(
                                                    dotWidth: (addwidth ==
                                                            _currentIndex)
                                                        ? 25
                                                        : 10,
                                                    dotHeight: 10,
                                                    activeDotColor:
                                                        Colors.black,
                                                    dotColor: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 12),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: Color(0xffF5F5F5)),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(height: 12),
                                            Image.asset(
                                                'assets/images/line.png'),
                                            Container(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 15, right: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Transactions',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Text(
                                                    'See all',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListView.builder(
                                              padding: EdgeInsets.zero,
                                              itemCount: transactions.length,
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                final transection =
                                                    transactions[index];
                                                return GestureDetector(
                                                  onTap: () {
                                                    _showPaymentDialog(
                                                      context,
                                                      transection,
                                                    );
                                                  },
                                                  child: ListTile(
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            left: 15,
                                                            right: 15),
                                                    leading: Container(
                                                      padding:
                                                          EdgeInsets.all(12),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.white,
                                                      ),
                                                      child: Image.asset(
                                                          transection['icon']!),
                                                    ),
                                                    title: Text(
                                                      transection['title']!,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 16),
                                                    ),
                                                    subtitle: Text(
                                                      '${transection['phone']}',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff4A5763),
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 12),
                                                    ),
                                                    trailing: SizedBox(
                                                      width: 200,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            '${transection['amount']}',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              '${transection['date']}',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  _showPaymentDialog(
      BuildContext context, final Map<String, String> transaction) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
          backgroundColor: Colors.white,
          alignment: Alignment.bottomCenter,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        transaction['title']!,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        transaction['date']!,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                _buildDetailRow('From:', 'Abdulkadir Ali'),
                _buildDetailRow('Account ID:', '#B504073'),
                _buildDetailRow('Number:', '612504073'),
                _buildDetailRow('Adeega:', 'Anfac Plus'),
                _buildDetailRow('Notes:', 'Thanks You'),
                _buildDetailRow('Total:', '\$0.25', isBold: true),
                Divider(
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                ListTile(
                  leading: Image.asset('assets/images/evc.png'),
                  title: Text(
                    'EVC Plus',
                    style: TextStyle(
                        color: Color(0xff4A5763),
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  subtitle: Text(
                    '612504073',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  trailing: Text(
                    '\$0.25',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                  child: Text(
                    'Waalagu Guleys tay Dirisla Lacagtaan',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String title, String value, {bool isBold = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Color(0xff4A5763),
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
          Text(
            value,
            style: TextStyle(
              color: Color(0xff4A5763),
              fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
