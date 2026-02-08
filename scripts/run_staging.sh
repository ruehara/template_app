#!/bin/bash
# Run Flutter app with staging flavor configuration

flutter run --flavor staging \
  --dart-define=FLAVOR=staging \
  --dart-define=API_KEY=staging_key_67890 \
  --dart-define=BASE_URL=https://staging.api.example.com \
  --dart-define=LOG_ERROR_API_URL=https://staging.api.example.com/log \
  --dart-define=DB_SEED_ENABLED=false \
  "$@"
