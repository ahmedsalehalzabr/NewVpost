class CartModel {
  String? id;
  String? userId;
  int? quantity;
  double? totalPrice;
  List<Items>? items;

  CartModel({this.id, this.userId,this.quantity,this.totalPrice, this.items});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    quantity = json['quantity'];
    totalPrice = json['totalPrice'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['quantity'] = this.quantity;
    data['totalPrice'] = this.totalPrice;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? title;
  String? shortDescription;
  String? featuredImageUrl;
  double? price;
  String? urlHandle;
  String? publishedDate;
  int? quantity;
  Items(
      {this.id,
        this.title,
        this.shortDescription,
        this.featuredImageUrl,
        this.price,
        this.urlHandle,
        this.publishedDate,
        this.quantity});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['shortDescription'];
    featuredImageUrl = json['featuredImageUrl'];
    price = json['price'];
    urlHandle = json['urlHandle'];
    publishedDate = json['publishedDate'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['shortDescription'] = this.shortDescription;
    data['featuredImageUrl'] = this.featuredImageUrl;
    data['price'] = this.price;
    data['urlHandle'] = this.urlHandle;
    data['publishedDate'] = this.publishedDate;
    data['quantity'] = this.quantity;
    return data;
  }
}


