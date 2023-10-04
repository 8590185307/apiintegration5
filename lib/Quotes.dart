class Quotes {
  Quotes({
      required this.id,
      required this.quote,
      required this.author,});

  Quotes.fromJson(dynamic json) {
    id = json['id'];
    quote = json['quote'];
    author = json['author'];
  }
 late int id;
  late String quote;
  late String author;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quote'] = quote;
    map['author'] = author;
    return map;
  }

}