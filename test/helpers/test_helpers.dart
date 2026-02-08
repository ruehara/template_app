import 'package:get_it/get_it.dart';

/// Reset GetIt for testing
void resetGetIt() {
  final getIt = GetIt.instance;
  if (getIt.isRegistered<GetIt>()) {
    getIt.reset();
  } else {
    // GetIt is already reset
  }
}

/// Setup common test mocks
void setupTestMocks() {
  resetGetIt();
  // Add common mock registrations here if needed
}
