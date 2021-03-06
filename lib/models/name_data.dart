import 'package:flutter_tagging/flutter_tagging.dart';

class ParticipantsName extends Taggable {
  final String name;

  ParticipantsName({this.name});

  @override
  List<Object> get props => [name];

  String toJson() => '''  {
    "Name": $name,\n
  }''';
}

/// NameService
class NameService {
  static Future<List<ParticipantsName>> getNames(String query) async {
    await Future.delayed(Duration(milliseconds: 100), null);
    return <ParticipantsName>[]
        .where((lang) => lang.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
