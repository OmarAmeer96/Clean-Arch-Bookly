import 'package:bookly_app/Core/utils/responsive.dart';
import 'package:bookly_app/Core/widgets/custom_fading_widget.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image_loading_indicator.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: Responsive.screenHeight(context) * 0.255,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 7),
              child: CustomBookImageLoadingWidget(),
            );
          },
        ),
      ),
    );
  }
}
