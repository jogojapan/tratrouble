# Using AuthProvider to Check Login Status

The `AuthProvider` manages the user's authentication state. Use it to check if a user is logged in and access their token.

## Basic Usage

### Check if User is Logged In

```dart
import 'package:provider/provider.dart';
import 'package:tratrouble/providers/auth_provider.dart';

// In a widget's build method:
@override
Widget build(BuildContext context) {
  return Consumer<AuthProvider>(
    builder: (context, authProvider, child) {
      if (authProvider.isLoggedIn) {
        return Text('Welcome back!');
      } else {
        return Text('Please log in');
      }
    },
  );
}
```

### Access the User's Token

```dart
final authProvider = context.read<AuthProvider>();
final token = authProvider.token;

// Use token in API requests
final response = await http.get(
  Uri.parse('https://api.example.com/user'),
  headers: {'Authorization': 'Bearer ${authProvider.token}'},
);
```

### Logout User

```dart
final authProvider = context.read<AuthProvider>();
await authProvider.logout();
```

## Common Patterns

### Conditional Navigation

```dart
void _navigateBasedOnLoginStatus() {
  final authProvider = context.read<AuthProvider>();
  
  if (authProvider.isLoggedIn) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => FeedbackScreen()));
  } else {
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }
}
```

### Show Different UI Based on Login Status

```dart
@override
Widget build(BuildContext context) {
  return Consumer<AuthProvider>(
    builder: (context, authProvider, child) {
      return Scaffold(
        body: authProvider.isLoggedIn
            ? UserDashboard()
            : LoginPrompt(),
      );
    },
  );
}
```

### Add Login Token to API Requests

```dart
Future<void> submitFeedback(String feedback) async {
  final authProvider = context.read<AuthProvider>();
  
  if (!authProvider.isLoggedIn) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please log in first')),
    );
    return;
  }

  final response = await http.post(
    Uri.parse('https://api.example.com/feedback'),
    headers: {
      'Authorization': 'Bearer ${authProvider.token}',
      'Content-Type': 'application/json',
    },
    body: json.encode({'feedback': feedback}),
  );
}
```

## How It Works

1. **Initialization**: When the app starts, `AuthProvider.initialize()` checks if a token exists in secure storage
2. **Login**: When email verification succeeds, `AuthProvider.setLoggedIn(token)` stores the token and sets `isLoggedIn = true`
3. **Logout**: Call `AuthProvider.logout()` to clear the token and set `isLoggedIn = false`
4. **Persistence**: The token is stored in secure storage, so the user stays logged in even after closing the app
