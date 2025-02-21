// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/screen/review/cubits/review_list/review_list_cubit.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/empty_reviews.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/review_card.dart';
import 'package:housepetall/src/presentation/themes/themes.dart';
import 'package:toastification/toastification.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewListCubit, ReviewListState>(
      listener: (context, state) {
        if (state.isFailed) {
          toastification.show(
            context: context, // optional if you use ToastificationWrapper
            type: ToastificationType.error,
            backgroundColor: Colors.red,
            autoCloseDuration: const Duration(seconds: 5),
            showIcon: false,
            foregroundColor: Colors.white,
            showProgressBar: false,
            closeOnClick: false,
            closeButtonShowType: CloseButtonShowType.none,
            title: Body1.bold(
              state.title ?? context.strings.commonErrorTitle,
              color: Colors.white,
            ),
            description: Paragraph(
              state.message ?? 'Failed to retrieve reviews data',
              color: Colors.white,
            ),
          );
        }
      },
      builder: (context, state) {
        final reviews = state.reviews;
        if (state.isLoading) {
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 50),
            itemBuilder: (context, index) {
              return LoadingReviewCard();
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: 5,
          );
        }
        if (reviews.isEmpty) {
          return const EmptyReviews();
        }
        return RefreshIndicator(
          color: Colors.deepOrange,
          backgroundColor: Colors.white,
          onRefresh: () async {
            context.read<ReviewListCubit>().getReviews();
          },
          child: Scrollbar(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 50),
              itemBuilder: (context, index) {
                final review = reviews.elementAt(index);
                return ReviewCard(review: review);
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: reviews.length,
            ),
          ),
        );
      },
    );
  }
}
