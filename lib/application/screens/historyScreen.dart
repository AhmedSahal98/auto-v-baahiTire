import 'package:baahiTire_app/application/core/widgets/topartwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<Map<String, String>> transactions = [
    {
      'icon': 'assets/images/hormuud.png',
      'title': 'Hormuud',
      'phone': '612504073',
      'date': 'Sep 4, 2025  6:30 AM',
      'amount': '\$25.00',
    },
    {
      'icon': 'assets/images/somtel.png',
      'title': 'Somtel',
      'phone': '615000000',
      'date': 'Feb 3, 2025  10:30 AM',
      'amount': '\$10.00',
    },
    {
      'icon': 'assets/images/somnet.png',
      'title': 'Somnet',
      'phone': '615002300',
      'date': 'Jan 1, 2025  7:30 AM',
      'amount': '\$5.00',
    },
    {
      'icon': 'assets/images/somlink.png',
      'title': 'Somlink',
      'phone': '612504073',
      'date': 'Sep 4, 2025  8:30 AM',
      'amount': '\$25.00',
    },
    {
      'icon': 'assets/images/hormuud.png',
      'title': 'Dahabshiil',
      'phone': '612504073',
      'date': 'Sep 4, 2025  8:30 AM',
      'amount': '\$25.00',
    },
    {
      'icon': 'assets/images/telesom.png',
      'title': 'TelesomPlus',
      'phone': '613002300',
      'date': 'Feb 1, 2025  9:30 AM',
      'amount': '\$12.00',
    },
    {
      'icon': 'assets/images/amtel.png',
      'title': 'Amtel',
      'phone': '613002300',
      'date': 'Feb 1, 2025  9:30 AM',
      'amount': '\$12.00',
    },
    {
      'icon': 'assets/images/somtel.png',
      'title': 'Somtel',
      'phone': '615000000',
      'date': 'Feb 3, 2025  10:30 AM',
      'amount': '\$10.00',
    },
    {
      'icon': 'assets/images/somnet.png',
      'title': 'Somnet',
      'phone': '615002300',
      'date': 'Jan 1, 2025  7:30 AM',
      'amount': '\$5.00',
    },
    {
      'icon': 'assets/images/somlink.png',
      'title': 'Somlink',
      'phone': '612504073',
      'date': 'Sep 4, 2025  8:30 AM',
      'amount': '\$25.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Column(
        children: [
          Topartwidget(),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(),
                ),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transactions",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: transactions.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final transaction = transactions[index];
                              return ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Image.asset(transaction['icon']!),
                                ),
                                title: Text(
                                  transaction['title']!,
                                  maxLines: 1,
                                  overflow: TextOverflow.visible,
                                  softWrap: false,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                                subtitle: Text(
                                  '${transaction['phone']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                                trailing: SizedBox(
                                  width: 200,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${transaction['amount']}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${transaction['date']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
    );
  }
}
