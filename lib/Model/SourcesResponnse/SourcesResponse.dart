import 'Source.dart';

class SourcesResponse {
  SourcesResponse({this.status, this.sources});

  SourcesResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }

  String? status;
  String? message;
  List<Source>? sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
