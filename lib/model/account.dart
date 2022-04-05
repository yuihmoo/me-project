import 'package:cloud_firestore/cloud_firestore.dart';

class Account {
  String key;
  dynamic value;

  DocumentReference reference;

  Account(this.key, this.value, this.reference);

  Account.fromMap(Map<String, dynamic> map, {required this.reference})
      : key = map['key'],
        value = map['value'];

  Account.fromDocSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Account.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        value = json['value'],
        reference = json['reference'];

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
      };

  @override
  String toString() => "key = $key";
}
