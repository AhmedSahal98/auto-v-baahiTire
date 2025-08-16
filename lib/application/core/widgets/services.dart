import 'dart:io';

import 'package:baahiTire_app/application/core/widgets/topartwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:baahiTire_app/application/core/widgets/custombutton.dart';
import 'package:baahiTire_app/model/serviceDetailModel.dart';
import 'package:url_launcher/url_launcher.dart';

class Services extends StatefulWidget {
  final ServiceDetailModel serviceDetailModel;
  final String image;

  Services({super.key, required this.image, required this.serviceDetailModel});

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  int? selectedIndex = 0;
  TextEditingController numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Topartwidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.only(
                                        bottom: 5,
                                        top: 5,
                                        left: 12,
                                        right: 5),
                                    child: const Icon(Icons.arrow_back,
                                        size: 24)),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Buy a Data',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const Spacer(),
                              CachedNetworkImage(
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.camera_alt,
                                          size: 40, color: Colors.grey),
                                  height: 32,
                                  width: 30,
                                  imageUrl: widget.image),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        ListTile(
                          contentPadding:
                              EdgeInsets.only(left: 15, right: 15),
                          leading: Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Image.asset('assets/images/evc.png'),
                          ),
                          title: Text(
                            ' EVC Plus',
                            style: TextStyle(
                                color: Color(0xff4A5763),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          subtitle: Text(
                            '612504073',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16),
                          ),
                          trailing: Icon(Icons.expand_more),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                        const SizedBox(height: 12),
                        _selectedServiceDetails(
                            selectedIndex!, widget.serviceDetailModel),
                        const SizedBox(height: 12),
                        widget.serviceDetailModel.payment.paymentMethod ==
                                'Online'
                            ? Form(
                                key: _formKey,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 16.0),
                                      Text.rich(
                                        TextSpan(
                                          text: "Fadlan Gali Number kaaga",
                                          style: TextStyle(
                                            color: Color(0xff161A1D),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 14,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: " *",
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12.0),
                                      TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                          LengthLimitingTextInputFormatter(10)
                                        ],
                                        controller: numberController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter valid number';
                                          } else if (value.length != 9 &&
                                              value.length != 10) {
                                            return 'Enter a 9 or 10-digit number';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          if (value.isNotEmpty) {
                                            _formKey.currentState!.validate();
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          hintText: 'Enter number',
                                          hintStyle: const TextStyle(
                                              color: Color(0xff798A9A),
                                              fontSize: 16),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                              color: Color(0xffE8EBEE),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE8EBEE)),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 15,
                                                  horizontal: 20),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color(0xffE8EBEE)),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Color(0xffE8EBEE)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12, left: 20, right: 20),
                                      child: Text(
                                          textAlign: TextAlign.justify,
                                          '${widget.serviceDetailModel.payment.helpText}'),
                                    ),
                                  ),
                                ],
                              )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey.withOpacity(0.1),
          ),
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: CustomButton(
                text: 'Buy now',
                color: Color(0xff2973b2),
                textColor: Colors.white,
                onPressed: () async {
                  if (widget.serviceDetailModel.payment.paymentMethod ==
                      'Online') {
                    if (_formKey.currentState?.validate() ?? false) {
                      _showPaymentDialog(context);
                    }
                  } else {
                    final Uri ur = Uri.parse(
                        ("tel:${widget.serviceDetailModel.payment.callUssd}"));
                    await launchUrl(ur);
                  }
                },
              )),
        ],
      ),
    );
  }

  Widget _selectedServiceDetails(
      int index, ServiceDetailModel serviceDetailModel) {
    var provider = serviceDetailModel;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 14,
      ),
      padding: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0xffFAFAFA),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              border: Border(
                bottom:
                    BorderSide(color: Colors.grey.withOpacity(0.1), width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  provider.orignalPrice != null
                      ? '\$${provider.orignalPrice}'
                      : '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  provider.label != null ? '${provider.label}' : '',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0xff929496),
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                provider.data_bundle != null
                    ? _buildPlanItem(Image.asset('assets/images/wifi.png'),
                        '${provider.data_bundle}')
                    : Container(),
                provider.airtime_bundle != null
                    ? _buildPlanItem(Image.asset('assets/images/call.png'),
                        '${provider.airtime_bundle}')
                    : Container(),
                provider.sms_bundle != null
                    ? _buildPlanItem(Image.asset('assets/images/mess.png'),
                        '${provider.sms_bundle}')
                    : Container(),
                provider.iptv != 0
                    ? _buildPlanItem(
                        Image.asset(
                            height: 24, width: 24, 'assets/images/tv.png'),
                        'IPTV')
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _showPaymentDialog(BuildContext context) {
    List<Map<String, String>> paymentOptions = [
      {
        'logo': 'assets/images/evc.png',
        'name': 'EVC Plus',
      },
      {
        'logo': 'assets/images/golis.png',
        'name': 'Golis Telecom',
      },
      {
        'logo': 'assets/images/premier.png',
        'name': 'Premier Bank',
      },
    ];

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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dooro habka lacag bixinta',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                Divider(
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.1),
                ),
                ...ListTile.divideTiles(
                  context: context,
                  tiles: paymentOptions
                      .map((option) => _buildPaymentOption(option)),
                  color: Colors.grey.withOpacity(0.1),
                ).toList(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPaymentOption(Map<String, String> option) {
    return ListTile(
      leading: Image.asset(option['logo']!, width: 42),
      title: Text(
        option['name']!,
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black),
      ),
      onTap: () {},
    );
  }

  Widget _buildPlanItem(Widget image, String text) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
        child: Row(
          children: [
            image,
            SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


