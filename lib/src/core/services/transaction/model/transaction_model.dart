class TransactionModel {
  final String name;
  final double value;
  final String description;
  final DateTime dtReference;
  final String type;
  final String uid;

  TransactionModel({
    required this.name,
    required this.value,
    required this.description,
    required this.dtReference,
    required this.type,
    required this.uid,
  });

  // Convert TransactionModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'description': description,
      'dt_reference':
          dtReference.toIso8601String(), // Format DateTime as ISO 8601 string
      'type': type,
      'uid': uid,
    };
  }

  // Create TransactionModel from a JSON map
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      name: json['name'] as String,
      value: double.parse(json['value'].toString()),
      description: json['description'] as String,
      dtReference: DateTime.parse(json['dt_reference']
          as String), // Parse ISO 8601 string back to DateTime
      type: json['type'] as String,
      uid: json['uid'] as String,
    );
  }
}
