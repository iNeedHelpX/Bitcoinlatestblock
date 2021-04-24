// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromJson(jsonString);

import 'dart:convert';

class ApiResponse {
  ApiResponse({
    required this.hash,
    required this.time,
    required this.blockIndex,
    required this.height,
    required this.txIndexes,
  });

  String hash;
  int time;
  int blockIndex;
  int height;
  List<int> txIndexes;

  factory ApiResponse.fromRawJson(String str) =>
      ApiResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        hash: json["hash"],
        time: json["time"],
        blockIndex: json["block_index"],
        height: json["height"],
        txIndexes: List<int>.from(json["txIndexes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hash": hash,
        "time": time,
        "block_index": blockIndex,
        "height": height,
        "txIndexes": List<dynamic>.from(txIndexes.map((x) => x)),
      };
}
