# Contributing to Template App

Thank you for your interest in contributing to Template App! This document provides guidelines and instructions for contributing to this project.

## Table of Contents

- [Getting Started](#getting-started)
- [Development Setup](#development-setup)
- [Flavors and Environments](#flavors-and-environments)
- [Code Generation](#code-generation)
- [Testing](#testing)
- [Code Conventions](#code-conventions)
- [Database Migrations](#database-migrations)
- [Security](#security)
- [Pull Request Process](#pull-request-process)

## Getting Started

### Prerequisites

- Flutter SDK 3.38.x or later
- Dart SDK 3.10.8 or later
- Android Studio / VS Code with Flutter extensions
- Git

### Initial Setup

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd template_app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Install git hooks (lefthook):
   
   **Option 1 - Using NPM (recommended):**
   ```bash
   npm install -g lefthook
   lefthook install
   ```
   
   **Option 2 - Using Homebrew (macOS/Linux):**
   ```bash
   brew install lefthook
   lefthook install
   ```
   
   **Option 3 - Download binary:**
   - Download from [Lefthook Releases](https://github.com/evilmartians/lefthook/releases)
   - Place in your PATH
   - Run `lefthook install`

4. Generate code:
   ```bash
   flutter gen-l10n
   dart run build_runner build --delete-conflicting-outputs
   ```

5. Run tests to verify setup:
   ```bash
   flutter test
   ```

## Development Setup

### Running the App

The project uses flavors for different environments. Use the provided scripts:

**Windows:**
```cmd
# Development
scripts\run_dev.bat

# Staging
scripts\run_staging.bat

# Production (requires proper API keys)
scripts\run_prod.bat
```

**Linux/macOS:**
```bash
# Development
./scripts/run_dev.sh

# Staging
./scripts/run_staging.sh

# Production (requires proper API keys)
./scripts/run_prod.sh
```

### Manual Flavor Execution

If you prefer manual control:

```bash
flutter run --flavor development \
  --dart-define=FLAVOR=development \
  --dart-define=API_KEY=dev_key_12345 \
  --dart-define=BASE_URL=https://dev.api.example.com \
  --dart-define=LOG_ERROR_API_URL=https://dev.api.example.com/log \
  --dart-define=DB_SEED_ENABLED=true
```

## Flavors and Environments

The project supports three flavors:

| Flavor      | Purpose                    | DB Seed | API Base URL                    |
|-------------|----------------------------|---------|----------------------------------|
| development | Local development          | ✅ Yes   | https://dev.api.example.com     |
| staging     | Pre-production testing     | ❌ No    | https://staging.api.example.com |
| production  | Production release         | ❌ No    | https://api.example.com         |

### Environment Variables (via dart-define)

- `FLAVOR`: Environment identifier (development/staging/production)
- `API_KEY`: API authentication key
- `BASE_URL`: Base API URL
- `LOG_ERROR_API_URL`: Error logging endpoint
- `DB_SEED_ENABLED`: Whether to seed database with test data (true/false)

## Code Generation

### L10n (Internationalization)

After modifying `.arb` files in `lib/core/services/localization/arb/`:

```bash
flutter gen-l10n
```

### Drift (Database)

After modifying `.drift` files or data classes:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### When to Generate

- After pulling changes that modify schema or localization
- After modifying database schema (`schema.drift`)
- After adding/modifying ARB translation files
- Before running tests or building the app

**Note:** Generated files are **not committed** to version control. CI will regenerate them automatically.

## Testing

### Running Tests

```bash
# All tests
flutter test

# With coverage
flutter test --coverage

# Specific file
flutter test test/modules/auth/auth_bloc_test.dart

# With dart-defines (same as CI)
flutter test \
  --dart-define=FLAVOR=test \
  --dart-define=API_KEY=test_key \
  --dart-define=BASE_URL=http://test.example.com \
  --dart-define=LOG_ERROR_API_URL=http://test.example.com/log \
  --dart-define=DB_SEED_ENABLED=false
```

### Test Structure

Tests mirror the `lib/` structure:

```
lib/
  modules/
    auth/
      repository/
        auth_repository.dart
test/
  modules/
    auth/
      auth_repository_test.dart
```

### Writing Tests

- Use `mocktail` for mocking dependencies
- Follow AAA pattern: Arrange, Act, Assert
- Use `bloc_test` for testing BLoCs
- Add tests for new features in the same PR
- Aim for meaningful coverage, not just metrics

### Test Helpers

Reusable mocks are in `test/helpers/`:
- `mock_database.dart` - Database mocks
- `mock_shared_preferences.dart` - SharedPreferences mocks
- `test_helpers.dart` - Common test utilities

## Code Conventions

### Project Structure

The project follows a feature-first architecture:

```
lib/
  core/                      # Shared utilities and services
    app_config/              # App initialization, routing, DI
    database/                # Drift database configuration
    services/                # Shared services (theme, localization, etc.)
    utils/                   # Utilities, constants, helpers
  modules/                   # Feature modules
    <feature>/
      blocs/                 # BLoC state management
      models/                # Data models
      pages/                 # UI pages/screens
      repository/            # Data access layer
      widgets/               # Feature-specific widgets (optional)
```

### Naming Conventions

- **Files**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Variables**: `camelCase`
- **Constants**: `camelCase` or `SCREAMING_SNAKE_CASE` for compile-time constants
- **Private members**: prefix with `_`

### BLoC Pattern

- Events: `<Action>Event` (e.g., `LoginEvent`)
- States: `<State>` (e.g., `Authenticated`, `AuthLoading`)
- BLoCs: `<Feature>Bloc` (e.g., `AuthBloc`)

### Widgets

- Prefer `const` constructors where possible
- Extract complex widgets into separate files
- Use `Key` for widgets in lists or when testing

### Code Style

- Follow Dart style guide
- Use single quotes for strings
- Prefer `final` over `var` when possible
- Run `dart format .` before committing (enforced by git hooks)
- Address all analyzer warnings

## Database Migrations

### Schema Changes

1. Modify `lib/core/database/tables/schema.drift`
2. Increment `schemaVersion` in `database.dart`
3. Add migration logic in `MigrationStrategy.onUpgrade`
4. Test migration thoroughly
5. Document the change in `lib/core/database/migrations/README.md`

### Example Migration

```dart
@override
MigrationStrategy get migration {
  return MigrationStrategy(
    onUpgrade: (m, from, to) async {
      await customStatement('PRAGMA foreign_keys = OFF');
      for (var step = from + 1; step <= to; step++) {
        switch (step) {
          case 2:
            // Add new column in version 2
            await m.addColumn(tafusuario, tafusuario.newColumn);
            break;
        }
      }
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
```

### Migration Testing

- Test upgrade path from previous versions
- Verify data integrity after migration
- Test on both Android and iOS

## Security

### Critical Rules

1. **NEVER commit real API keys or secrets**
2. **Use environment variables** (dart-define) for configuration
3. **Review `.gitignore`** before committing sensitive files
4. **Use GitHub Secrets** for CI/CD credentials
5. **Avoid hardcoded credentials** in code

### Secrets Management

- Development: Use fake/placeholder values in scripts
- Staging: Store in CI secrets or secure vault
- Production: **Always** use GitHub Secrets or secure key management

### Default Seed Data

The database seed in `database.dart` is for **development only**. It runs only when `DB_SEED_ENABLED=true`. Never use real credentials in seed data.

## Pull Request Process

### Before Submitting

1. **Format code**: `dart format .`
2. **Run analyzer**: `flutter analyze`
3. **Run tests**: `flutter test --coverage`
4. **Generate code**: Ensure codegen is up to date
5. **Update documentation**: If adding features or changing APIs
6. **Check git hooks**: Ensure lefthook is installed and passing

### PR Checklist

- [ ] Code formatted (`dart format`)
- [ ] Analyzer passes with no warnings (`flutter analyze`)
- [ ] All tests pass (`flutter test`)
- [ ] New features have tests
- [ ] Coverage has not decreased significantly
- [ ] Documentation updated (if needed)
- [ ] No secrets or sensitive data committed
- [ ] Generated files not committed (except drift schema files if needed)
- [ ] Conventional commit messages used

### Commit Message Format

Use conventional commits:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `ci`, `build`

Examples:
- `feat(auth): add biometric authentication`
- `fix(database): resolve migration crash on iOS`
- `docs(readme): update installation instructions`
- `test(contato): add repository unit tests`

### Review Process

1. Create PR with descriptive title and description
2. CI must pass all checks
3. Request review from at least one team member
4. Address review comments
5. Squash commits if needed
6. Merge when approved

## Questions?

If you have questions or need help:

1. Check existing issues and discussions
2. Review the README.md for setup instructions
3. Ask in team chat or create a discussion
4. For bugs, create an issue with reproduction steps

Thank you for contributing! 🎉
