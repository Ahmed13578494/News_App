import '../SourcesResponnse/Source.dart';

/// source : {"id":"the-verge","name":"The Verge"}
/// author : "Brandon Russell"
/// title : "Samsung’s entry-level Galaxy Watch 7 has returned to its best price to date"
/// description : "I jumped on the smartwatch bandwagon a bit late, but now I can’t go a day without mine. Beyond delivering helpful notifications, it’s perfect for setting timers, tracking workouts, and monitoring my sleeping habits (which are terrible). If you haven’t yet joi…"
/// url : "https://www.theverge.com/tech/690614/samsung-galaxy-watch-7-anker-magsafe-charger-deal-sale"
/// urlToImage : "https://platform.theverge.com/wp-content/uploads/sites/2/2025/06/samsung-galaxy-watch-7-deal.png?quality=90&strip=all&crop=0%2C10.732984293194%2C100%2C78.534031413613&w=1200"
/// publishedAt : "2025-06-21T16:02:03Z"
/// content : "There are also discounts available on Amazons Fire TV Soundbar Plus and Ankers versatile 3-in-1 charger.\r\nThere are also discounts available on Amazons Fire TV Soundbar Plus and Ankers versatile 3-in… [+4007 chars]"

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }
}
