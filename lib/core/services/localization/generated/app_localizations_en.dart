// dart format off
// coverage:ignore-file

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get counterAppBarTitle => 'Counter';

  @override
  String get counterInfo => 'The value is at:';

  @override
  String get reset => 'Reset values';

  @override
  String get language => 'Change the language';

  @override
  String get theme => 'Change the theme';

  @override
  String get increment => 'Increment';

  @override
  String get decrement => 'Decrement';

  @override
  String get exit => 'Exit the App';

  @override
  String get exit_msg => 'Do you want to exit the App?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get list_title => 'List Example';

  @override
  String get detail_title => 'Detail';

  @override
  String get edit_profile => 'Edit Profile';

  @override
  String get errorLoadingList => 'Error loading list';

  @override
  String get notDefined => 'Not defined';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get retryButton => 'Try again';

  @override
  String get saveChangesButton => 'Save Changes';

  @override
  String get profileLabel => 'Profile';

  @override
  String get fieldRole => 'Role';

  @override
  String get nameLabel => 'Name';

  @override
  String get loginLabel => 'Login';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get unitLabel => 'Unit';

  @override
  String get usernameLabel => 'Username';

  @override
  String get userInfoTitle => 'User Information';

  @override
  String get nameRequired => 'Please enter your name';

  @override
  String get loginRequired => 'Please enter your login';

  @override
  String get emailRequired => 'Please enter your email';

  @override
  String get passwordRequired => 'Please enter your password';

  @override
  String get usernameRequired => 'Please enter your username';

  @override
  String get loginTitle => 'Login';

  @override
  String get enterButton => 'Enter';

  @override
  String get createAccountButton => 'Create new account';

  @override
  String get createUserTitle => 'Create User';

  @override
  String get newUserTitle => 'New User';

  @override
  String get createAccountAction => 'Create Account';

  @override
  String get readonlyInfoTitle => 'Read-only Information';

  @override
  String get newPasswordLabel => 'New Password (optional)';

  @override
  String get passwordHelperText => 'Leave blank to keep your current password';

  @override
  String get profileUpdatedSuccess => 'Profile updated successfully!';

  @override
  String get logoutButton => 'Logout';

  @override
  String get logoutDialogContent => 'Are you sure you want to log out?';

  @override
  String get homeTitle => 'Feature Showcase';

  @override
  String get homeLanguageTooltip => 'Language';

  @override
  String get homeThemeTooltip => 'Theme';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get categoryData => 'Data';

  @override
  String get categoryNetwork => 'Network';

  @override
  String get categoryHardware => 'Hardware';

  @override
  String get categoryMedia => 'Media';

  @override
  String get categoryUI => 'UI';

  @override
  String get featureAuthTitle => 'Authentication';

  @override
  String get featureAuthSubtitle => 'Login, registration and profile';

  @override
  String get featureContactsTitle => 'Contacts';

  @override
  String get featureContactsSubtitle => 'CRUD with local database';

  @override
  String get featureHttpListTitle => 'HTTP List';

  @override
  String get featureHttpListSubtitle => 'REST data fetch';

  @override
  String get featureConnectivityTitle => 'Connectivity';

  @override
  String get featureConnectivitySubtitle => 'Real-time network status';

  @override
  String get featureBiometricTitle => 'Biometrics';

  @override
  String get featureBiometricSubtitle => 'Fingerprint and Face ID';

  @override
  String get featureSensorsTitle => 'Sensors';

  @override
  String get featureSensorsSubtitle => 'Accelerometer and gyroscope';

  @override
  String get featureQrCodeTitle => 'QR Code';

  @override
  String get featureQrCodeSubtitle => 'QR and barcode reader';

  @override
  String get featureCameraTitle => 'Camera';

  @override
  String get featureCameraSubtitle => 'Photo and video';

  @override
  String get featureBluetoothTitle => 'Bluetooth';

  @override
  String get featureBluetoothSubtitle => 'BLE devices';

  @override
  String get featureGeoTitle => 'Geolocation';

  @override
  String get featureGeoSubtitle => 'GPS and geocoding';

  @override
  String get featurePdfTitle => 'PDF';

  @override
  String get featurePdfSubtitle => 'Generation and viewing';

  @override
  String get featureAudioTitle => 'Audio';

  @override
  String get featureAudioSubtitle => 'Media playback';

  @override
  String get featureChartsTitle => 'Charts';

  @override
  String get featureChartsSubtitle => 'Line, bar and pie';

  @override
  String get featureLottiesTitle => 'Animations';

  @override
  String get featureLottiesSubtitle => 'Lottie and transitions';

  @override
  String get featureCounterTitle => 'Counter';

  @override
  String get featureCounterSubtitle => 'Simple BLoC example';

  @override
  String get networkTitle => 'Connectivity';

  @override
  String get networkOnline => 'Online';

  @override
  String get networkOffline => 'Offline';

  @override
  String get networkWifi => 'Wi-Fi';

  @override
  String get networkMobile => 'Mobile data';

  @override
  String get networkEthernet => 'Ethernet';

  @override
  String get networkBluetooth => 'Bluetooth';

  @override
  String get networkVpn => 'VPN';

  @override
  String get networkOther => 'Other';

  @override
  String get networkNone => 'No connection';

  @override
  String get networkChecking => 'Checking...';

  @override
  String get networkStreamInfo => 'The stream updates automatically\nwhen the connection changes.';

  @override
  String get biometricTitle => 'Biometrics';

  @override
  String get biometricTapToTest => 'Tap \"Authenticate\" to test.';

  @override
  String get biometricWaiting => 'Waiting for biometrics...';

  @override
  String get biometricSuccess => 'Authentication successful!';

  @override
  String get biometricCancelled => 'Authentication cancelled or failed.';

  @override
  String biometricErrorCheck(String message) {
    return 'Error checking biometrics: $message';
  }

  @override
  String biometricAuthError(String message) {
    return 'Error: $message';
  }

  @override
  String get biometricFaceId => 'Face ID';

  @override
  String get biometricFingerprint => 'Fingerprint';

  @override
  String get biometricIris => 'Iris';

  @override
  String get biometricStrong => 'Strong biometrics';

  @override
  String get biometricWeak => 'Weak biometrics';

  @override
  String get biometricUnavailable => 'Biometrics not available on this device or emulator.';

  @override
  String get biometricAvailableTypes => 'Available types';

  @override
  String get biometricAuthButton => 'Authenticate';

  @override
  String get biometricAuthReason => 'Confirm your identity to continue';

  @override
  String get qrCodeTitle => 'QR Code Reader';

  @override
  String get qrCodeTorchTooltip => 'Flashlight';

  @override
  String get qrCodeScanPrompt => 'Point at a QR Code or barcode';

  @override
  String get qrCodeWaiting => 'Waiting for scan...';

  @override
  String get qrCodeSuccess => 'Scan complete';

  @override
  String get qrCodeScanButton => 'Scan';

  @override
  String get copyButton => 'Copy';

  @override
  String get qrCodeCopiedMessage => 'Copied to clipboard!';

  @override
  String get qrCodeNotSupported => 'QR code scanner is not supported on this platform.';

  @override
  String get sensorsTitle => 'Sensors';

  @override
  String get sensorsAccelerometer => 'Accelerometer';

  @override
  String get sensorsGyroscope => 'Gyroscope';

  @override
  String get sensorsAccelerometerDesc => 'Measures device acceleration on X, Y and Z axes (m/s²).';

  @override
  String get sensorsGyroscopeDesc => 'Measures rotation speed on X, Y and Z axes (rad/s).';

  @override
  String get sensorsWaiting => 'Waiting for sensor...';

  @override
  String get sensorsNotSupported => 'Sensors are not supported on this platform.';

  @override
  String get chartsTitle => 'Charts';

  @override
  String get chartsLine => 'Line';

  @override
  String get chartsBars => 'Bars';

  @override
  String get chartsPie => 'Pie';

  @override
  String get chartsMonthlySales => 'Monthly sales (×1000)';

  @override
  String get chartsQuarterlyRevenue => 'Quarterly revenue (M)';

  @override
  String get chartsMobileShare => 'Mobile market share (%)';

  @override
  String get monthJan => 'Jan';

  @override
  String get monthFeb => 'Feb';

  @override
  String get monthMar => 'Mar';

  @override
  String get monthApr => 'Apr';

  @override
  String get monthMay => 'May';

  @override
  String get monthJun => 'Jun';

  @override
  String get chartsSectionOthers => 'Others';

  @override
  String get lottiesTitle => 'Lottie Animations';

  @override
  String get lottiesAnimLoading => 'Loading';

  @override
  String get lottiesAnimSuccess => 'Success';

  @override
  String get lottiesAnimError => 'Error';

  @override
  String lottiesSpeed(String speed) {
    return 'Speed: ${speed}x';
  }

  @override
  String get lottiesNoAssets => 'Add .json files to\nassets/lotties/ to display.';

  @override
  String get lottiesPause => 'Pause';

  @override
  String get lottiesPlay => 'Play';

  @override
  String get lottiesRestart => 'Restart';

  @override
  String get testCrashTooltip => 'Trigger test exception';
}
