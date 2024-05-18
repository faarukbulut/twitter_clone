import 'dart:convert';

TrendTopic trendTopicFromJson(String str) => TrendTopic.fromJson(json.decode(str));

String trendTopicToJson(TrendTopic data) => json.encode(data.toJson());

class TrendTopic {
  String location;
  String hashtag;
  String tweets;

  TrendTopic({
      required this.location,
      required this.hashtag,
      required this.tweets,
  });

  factory TrendTopic.fromJson(Map<String, dynamic> json) => TrendTopic(
      location: json["location"],
      hashtag: json["hashtag"],
      tweets: json["tweets"],
  );

  Map<String, dynamic> toJson() => {
      "location": location,
      "hashtag": hashtag,
      "tweets": tweets,
  };
}
