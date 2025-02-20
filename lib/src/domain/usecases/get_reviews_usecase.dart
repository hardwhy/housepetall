// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:housepetall/src/domain/domain.dart';
import 'package:housepetall/src/domain/repositories/review_repository.dart';
import 'package:housepetall/src/domain/usecases/base_usecase.dart';

class GetReviewsUsecase extends BaseUsecaseNoRequest<List<Review>> {
  final ReviewRepository repository;
  GetReviewsUsecase({
    required this.repository,
  });

  @override
  Future<List<Review>> call() async {
    return await repository.getReviews();
  }
}
