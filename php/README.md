# JSON Schema Generator API - PHP Package

JSON Schema Generator is a tool for automatically generating JSON schemas from sample JSON data. It creates Draft-07 compatible schemas with type inference and format detection.

## Installation

Install via Composer:

```bash
composer require apiverve/jsonschemagenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Jsonschemagenerator\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'json' => [object Object],
    'title' => 'User Schema'
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Jsonschemagenerator\Client;
use APIVerve\Jsonschemagenerator\Exceptions\APIException;
use APIVerve\Jsonschemagenerator\Exceptions\ValidationException;

try {
    $response = $client->execute(['json' => [object Object], 'title' => 'User Schema']);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
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
  }
}
```

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jsonschemagenerator?utm_source=packagist&utm_medium=readme).

## Support

- Website: [https://apiverve.com/marketplace/jsonschemagenerator?utm_source=php&utm_medium=readme](https://apiverve.com/marketplace/jsonschemagenerator?utm_source=php&utm_medium=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
