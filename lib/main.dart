import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/functions/setup_service_locator.dart';
import 'package:bookly_app/Core/utils/simple_bloc_observer.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/newewst_books_cubit/newewst_books_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewestBox);

  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBooksCubit>(
          create: (context) {
            return FeaturedBooksCubit(
              FetchFeaturedBooksUseCase(
                homeRepo: locator.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
        BlocProvider<NewewstBooksCubit>(
          create: (context) {
            return NewewstBooksCubit(
              FetchNewestBooksUseCase(
                homeRepo: locator.get<HomeRepoImpl>(),
              ),
            );
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
