class ProductModel {
  int? id;
  String? categoryTitle;
  String? body;
  String? categoryGroupName;
  List<PostList>? postList;

  ProductModel(
      {this.id,
        this.categoryTitle,
        this.body,
        this.categoryGroupName,
        this.postList});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryTitle = json['category_title'];
    body = json['body'];
    categoryGroupName = json['category_group_name'];
    if (json['post_list'] != null) {
      postList = <PostList>[];
      json['post_list'].forEach((v) {
        postList!.add(new PostList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_title'] = this.categoryTitle;
    data['body'] = this.body;
    data['category_group_name'] = this.categoryGroupName;
    if (this.postList != null) {
      data['post_list'] = this.postList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PostList {
  String? postTitle;
  String? body;
  String? categoryTitle;
  String? comments;
  String? imageUrl;
  String? tags;
  int? nid;
  String? created;

  PostList(
      {this.postTitle,
        this.body,
        this.categoryTitle,
        this.comments,
        this.imageUrl,
        this.tags,
        this.nid,
        this.created});

  PostList.fromJson(Map<String, dynamic> json) {
    postTitle = json['post_title'];
    body = json['body'];
    categoryTitle = json['category_title'];
    comments = json['comments'];
    imageUrl = json['image_url'];
    tags = json['tags'];
    nid = json['nid'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_title'] = this.postTitle;
    data['body'] = this.body;
    data['category_title'] = this.categoryTitle;
    data['comments'] = this.comments;
    data['image_url'] = this.imageUrl;
    data['tags'] = this.tags;
    data['nid'] = this.nid;
    data['created'] = this.created;
    return data;
  }
}
