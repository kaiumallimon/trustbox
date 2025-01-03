# trustbox

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



```bash
#generate sha1 key:
keytool -genkey -v -keystore C:\upload-keystore.jks -keyalg RSA -keysize 2048 -validity 1000 -alias uploadkey


# view key:
keytool -list -v -keystore C:\upload-keystore.jks -alias uploadkey

```