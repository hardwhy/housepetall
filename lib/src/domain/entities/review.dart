// ignore_for_file: public_member_api_docs, sort_constructors_first
class Review {
  final int rating;
  final String ownerName;
  final String petName;
  final String? comment;
  Review({
    required this.rating,
    required this.ownerName,
    required this.petName,
    this.comment,
  });

  Review copyWith({
    int? rating,
    String? ownerName,
    String? petName,
    String? comment,
  }) {
    return Review(
      rating: rating ?? this.rating,
      ownerName: ownerName ?? this.ownerName,
      petName: petName ?? this.petName,
      comment: comment ?? this.comment,
    );
  }

  @override
  String toString() {
    return 'Review(rating: $rating, ownerName: $ownerName, petName: $petName, comment: $comment)';
  }

  @override
  bool operator ==(covariant Review other) {
    if (identical(this, other)) return true;
  
    return 
      other.rating == rating &&
      other.ownerName == ownerName &&
      other.petName == petName &&
      other.comment == comment;
  }

  @override
  int get hashCode {
    return rating.hashCode ^
      ownerName.hashCode ^
      petName.hashCode ^
      comment.hashCode;
  }
}
