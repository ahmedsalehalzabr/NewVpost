class RatingModel {
  String? id;

  double?rating;
  String?communtRating;
  RatingModel(
      {
        this.id,
        this.rating,
        this.communtRating});

  RatingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    rating = json['rating'];
    communtRating = json['communtRating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;

    data['rating'] = this.rating;
    data['communtRating'] = this.communtRating;
    return data;
  }
}
