import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/cubits/review_list/review_list_cubit.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/review_list.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:housepetall/src/presentation/widgets/src/knob.dart';
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
            children: [
              const Expanded(child: ReviewList()),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: Shadows.elevation2(color: Colors.black),
                ),
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 50),
                child: Knob(
                  width: double.infinity,
                  title: context.strings.reviewHomeSubmitButton,
                  onTap: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
