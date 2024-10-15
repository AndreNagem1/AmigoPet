import 'package:amigo_pet/common_ui/surface_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 220.0,
          child: Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: Colors.white24,
            child: Container(
              decoration: surfaceDecoration,
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 220.0,
          child: Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: Colors.white24,
            child: Container(
              decoration: surfaceDecoration,
            ),
          ),
        ),
        SizedBox(height: 15),
        SizedBox(
          width: double.infinity,
          height: 220.0,
          child: Shimmer.fromColors(
            baseColor: Colors.black,
            highlightColor: Colors.white24,
            child: Container(
              decoration: surfaceDecoration,
            ),
          ),
        ),
      ],
    );
  }
}
