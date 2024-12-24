class CategoryModel {
  int? id;
  String? categoryQroupTitle;
  List<CategoryList>? categoryList;

  CategoryModel({this.id, this.categoryQroupTitle, this.categoryList});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryQroupTitle = json['category_qroup_title'] ?? "error";
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList!.add(new CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_qroup_title'] = this.categoryQroupTitle;
    if (this.categoryList != null) {
      data['category_list'] =
          this.categoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  int? id;
  String? categoryTitle;
  String? categoryGroupName;

  CategoryList({this.id, this.categoryTitle, this.categoryGroupName});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryTitle = json['category_title'];
    categoryGroupName = json['category_group_name'] ?? "errr";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_title'] = this.categoryTitle;
    data['category_group_name'] = this.categoryGroupName;
    return data;
  }
}
