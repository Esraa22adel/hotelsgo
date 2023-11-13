class HotelModel {
  String name;
  double stars;
  double price;
  String currency;
  String image;
  double reviewScore;
  String review;
  String address;

  HotelModel({
    required this.name,
    required this.stars,
    required this.price,
    required this.currency,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      name: json['name'] ?? '',
      // stars: json['starts'] ?? 0,
      stars: (json['starts'] as num?)?.toDouble() ?? 0.0,

      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      currency: json['currency'] ?? '',
      image: json['image'] ?? '',
      reviewScore: (json['review_score'] as num?)?.toDouble() ?? 0.0,
      review: json['review'] ?? '',
      address: json['address'] ?? '',
    );
  }
}
