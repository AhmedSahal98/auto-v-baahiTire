import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:degdeg_app/model/adeegyadaModel.dart';

class Adeegyada extends StatefulWidget {
  final List<AdeegyadaModel> adeegyada;
  String img;
  final int? selectedIndex;
  final Function(int) onSelect;

  Adeegyada(
      {super.key,
      required this.adeegyada,
      required this.img,
      required this.selectedIndex,
      required this.onSelect});

  @override
  State<Adeegyada> createState() => _AdeegyadaState();
}

class _AdeegyadaState extends State<Adeegyada> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        padding:  EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          childAspectRatio: 0.65,
        ),
        itemCount: widget.adeegyada.length,
        itemBuilder: (context, index) {
          final service = widget.adeegyada[index];
          bool isSelected = widget.selectedIndex == index;
          return GestureDetector(
            onTap: () => widget.onSelect(index),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 124,
                    width: 124,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          isSelected ? Color(0xff2973B2) : Color(0xffF7F7F7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CachedNetworkImage(
                        errorWidget: (context, url, error) => const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.grey),
                        imageUrl: service.image),
                  ),
                  SizedBox(height: 2),
                  Text(
                    service.name,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
