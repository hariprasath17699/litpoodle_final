// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.recommentationsList,
  });

  List<RecommentationsList> recommentationsList;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        recommentationsList: List<RecommentationsList>.from(
            json["recommentations-list"]
                .map((x) => RecommentationsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recommentations-list":
            List<dynamic>.from(recommentationsList.map((x) => x.toJson())),
      };
}

class RecommentationsList {
  RecommentationsList({
    this.propertyId,
    this.images,
    this.price,
    this.beds,
    this.baths,
    this.city,
    this.stateCode,
    this.cityStateCode,
  });

  String propertyId;
  String images;
  String price;
  String beds;
  String baths;
  String city;
  String stateCode;
  String cityStateCode;

  factory RecommentationsList.fromJson(Map<String, dynamic> json) =>
      RecommentationsList(
        propertyId: json["property_id"],
        images: json["images"],
        price: json["price"],
        beds: json["beds"],
        baths: json["baths"],
        city: json["city"],
        stateCode: json["state_code"],
        cityStateCode: json["city_state_code"],
      );

  Map<String, dynamic> toJson() => {
        "property_id": propertyId,
        "images": images,
        "price": price,
        "beds": beds,
        "baths": baths,
        "city": city,
        "state_code": stateCode,
        "city_state_code": cityStateCode,
      };
}
