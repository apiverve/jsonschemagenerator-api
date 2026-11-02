/// Response models for the JSON Schema Generator API.

/// API Response wrapper.
class JsonschemageneratorResponse {
  final String status;
  final dynamic error;
  final JsonschemageneratorData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  JsonschemageneratorResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory JsonschemageneratorResponse.fromJson(Map<String, dynamic> json) => JsonschemageneratorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? JsonschemageneratorData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the JSON Schema Generator API.

class JsonschemageneratorData {
  String? $schema;
  String? title;
  String? type;
  JsonschemageneratorDataProperties? properties;
  List<String>? required;

  JsonschemageneratorData({
    this.$schema,
    this.title,
    this.type,
    this.properties,
    this.required,
  });

  factory JsonschemageneratorData.fromJson(Map<String, dynamic> json) => JsonschemageneratorData(
      $schema: json['$schema'],
      title: json['title'],
      type: json['type'],
      properties: json['properties'] != null ? JsonschemageneratorDataProperties.fromJson(json['properties']) : null,
      required: (json['required'] as List?)?.cast<String>(),
    );
}

class JsonschemageneratorDataProperties {
  JsonschemageneratorDataPropertiesName? name;
  JsonschemageneratorDataPropertiesAge? age;
  JsonschemageneratorDataPropertiesEmail? email;
  JsonschemageneratorDataPropertiesActive? active;

  JsonschemageneratorDataProperties({
    this.name,
    this.age,
    this.email,
    this.active,
  });

  factory JsonschemageneratorDataProperties.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataProperties(
      name: json['name'] != null ? JsonschemageneratorDataPropertiesName.fromJson(json['name']) : null,
      age: json['age'] != null ? JsonschemageneratorDataPropertiesAge.fromJson(json['age']) : null,
      email: json['email'] != null ? JsonschemageneratorDataPropertiesEmail.fromJson(json['email']) : null,
      active: json['active'] != null ? JsonschemageneratorDataPropertiesActive.fromJson(json['active']) : null,
    );
}

class JsonschemageneratorDataPropertiesName {
  String? type;

  JsonschemageneratorDataPropertiesName({
    this.type,
  });

  factory JsonschemageneratorDataPropertiesName.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataPropertiesName(
      type: json['type'],
    );
}

class JsonschemageneratorDataPropertiesAge {
  String? type;

  JsonschemageneratorDataPropertiesAge({
    this.type,
  });

  factory JsonschemageneratorDataPropertiesAge.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataPropertiesAge(
      type: json['type'],
    );
}

class JsonschemageneratorDataPropertiesEmail {
  String? type;
  String? format;

  JsonschemageneratorDataPropertiesEmail({
    this.type,
    this.format,
  });

  factory JsonschemageneratorDataPropertiesEmail.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataPropertiesEmail(
      type: json['type'],
      format: json['format'],
    );
}

class JsonschemageneratorDataPropertiesActive {
  String? type;

  JsonschemageneratorDataPropertiesActive({
    this.type,
  });

  factory JsonschemageneratorDataPropertiesActive.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataPropertiesActive(
      type: json['type'],
    );
}

class JsonschemageneratorRequest {
  Map<String, dynamic> json;
  String? title;

  JsonschemageneratorRequest({
    required this.json,
    this.title,
  });

  Map<String, dynamic> toJson() => {
      'json': json,
      if (title != null) 'title': title,
    };
}
