import 'package:flutter/material.dart';

class CustomBookImageLoadingWidget extends StatelessWidget {
  const CustomBookImageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(16),
      ),
      child: AspectRatio(
        aspectRatio: 150 / 224,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
