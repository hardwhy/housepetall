import 'package:housepetall/src/data/data.dart';
import 'package:housepetall/src/data/datasources/remote/review_remote_data_source.dart';
import 'package:housepetall/src/domain/entities/review.dart';
import 'package:housepetall/src/domain/repositories/review_repository.dart';

class ReviewRepositoryImpl extends ReviewRepository {
  final ReviewRemoteDataSource dataSource;

  ReviewRepositoryImpl(this.dataSource);

  @override
  Future<Review> createReview(Review payload) async {
    return await dataSource.createReview(ReviewModel.fromEntity(payload));
  }

  @override
  Future<List<Review>> getReviews() async {
    return await dataSource.getReviews();
  }
}
