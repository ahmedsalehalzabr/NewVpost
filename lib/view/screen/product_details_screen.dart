import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:posts/core/functions/translateDatabase.dart';
import 'package:posts/linkapi.dart';
import 'package:posts/models/product_model.dart';
import 'package:posts/view/screen/widget/item/customsladeritem.dart';
import 'package:posts/view/screen/widget/item/customtitildetails.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;
  ProductDetailsScreen({
    required this.productModel,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          ImageSliders(
            imageUrl:
                AppLink.signUp + productModel.postList![0].imageUrl.toString(),
          ),
          DetailsTitle(
            name:
                "${translateDatabase(productModel.postList![0].categoryTitle.toString(), productModel.postList![0].categoryTitle.toString())}",
            shortDescription:
                _cleanHtmlText(productModel.postList![0].postTitle.toString()),
            //  price:productModel.price.toString(),
            Id: productModel.postList![0].nid.toString(),

            // description: catalogModels.description.toString(),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الوصف',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                ReadMoreText(
                  _cleanHtmlText(productModel.postList![0].body.toString()),
                  trimLines: 8,
                  textAlign: TextAlign.justify,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: " عرض المزيد ",
                  trimExpandedText: " عرض اقل ",
                  lessStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  moreStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    height: 2,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ) //;}
          ),
    );
  }

  String _cleanHtmlText(String? htmlText) {
    if (htmlText == null || htmlText.isEmpty) return '';

    // تحليل النص HTML
    var document = parse(htmlText);

    // استخراج النص فقط
    String plainText = document.body?.text ?? '';

    // إزالة الأسطر الفارغة المتعددة
    plainText = plainText.replaceAll(RegExp(r'\n\s*\n'), '\n');

    // إزالة المسافات الزائدة
    plainText = plainText.trim();

    return plainText;
  }
}
