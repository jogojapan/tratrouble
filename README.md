# tratrouble

This is a Flutter-based app currently in development. Once complete, it will enable users to share feedback about public transportation, initially limited to the bus system of the Berlin/Potsdam area.

## Running the App

### Development Mode

To run the app against a development backend:

```bash
flutter run --dart-define=BASE_URL=https://dev.tratrouble.chobycat.com
```

### Production Mode

To run the app against the production backend (default):

```bash
flutter run
```

Or explicitly specify the production URL:

```bash
flutter run --dart-define=BASE_URL=https://tratrouble.chobycat.com
```

### Building for Release

To build an APK for production:

```bash
flutter build apk --dart-define=BASE_URL=https://tratrouble.chobycat.com
```

To build an APK for development:

```bash
flutter build apk --dart-define=BASE_URL=https://dev.tratrouble.chobycat.com
```

## Configuration

The app uses environment-based configuration for backend URLs. The base URL can be set at build time using the `--dart-define` flag. If not specified, it defaults to the production URL.

See `lib/config/api_constants.dart` for API endpoint configuration.

