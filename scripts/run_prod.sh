#!/bin/bash
# Run Flutter app with production flavor configuration

flutter run --flavor production \
  --dart-define=FLAVOR=production \
  --dart-define=API_KEY=REPLACE_WITH_REAL_PROD_KEY \
  --dart-define=BASE_URL=https://api.example.com \
  --dart-define=LOG_ERROR_API_URL=https://api.example.com/log \
  --dart-define=DB_SEED_ENABLED=false \
  "$@"
