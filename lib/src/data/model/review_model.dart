import 'package:housepetall/src/domain/domain.dart';

class ReviewModel extends Review {
  ReviewModel({
    String? id,
    required super.ownerName,
    required super.petName,
    required super.rating,
    required super.comment,
    super.createdAt,
    super.updatedAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'],
      ownerName: json['name'],
      petName: json['petName'],
      rating: json['rating'],
      comment: json['comments'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  factory ReviewModel.fromEntity(Review entity) {
    return ReviewModel(
      id: entity.id,
      ownerName: entity.ownerName,
      petName: entity.petName,
      rating: entity.rating,
      comment: entity.comment,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': ownerName,
      'petName': petName,
      'rating': rating,
      'comments': comment,
    };
  }
}
