Pod::Spec.new do |s|
  s.name             = 'APIVerveJSONSchemaGenerator'
  s.version          = '1.2.3'
  s.summary          = 'JSON Schema Generator is a JSON to JSON Schema API: it inspects sample JSON payloads and generates Draft-07 JSON Schema definitions with...'
  s.description      = <<-'DESC'
JSON Schema Generator is a JSON to JSON Schema API: it inspects sample JSON payloads and generates Draft-07 JSON Schema definitions with inferred types and property formats. It identifies formats like emails and dates, applies custom titles, and lists all properties as required.

This iOS/macOS SDK provides a convenient way to access the JSON Schema Generator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/jsonschemagenerator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/jsonschemagenerator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveJSONSchemaGenerator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
