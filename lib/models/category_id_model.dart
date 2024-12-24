class CategoryIdModel {
  int? id;
  String? categoryTitle;
  String? body;
  String? categoryGroupName;
  int? categoryGroupId;


  CategoryIdModel(
      {this.id,
        this.categoryTitle,
        this.body,
        this.categoryGroupName,
        this.categoryGroupId,
       });

  CategoryIdModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryTitle = json['category_title'];
    body = json['body'];
    categoryGroupName = json['category_group_name'];
    categoryGroupId = json['category_group_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_title'] = this.categoryTitle;
    data['body'] = this.body;
    data['category_group_name'] = this.categoryGroupName;
    data['category_group_id'] = this.categoryGroupId;

    return data;
  }
}
