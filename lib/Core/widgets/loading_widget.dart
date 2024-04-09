import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50.0,
              color: Colors.white,
            ),
            SizedBox(height: 8.0),
            Container(
              width: double.infinity,
              height: 10.0,
              color: Colors.white,
            ),
            SizedBox(height: 8.0),
            Container(
              width: 150.0,
              height: 10.0,
              color: Colors.white,
            ),
            SizedBox(height: 8.0),
            Container(
              width: 100.0,
              height: 10.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
