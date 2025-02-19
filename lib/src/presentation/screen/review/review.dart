import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/cubits/review_list/review_list_cubit.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/footer.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/review_list.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

export 'routes.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewListCubit()..getReviews(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: TopBar(
          title: context.strings.reviewHome,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Expanded(child: ReviewList()),
              ReviewFooter()
            ],
          ),
        ),
      ),
    );
  }
}