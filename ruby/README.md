# JSON Schema Generator API - Ruby Gem

JSON Schema Generator is a JSON to JSON Schema API: it inspects sample JSON payloads and generates Draft-07 JSON Schema definitions with inferred types and property formats. It identifies formats like emails and dates, applies custom titles, and lists all properties as required.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'apiverve_jsonschemagenerator'
```

And then execute:

```bash
$ bundle install
```

Or install it yourself as:

```bash
$ gem install apiverve_jsonschemagenerator
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```ruby
require 'apiverve_jsonschemagenerator'

# Initialize the client
client = APIVerve::Jsonschemagenerator::Client.new(api_key: "YOUR_API_KEY")

# Make a request
response = client.execute({
  json: [object Object],
  title: "User Schema"
})

# Print the response
puts response
```


### Error Handling

```ruby
begin
  response = client.execute({ json: [object Object], title: "User Schema" })
  puts response["data"]
rescue APIVerve::Jsonschemagenerator::ValidationError => e
  puts "Validation error: #{e.errors.join(', ')}"
rescue APIVerve::Jsonschemagenerator::APIError => e
  puts "API error: #{e.message}"
  puts "Status code: #{e.status_code}"
end
```

### Debug Mode

```ruby
# Enable debug logging
client = APIVerve::Jsonschemagenerator::Client.new(
  api_key: "YOUR_API_KEY",
  debug: true
)
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

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jsonschemagenerator?utm_source=rubygems&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/jsonschemagenerator?utm_source=ruby&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/jsonschemagenerator?utm_source=ruby&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This gem is available under the [MIT License](LICENSE).
