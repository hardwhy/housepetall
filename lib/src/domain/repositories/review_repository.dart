import 'package:housepetall/src/domain/domain.dart';

abstract class ReviewRepository {
  Future<Review> createReview(Review payload);
  Future<List<Review>> getReviews();
}
