// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  final String id;
  final String name;
  final String description;
  final String thumbnail;
  final int price;
  final int stock;
  final String? size;
  final String category;
  final bool isFeatured;
  final int productViews;
  final DateTime? createdAt;
  final int? userId;

  ProductEntry({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.stock,
    required this.size,
    required this.category,
    required this.isFeatured,
    required this.productViews,
    required this.createdAt,
    required this.userId,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"].toString(),
    name: json["name"] ?? '-',
    description: json["description"] ?? '-',
    thumbnail: json["thumbnail"] ?? '',
    price: _tryParseInt(json["price"]),
    stock: _tryParseInt(json["stock"]),
    size: json["size"],
    category: json["category"] ?? '-',
    isFeatured: json["is_featured"] ?? false,
    productViews: _tryParseInt(json["product_views"]),
    createdAt: json["created_at"] != null
        ? DateTime.tryParse(json["created_at"].toString())
        : null,
    userId: json["user_id"] != null
        ? int.tryParse(json["user_id"].toString())
        : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "price": price,
    "stock": stock,
    "size": size,
    "category": category,
    "is_featured": isFeatured,
    "product_views": productViews,
    "created_at": createdAt?.toIso8601String(),
    "user_id": userId,
  };

  static int _tryParseInt(dynamic value) {
    if (value is int) return value;
    if (value is String) return int.tryParse(value) ?? 0;
    return 0;
  }
}
