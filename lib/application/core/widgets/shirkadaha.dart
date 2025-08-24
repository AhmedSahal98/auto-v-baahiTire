import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:degdeg_app/cubit/shirkadaahaState.dart';
import 'package:degdeg_app/cubit/shirkadahaCubits.dart';

class Shirkadaha extends StatelessWidget {
  Shirkadaha({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShirkadahaCubits, ShirkadahaStates>(
        builder: (context, state) {
      if (state is LoadedState) {
        var info = state.shirkadaha;

        return SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: info.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  BlocProvider.of<ShirkadahaCubits>(context)
                      .detailPage(info[index]);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.transparent,
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
                          imageUrl: info[index].img!,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        info[index].name ?? '',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
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
      } else {
        return Container();
      }
    });
  }
}
