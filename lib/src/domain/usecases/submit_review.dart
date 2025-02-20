// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:housepetall/src/domain/domain.dart';
import 'package:housepetall/src/domain/repositories/review_repository.dart';
import 'package:housepetall/src/domain/usecases/base_usecase.dart';

class SubmitReviewUsecase extends BaseUsecase<Review, Review> {
  final ReviewRepository repository;
  SubmitReviewUsecase({
    required this.repository,
  });

  @override
  Future<Review> call(Review request) async {
    return await repository.createReview(request);
  }
}
