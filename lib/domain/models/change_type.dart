enum ChangeType {
  creation('CREATION'),
  modification('MODIFICATION'),

  /// Default value for unknown types for client.
  $unknown(null);

  final String? jsonValue;

  const ChangeType(this.jsonValue);

  factory ChangeType.fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => ChangeType.$unknown,
  );

  String? toJson() => jsonValue;
}
