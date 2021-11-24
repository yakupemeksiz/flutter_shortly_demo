import 'dart:convert';

class HistoryModel {
  final String lastUrl;
  final String shortenUrl;

  HistoryModel({
    required this.lastUrl,
    required this.shortenUrl,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> jsonData) {
    return HistoryModel(
      lastUrl: jsonData['lastUrl'],
      shortenUrl: jsonData['shortenUrl'],
    );
  }

  static Map<String, dynamic> toMap(HistoryModel sharedModel) => {
        'lastUrl': sharedModel.lastUrl,
        'shortenUrl': sharedModel.shortenUrl,
      };

  static String encode(List<HistoryModel> sharedModel) => json.encode(
        sharedModel
            .map<Map<String, dynamic>>(
                (sharedModel) => HistoryModel.toMap(sharedModel))
            .toList(),
      );

  static List<HistoryModel> decode(String sharedModel) =>
      (json.decode(sharedModel) as List<dynamic>)
          .map<HistoryModel>((item) => HistoryModel.fromJson(item))
          .toList();
}
