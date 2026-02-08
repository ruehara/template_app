#!/bin/bash
# Run Flutter app with development flavor configuration

flutter run --flavor development \
  --dart-define=FLAVOR=development \
  --dart-define=API_KEY=dev_key_12345 \
  --dart-define=BASE_URL=https://dev.api.example.com \
  --dart-define=LOG_ERROR_API_URL=https://dev.api.example.com/log \
  --dart-define=DB_SEED_ENABLED=true \
  "$@"
