import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/layouts/src/plain.dart';
import 'package:housepetall/src/presentation/screen/review/cubits/review_list/review_list_cubit.dart';
import 'package:housepetall/src/presentation/screen/review/routes.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/footer.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/review_list.dart';

export '../routes.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewListCubit()..getReviews(),
      child: PlainLayout(
        withPadding: false,
        title: context.strings.reviewHome,
        footer: ReviewFooter(
          onTap: () {
            Navigator.pushNamed(context, ReviewRoutes.submit);
          },
          title: context.strings.reviewHomeSubmitButton,
        ),
        child: const ReviewList(),
      ),
    );
  }
}
