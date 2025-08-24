import 'dart:io';

import 'package:degdeg_app/application/core/widgets/services.dart';
import 'package:degdeg_app/application/core/widgets/topartwidget.dart';
import 'package:degdeg_app/model/serviceDetailModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SelectedServicePage extends StatefulWidget {
  int index;
  List<ServiceDetailModel> serviceDetailModel;
  String image;
  SelectedServicePage({
    super.key,
    required this.index,
    required this.serviceDetailModel,
    required this.image,
    required,
  });

  @override
  _SelectedServicePageState createState() => _SelectedServicePageState();
}

class _SelectedServicePageState extends State<SelectedServicePage> {
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
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                  bottom: 5, top: 5, left: 12, right: 5),
                              child: const Icon(Icons.arrow_back, size: 24)),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Selected Data',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        CachedNetworkImage(
                            errorWidget: (context, url, error) => const Icon(
                                Icons.camera_alt,
                                size: 40,
                                color: Colors.grey),
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
                  const SizedBox(height: 10),
                  _selectedServiceDetails(
                    widget.index,
                    widget.serviceDetailModel,
                    widget.image,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _calculateItemHeight(ServiceDetailModel provider) {
    const double baseHeight = 60;
    const double perItemHeight = 40;

    int itemCount = 0;
    if (provider.data_bundle != null) itemCount++;
    if (provider.airtime_bundle != null && provider.airtime_bundle != "")
      itemCount++;
    if (provider.sms_bundle != null && provider.sms_bundle != "") itemCount++;
    if (provider.iptv != 0) itemCount++;

    return baseHeight + (itemCount * perItemHeight);
  }

  double _calculateMaxHeight(List<ServiceDetailModel> providers) {
    double maxHeight = 0;
    for (var provider in providers) {
      double height = _calculateItemHeight(provider);
      if (height > maxHeight) maxHeight = height;
    }
    return maxHeight;
  }

  Widget _selectedServiceDetails(
      int index, List<ServiceDetailModel> serviceDetailModel, String image) {
    return SizedBox(
        child: GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      clipBehavior: Clip.none,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: _calculateMaxHeight(serviceDetailModel),
      ),
      itemCount: serviceDetailModel.length,
      itemBuilder: (context, index) {
        var provider = serviceDetailModel[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Services(
                        serviceDetailModel: serviceDetailModel[index],
                        image: image)));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                  padding: EdgeInsets.symmetric(vertical: 12.5),
                  decoration: BoxDecoration(
                    color: Color(0xffFAFAFA),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.1), width: 0.5),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: '\$${provider.price} ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff8F9193),
                        decoration: provider.orignalPrice == ''
                            ? TextDecoration.none
                            : TextDecoration.lineThrough,
                      ),
                      children: [
                        TextSpan(
                          text: provider.orignalPrice != null
                              ? ' \$${provider.orignalPrice}'
                              : '',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        TextSpan(
                            text: ' / ',
                            style: TextStyle(decoration: TextDecoration.none)),
                        TextSpan(
                          text:
                              provider.label != null ? '${provider.label}' : '',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff8F9193),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                provider.data_bundle != null
                    ? _buildPlanItem(Image.asset('assets/images/wifi.png'),
                        '${provider.data_bundle}')
                    : Container(),
                provider.airtime_bundle != null && provider.airtime_bundle != ""
                    ? _buildPlanItem(
                        Image.asset('assets/images/call.png'),
                        '${provider.airtime_bundle}',
                      )
                    : Container(),
                provider.sms_bundle != null && provider.sms_bundle != ""
                    ? _buildPlanItem(Image.asset('assets/images/mess.png'),
                        '${provider.sms_bundle}')
                    : Container(),
                provider.iptv != 0
                    ? _buildPlanItem(
                        Image.asset(
                            height: 24, width: 24, 'assets/images/tv.png'),
                        'IPTV')
                    : Container(),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  Widget _buildPlanItem(Widget image, String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 1,
        ),
        child: Row(
          children: [
            image,
            SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
