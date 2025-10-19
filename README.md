# tratrouble

This is a Flutter-based app currently in development. Once complete, it will enable users to share feedback about public transportation, initially limited to the bus system of the Berlin/Potsdam area.

## Running the App

### Building the App with a Custom ID
The app id and namespace is defined as `com.example.app` by default. If you want to install the app on test devices as you develop customizations, we strongly recommend that you first choose a new name for your app build, **before you run the first build**. Changing this later requires you to wipe the app completely from the test device, which is quite cumbersome.

#### Setting the App ID
Here is how you do this:
1. Create a local settings file `local.properties` in the project root (i.e., the same directory that this README resides in), and define the desired app id in it:
    ```
    appId=com.mydomain.appname
    ```

    You'll find an `example.local.properties` in the root directory. You may as well remove the `example.` prefix and modify it instead of creating a new file.
    
2. Run the Flutter build as normal, see the section below.

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

