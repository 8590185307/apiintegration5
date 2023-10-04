import 'Quotes.dart';

class RespMain {
  RespMain({
      required this.quotes,
      required this.total,
      required this.skip,
      required this.limit,});

  RespMain.fromJson(dynamic json) {
    if (json['quotes'] != null) {
      quotes = [];
      json['quotes'].forEach((v) {
        quotes.add(Quotes.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
  late List<Quotes> quotes;
 late int total;
  late int skip;
  late int limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (quotes != null) {
      map['quotes'] = quotes.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['skip'] = skip;
    map['limit'] = limit;
    return map;
  }

}