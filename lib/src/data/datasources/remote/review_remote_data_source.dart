import 'package:dio/dio.dart';
import 'package:housepetall/src/common/constants/constants.dart';
import 'package:housepetall/src/common/network/network.dart';
import 'package:housepetall/src/data/data.dart';

abstract class ReviewRemoteDataSource {
  Future<ReviewModel> createReview(ReviewModel request);
  Future<List<ReviewModel>> getReviews();
}

class ReviewRemoteDataSourceImpl extends ReviewRemoteDataSource
    with DioWrapper {
  final Dio dio;
  ReviewRemoteDataSourceImpl({required this.dio});

  @override
  Future<ReviewModel> createReview(ReviewModel request) async {
    return exec<ReviewModel>(() async {
      final response = await dio.post(
        Endpoints.review.createReviews,
        data: request.toJson(),
      );

      final result = ReviewModel.fromJson(response.data['review']);
      return result;
    });
  }

  @override
  Future<List<ReviewModel>> getReviews() async {
    return exec<List<ReviewModel>>(() async {
      final response = await dio.get(Endpoints.review.getReviews);
      final List jsons = response.data['reviews'];

      final result = jsons.map((json) => ReviewModel.fromJson(json)).toList();
      return result;
    });
  }
}
