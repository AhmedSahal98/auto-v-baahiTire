import 'package:baahiTire_app/application/core/widgets/topartwidget.dart';
import 'package:baahiTire_app/application/screens/selectedServicePage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:baahiTire_app/application/core/widgets/adeegyada.dart';
import 'package:baahiTire_app/cubit/shirkadaahaState.dart';
import 'package:baahiTire_app/cubit/shirkadahaCubits.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int? selectedService;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (!didPop) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            BlocProvider.of<ShirkadahaCubits>(context).goHome();
          }
        }
      },
      child: BlocBuilder<ShirkadahaCubits, ShirkadahaStates>(
          builder: (context, state) {
        DetailState detail = state as DetailState;

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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            BlocProvider.of<ShirkadahaCubits>(
                                                    context)
                                                .goHome();
                                          },
                                          child: Container(
                                              color: Colors.white,
                                              padding: EdgeInsets.only(
                                                  bottom: 5,
                                                  left: 12,
                                                  right: 5),
                                              child: const Icon(
                                                  Icons.arrow_back,
                                                  size: 24))),
                                      Text(
                                        'Adeegyada ${detail.shirkada.name}',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  CachedNetworkImage(
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.camera_alt,
                                            size: 40, color: Colors.grey),
                                    imageUrl: detail.shirkada.img!,
                                    width: 30,
                                    height: 32,
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            Adeegyada(
                              adeegyada: detail.shirkada.adeegyada ?? [],
                              img: detail.shirkada.img!,
                              selectedIndex: selectedService,
                              onSelect: (index) {
                                setState(() {
                                  selectedService = index;
                                  if (selectedService != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SelectedServicePage(
                                                  index: selectedService!,
                                                  serviceDetailModel: detail
                                                          .shirkada
                                                          .adeegyada![
                                                              selectedService!]
                                                          .serviceDetails ??
                                                      [],
                                                  image: detail.shirkada.img!,
                                                )));
                                  }
                                });
                              },
                            ),
                            Transform.translate(
                              offset: const Offset(0, -12),
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.withOpacity(0.1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
