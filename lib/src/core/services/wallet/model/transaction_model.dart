class TransactionModel {
  final String name;
  final double value;
  final String description;
  final DateTime dtReference;
  final String type;

  TransactionModel({
    required this.name,
    required this.value,
    required this.description,
    required this.dtReference,
    required this.type,
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
    };
  }

  // Create TransactionModel from a JSON map
  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      name: json['name'] as String,
      value: json['value'] as double,
      description: json['description'] as String,
      dtReference: DateTime.parse(json['dt_reference']
          as String), // Parse ISO 8601 string back to DateTime
      type: json['type'] as String,
    );
  }
}
