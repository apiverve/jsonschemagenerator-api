# JSON Schema Generator API - Dart/Flutter Client

JSON Schema Generator is a tool for automatically generating JSON schemas from sample JSON data. It creates Draft-07 compatible schemas with type inference and format detection.

[![pub package](https://img.shields.io/pub/v/apiverve_jsonschemagenerator.svg)](https://pub.dev/packages/apiverve_jsonschemagenerator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [JSON Schema Generator API](https://apiverve.com/marketplace/jsonschemagenerator?utm_source=dart&utm_medium=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_jsonschemagenerator: ^1.1.14
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_jsonschemagenerator/apiverve_jsonschemagenerator.dart';

void main() async {
  final client = JsonschemageneratorClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'json': [object Object],
      'title': 'User Schema'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "schema": {
      "$schema": "http://json-schema.org/draft-07/schema#",
      "title": "User Schema",
      "type": "object",
      "properties": {
        "name": {
          "type": "string"
        },
        "age": {
          "type": "integer"
        },
        "email": {
          "type": "string",
          "format": "email"
        },
        "active": {
          "type": "boolean"
        }
      },
      "required": [
        "name",
        "age",
        "email",
        "active"
      ]
    },
    "sample_data": {
      "name": "John Doe",
      "age": 30,
      "email": "john@example.com",
      "active": true
    }
  }
}
```

## API Reference

- **API Home:** [JSON Schema Generator API](https://apiverve.com/marketplace/jsonschemagenerator?utm_source=dart&utm_medium=readme)
- **Documentation:** [docs.apiverve.com/ref/jsonschemagenerator](https://docs.apiverve.com/ref/jsonschemagenerator?utm_source=dart&utm_medium=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=readme)
