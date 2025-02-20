// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            style: ToastificationStyle.flatColored,
            autoCloseDuration: const Duration(seconds: 5),
            title: H3(state.title ?? 'Failed loading reviews'),
            description:
                Paragraph(state.message ?? 'Please try again in a moment'),
          );
        }
      },
      builder: (context, state) {
        final reviews = state.reviews;
        if (state.isLoading) {
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 50),
            itemBuilder: (context, index) {
              final review = reviews.elementAt(index);
              return ReviewCard(review: review);
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: reviews.length,
          );
        }
        if (state.isSucceed && reviews.isNotEmpty) {
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
        }
        return const EmptyReviews();
      },
    );
  }
}
