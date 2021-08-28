# Hydrated Bloc

### What is hydrated_bloc?
- An extension to package:bloc which automatically persists and restores bloc and cubit states.

### Why hydrated_bloc?
- By default, every app will not be able to maintain its state after hot-restart or rebooting
- Sometimes, it’s more desirable to maintain app state after hot-restart or rebooting (e.g. shopping cart)
- Moreover, the app looks more professional