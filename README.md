# hondooye_http

A powerful and easy-to-use HTTP client package for Flutter applications. This package provides a clean API for making HTTP requests with built-in error handling and logging capabilities.

## Features

- ✅ Full HTTP method support (GET, POST, PUT, DELETE, PATCH)
- ✅ Custom HTTP requests
- ✅ Multipart file uploads
- ✅ Automatic error handling with `hondooye_error_handler`
- ✅ Request/response logging with `hondooye_logger`
- ✅ Custom headers and authentication tokens
- ✅ Query parameters support
- ✅ UTF-8 JSON decoding option
- ✅ Configurable timeout settings
- ✅ Flutter 3.x & Dart 3.x compatible

## Getting started

### Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  hondooye_http: ^1.0.0
  hondooye_error_handler: ^1.0.0
  hondooye_logger: ^1.0.0
```

### Requirements

- Dart SDK: `>=3.0.0 <4.0.0`
- Flutter: `>=3.0.0`

## Usage

### Basic Setup

```dart
import 'package:hondooye_http/hondooye_http.dart';

// Generate HTTP client with configuration
final HdyHttp http = HdyHttpUtils.generateHttp(
  scheme: "https",
  host: "api.example.com",
  port: 443,
);
```

### GET Request

```dart
// Simple GET request
final response = await http.client.get(path: '/posts/1');

// GET with query parameters
final response = await http.client.get(
  path: '/posts',
  queryParameters: {
    "page": "1",
    "limit": "10"
  },
);

// GET with custom headers
final response = await http.client.get(
  path: '/posts/1',
  headerList: [
    {"X-Custom-Header": "value"}
  ],
);

// GET with authentication token
final response = await http.client.get(
  path: '/posts/1',
  token: "your-auth-token",
);
```

### POST Request

```dart
final response = await http.client.post(
  path: '/posts',
  body: {
    "title": "New Post",
    "body": "Post content",
    "userId": 1
  },
);
```

### PUT Request

```dart
final response = await http.client.put(
  path: '/posts/1',
  body: {
    "id": 1,
    "title": "Updated Post",
    "body": "Updated content",
    "userId": 1
  },
);
```

### DELETE Request

```dart
final response = await http.client.delete(
  path: '/posts/1',
  body: {},
);
```

### PATCH Request

```dart
final response = await http.client.patch(
  path: '/posts/1',
  body: {
    "title": "Patched Post"
  },
);
```

### Custom Request

```dart
final response = await http.client.custom(
  uriAddress: 'https://api.example.com/custom-endpoint',
  method: "GET",
  queryParameters: {"param": "value"},
  body: {"key": "value"},
);
```

### Multipart File Upload

```dart
import 'dart:io';

final response = await http.client.multipart(
  uriAddress: 'https://api.example.com/upload',
  method: "POST",
  file: File('/path/to/file.jpg'),
  token: "your-auth-token",
);
```

### Advanced Configuration

```dart
final HdyHttp http = HdyHttpUtils.generateHttp(
  scheme: "https",
  host: "api.example.com",
  port: 443,
  contentType: "application/json",
  tokenType: "Bearer ",
  jsonDecodingOption: JsonDecodingOption.utf8, // or JsonDecodingOption.noOption
);

// Custom timeout (default: 20 seconds)
final httpConfig = HdyHttpConfig(
  scheme: "https",
  host: "api.example.com",
  port: 443,
  networkTimeLimit: Duration(seconds: 30),
);
final httpClient = HdyHttpClient(httpConfig: httpConfig);
```

## Error Handling

This package integrates with `hondooye_error_handler` for automatic error handling. HTTP errors are automatically converted to `HdyException` with appropriate error types:

- 400: Bad Request
- 401: Unauthorized
- 403: Forbidden
- 404: Not Found
- 408: Request Timeout
- 409: Conflict
- 422: Unprocessable Entity
- 500: Internal Server Error
- 503: Service Unavailable

## Logging

Request and response logging is automatically handled by `hondooye_logger`. All HTTP requests and responses are logged for debugging purposes.

## Additional information

- Repository: [https://github.com/Doohyeon-Kim/hondooye-http.git](https://github.com/Doohyeon-Kim/hondooye-http.git)
- Version: 1.0.0
