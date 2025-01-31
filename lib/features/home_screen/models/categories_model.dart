// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

List<String> categoriesModelFromJson(str) =>
    List<String>.from(str.map((x) => x));
