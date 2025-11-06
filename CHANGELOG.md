# 1.0.0

## Major Update - Flutter 3.x & Dart 3.x Compatibility

### Breaking Changes
- **Minimum SDK version**: Updated to Dart 3.0.0 and Flutter 3.0.0
- **Dependencies**: Upgraded to latest versions
  - `http`: ^0.13.4 → ^1.5.0
  - `hondooye_error_handler`: ^0.0.3 → ^1.0.0
  - `hondooye_logger`: ^0.0.2 → ^1.0.0
  - `flutter_lints`: ^2.0.1 → ^6.0.0

### Improvements
- Updated HTTP methods to use uppercase (GET, POST, PUT, DELETE, PATCH, MULTIPART) to comply with HTTP standards and fix CORS issues
- Modernized code to use latest Dart 3.x features:
  - Removed unnecessary `library` declaration
  - Added explicit type annotations
  - Updated to use `super.key` and `super.child` syntax
  - Added `const` constructor to `HdyHttpConfig`
- Fixed variable declaration issues in `HdyHttpResponse`
- Improved code style and removed deprecated patterns

### Code Quality
- Fixed all linter warnings and errors
- Improved code consistency and maintainability

# 0.0.11

Add header list generator for custom method of http client.

