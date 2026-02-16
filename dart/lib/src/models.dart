/// Response models for the JSON Schema Generator API.

/// API Response wrapper.
class JsonschemageneratorResponse {
  final String status;
  final dynamic error;
  final JsonschemageneratorData? data;

  JsonschemageneratorResponse({
    required this.status,
    this.error,
    this.data,
  });

  factory JsonschemageneratorResponse.fromJson(Map<String, dynamic> json) => JsonschemageneratorResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? JsonschemageneratorData.fromJson(json['data']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
  };
}

/// Response data for the JSON Schema Generator API.

class JsonschemageneratorData {
  JsonschemageneratorDataSchema? schema;
  JsonschemageneratorDataSampleData? sampleData;

  JsonschemageneratorData({
    this.schema,
    this.sampleData,
  });

  factory JsonschemageneratorData.fromJson(Map<String, dynamic> json) => JsonschemageneratorData(
      schema: json['schema'] != null ? JsonschemageneratorDataSchema.fromJson(json['schema']) : null,
      sampleData: json['sample_data'] != null ? JsonschemageneratorDataSampleData.fromJson(json['sample_data']) : null,
    );
}

class JsonschemageneratorDataSchema {
  String? $schema;
  String? title;
  String? type;
  JsonschemageneratorDataSchemaProperties? properties;
  List<String>? required;

  JsonschemageneratorDataSchema({
    this.$schema,
    this.title,
    this.type,
    this.properties,
    this.required,
  });

  factory JsonschemageneratorDataSchema.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataSchema(
      $schema: json['$schema'],
      title: json['title'],
      type: json['type'],
      properties: json['properties'] != null ? JsonschemageneratorDataSchemaProperties.fromJson(json['properties']) : null,
      required: (json['required'] as List?)?.cast<String>(),
    );
}

class JsonschemageneratorDataSchemaProperties {
  JsonschemageneratorDataSchemaPropertiesName? name;
  JsonschemageneratorDataSchemaPropertiesAge? age;
  JsonschemageneratorDataSchemaPropertiesEmail? email;
  JsonschemageneratorDataSchemaPropertiesActive? active;

  JsonschemageneratorDataSchemaProperties({
    this.name,
    this.age,
    this.email,
    this.active,
  });

  factory JsonschemageneratorDataSchemaProperties.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataSchemaProperties(
      name: json['name'] != null ? JsonschemageneratorDataSchemaPropertiesName.fromJson(json['name']) : null,
      age: json['age'] != null ? JsonschemageneratorDataSchemaPropertiesAge.fromJson(json['age']) : null,
      email: json['email'] != null ? JsonschemageneratorDataSchemaPropertiesEmail.fromJson(json['email']) : null,
      active: json['active'] != null ? JsonschemageneratorDataSchemaPropertiesActive.fromJson(json['active']) : null,
    );
}

class JsonschemageneratorDataSchemaPropertiesName {
  String? type;

  JsonschemageneratorDataSchemaPropertiesName({
    this.type,
  });

  factory JsonschemageneratorDataSchemaPropertiesName.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataSchemaPropertiesName(
      type: json['type'],
    );
}

class JsonschemageneratorDataSchemaPropertiesAge {
  String? type;

  JsonschemageneratorDataSchemaPropertiesAge({
    this.type,
  });

  factory JsonschemageneratorDataSchemaPropertiesAge.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataSchemaPropertiesAge(
      type: json['type'],
    );
}

class JsonschemageneratorDataSchemaPropertiesEmail {
  String? type;
  String? format;

  JsonschemageneratorDataSchemaPropertiesEmail({
    this.type,
    this.format,
  });

  factory JsonschemageneratorDataSchemaPropertiesEmail.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataSchemaPropertiesEmail(
      type: json['type'],
      format: json['format'],
    );
}

class JsonschemageneratorDataSchemaPropertiesActive {
  String? type;

  JsonschemageneratorDataSchemaPropertiesActive({
    this.type,
  });

  factory JsonschemageneratorDataSchemaPropertiesActive.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataSchemaPropertiesActive(
      type: json['type'],
    );
}

class JsonschemageneratorDataSampleData {
  String? name;
  int? age;
  String? email;
  bool? active;

  JsonschemageneratorDataSampleData({
    this.name,
    this.age,
    this.email,
    this.active,
  });

  factory JsonschemageneratorDataSampleData.fromJson(Map<String, dynamic> json) => JsonschemageneratorDataSampleData(
      name: json['name'],
      age: json['age'],
      email: json['email'],
      active: json['active'],
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
