# Template App

![coverage][coverage_badge]
[![style: flutter lints][flutter_lints_badge]][flutter_lints_link]

A feature-rich Flutter template with BLoC architecture, Drift database, flavors, and comprehensive CI/CD.

---

## Features ✨

- 🏗️ **Feature-first architecture** with BLoC pattern
- � **Sealed class BLoC** — exhaustive `switch` expressions on states and events
- 🧩 **Interface-driven repositories** — blocs depend on abstractions, not implementations
- 💾 **Type-safe database** with Drift (type-safe query API)
- 🌍 **Internationalization** (English, Portuguese)
- 🎨 **Material 3** with dark/light themes
- 🔐 **Authentication** with BCrypt encryption
- 🚀 **Multiple flavors** (development, staging, production)
- ✅ **Comprehensive testing** with mocks and coverage (26 tests)
- 🔄 **CI/CD** with GitHub Actions
- 🪝 **Git hooks** for pre-commit quality checks

---

## Getting Started 🚀

### Prerequisites

- Flutter SDK 3.41.x or later
- Dart SDK 3.11.x or later

### Installation

1. Clone the repository:
   ```sh
   git clone <repository-url>
   cd template_app
   ```

2. Install dependencies:
   ```sh
   flutter pub get
   ```

3. Install git hooks (lefthook - optional but recommended):
   ```sh
   # Using NPM
   npm install -g lefthook
   lefthook install
   
   # Or using Homebrew (macOS/Linux)
   brew install lefthook
   lefthook install
   ```

4. Generate code:
   ```sh
   flutter gen-l10n
   dart run build_runner build --delete-conflicting-outputs
   ```

5. Run the app:
   - **Windows**: `scripts\run_dev.bat`
   - **Linux/macOS**: `./scripts/run_dev.sh`

---

## Development 🛠️

### Running with Flavors

This project uses flavors configured via `dart-define` (not separate main files):

**Using scripts (recommended):**
```sh
# Development (with seed data)
./scripts/run_dev.sh        # Linux/macOS
scripts\run_dev.bat         # Windows

# Staging
./scripts/run_staging.sh
scripts\run_staging.bat

# Production (requires real API keys)
./scripts/run_prod.sh
scripts\run_prod.bat
```

**Manual flavor execution:**
```sh
flutter run --flavor development \
  --dart-define=FLAVOR=development \
  --dart-define=API_KEY=dev_key_12345 \
  --dart-define=BASE_URL=https://dev.api.example.com \
  --dart-define=LOG_ERROR_API_URL=https://dev.api.example.com/log \
  --dart-define=DB_SEED_ENABLED=true
```

### Flavor Configuration

| Flavor      | Purpose                | DB Seed | Base URL                         |
|-------------|------------------------|---------|----------------------------------|
| development | Local development      | ✅ Yes   | https://dev.api.example.com     |
| staging     | Pre-production testing | ❌ No    | https://staging.api.example.com |
| production  | Production release     | ❌ No    | https://api.example.com         |

### Environment Variables (dart-define)

- `FLAVOR` - Environment name
- `API_KEY` - API authentication key
- `BASE_URL` - Base API URL for the app
- `LOG_ERROR_API_URL` - Error logging endpoint
- `DB_SEED_ENABLED` - Enable/disable database seeding

### Code Generation

**After modifying `.arb` files or `.drift` schema:**

```sh
# Generate l10n translations
flutter gen-l10n

# Generate Drift database code
dart run build_runner build --delete-conflicting-outputs
```

**Note:** Generated files are gitignored and regenerated in CI.

---

## Running Tests 🧪

Run all unit and widget tests:

```sh
# Basic test run (DB_SEED_ENABLED=false is required on Windows/desktop)
flutter test --dart-define=DB_SEED_ENABLED=false

# With coverage
flutter test --coverage --dart-define=DB_SEED_ENABLED=false

# Full dart-defines (matches CI environment)
flutter test --coverage \
  --dart-define=FLAVOR=test \
  --dart-define=API_KEY=test_key \
  --dart-define=BASE_URL=http://test.example.com \
  --dart-define=LOG_ERROR_API_URL=http://test.example.com/log \
  --dart-define=DB_SEED_ENABLED=false
```

> **Windows note:** Always pass `--dart-define=DB_SEED_ENABLED=false` when running tests. Without it, the Drift in-memory test database may conflict with the seed process.

### View Coverage Report

```sh
# Generate HTML coverage report (requires lcov)
genhtml coverage/lcov.info -o coverage/html

# Open coverage report
open coverage/html/index.html  # macOS
xdg-open coverage/html/index.html  # Linux
start coverage\html\index.html  # Windows
```

---

## Working with Translations 🌐

This project supports English and Portuguese using [flutter_localizations][flutter_localizations_link].

### Adding Strings

1. Open the ARB file at `lib/core/services/localization/arb/app_en.arb`:

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Add a new key/value with description:

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string in your code:

```dart
import 'package:template_app/core/services/localization/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Translations

1. Create or update ARB files in `lib/core/services/localization/arb/`:
   - `app_en.arb` - English (already exists)
   - `app_pt.arb` - Portuguese (already exists)

2. Add translated strings to each file:

**app_en.arb:**
```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter"
}
```

**app_pt.arb:**
```arb
{
    "@@locale": "pt",
    "counterAppBarTitle": "Contador"
}
```

### Generating Translations

```sh
flutter gen-l10n
```

Or simply run `flutter run` - code generation happens automatically.

---

## Project Structure 📁

```
lib/
├── core/
│   ├── app_config/         # App initialization, routing, DI
│   ├── database/           # Drift database schema and migrations
│   ├── services/           # Shared services (theme, i18n, etc.)
│   └── utils/              # Constants, helpers, environment config
├── modules/
│   ├── auth/               # Authentication module
│   ├── contato/            # Contacts module
│   ├── counter/            # Counter example module
│   └── user/               # User management module
└── main.dart               # App entry point

test/
├── helpers/                # Test utilities and mocks
├── core/                   # Core utilities tests
└── modules/                # Feature module tests
```

---

## Contributing 🤝

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our development process and how to submit pull requests.

### Quick Start

1. Install git hooks: `dart run lefthook install`
2. Format code: `dart format .`
3. Run analyzer: `flutter analyze`
4. Run tests: `flutter test --dart-define=DB_SEED_ENABLED=false`
5. Create PR with conventional commits

---

## CI/CD Pipeline 🔄

The project uses GitHub Actions for continuous integration:

- ✅ **Format check** - Code formatting validation
- 🔍 **Static analysis** - Dart analyzer with strict mode
- 🏗️ **Code generation** - l10n and build_runner
- 🧪 **Tests** - Unit and widget tests with coverage
- 📦 **Builds** - Android APKs for all flavors
- 🔒 **Security scan** - Secret detection with Gitleaks

See [.github/workflows/ci.yaml](.github/workflows/ci.yaml) for details.

---


[coverage_badge]: coverage_badge.svg
[flutter_lints_badge]: https://img.shields.io/badge/style-flutter__lints-blue.svg
[flutter_lints_link]: https://pub.dev/packages/flutter_lints
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html

