import 'package:bookly_app/Core/utils/assets.dart';
import 'package:bookly_app/Core/utils/responsive.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.screenHeight(context) * 0.255,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: CustomBookImage(
              image: books[index].image ?? AssetsData.testImage,
            ),
          );
        },
      ),
    );
  }
}
