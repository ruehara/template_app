// dart format off
// coverage:ignore-file
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// Text shown in the AppBar of the Counter Page
  ///
  /// In en, this message translates to:
  /// **'Counter'**
  String get counterAppBarTitle;

  /// No description provided for @counterInfo.
  ///
  /// In en, this message translates to:
  /// **'The value is at:'**
  String get counterInfo;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset values'**
  String get reset;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Change the language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Change the theme'**
  String get theme;

  /// No description provided for @increment.
  ///
  /// In en, this message translates to:
  /// **'Increment'**
  String get increment;

  /// No description provided for @decrement.
  ///
  /// In en, this message translates to:
  /// **'Decrement'**
  String get decrement;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit the App'**
  String get exit;

  /// No description provided for @exit_msg.
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit the App?'**
  String get exit_msg;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @list_title.
  ///
  /// In en, this message translates to:
  /// **'List Example'**
  String get list_title;

  /// No description provided for @detail_title.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get detail_title;

  /// No description provided for @edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get edit_profile;

  /// No description provided for @errorLoadingList.
  ///
  /// In en, this message translates to:
  /// **'Error loading list'**
  String get errorLoadingList;

  /// No description provided for @errorInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or password'**
  String get errorInvalidCredentials;

  /// No description provided for @errorNotAuthenticated.
  ///
  /// In en, this message translates to:
  /// **'You are not signed in'**
  String get errorNotAuthenticated;

  /// No description provided for @errorUserNotFound.
  ///
  /// In en, this message translates to:
  /// **'User not found'**
  String get errorUserNotFound;

  /// No description provided for @errorUserAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'This user already exists'**
  String get errorUserAlreadyExists;

  /// No description provided for @errorNoUnit.
  ///
  /// In en, this message translates to:
  /// **'No unit found. Contact the administrator.'**
  String get errorNoUnit;

  /// No description provided for @errorNoProfile.
  ///
  /// In en, this message translates to:
  /// **'No profile found. Contact the administrator.'**
  String get errorNoProfile;

  /// No description provided for @errorNoTeam.
  ///
  /// In en, this message translates to:
  /// **'No team found. Contact the administrator.'**
  String get errorNoTeam;

  /// No description provided for @errorDatabase.
  ///
  /// In en, this message translates to:
  /// **'A database error occurred. Please try again.'**
  String get errorDatabase;

  /// No description provided for @errorNetwork.
  ///
  /// In en, this message translates to:
  /// **'A network error occurred. Please try again.'**
  String get errorNetwork;

  /// No description provided for @errorUnexpected.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again.'**
  String get errorUnexpected;

  /// No description provided for @notDefined.
  ///
  /// In en, this message translates to:
  /// **'Not defined'**
  String get notDefined;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @retryButton.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retryButton;

  /// No description provided for @saveChangesButton.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChangesButton;

  /// No description provided for @profileLabel.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileLabel;

  /// No description provided for @fieldRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get fieldRole;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get nameLabel;

  /// No description provided for @loginLabel.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginLabel;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @unitLabel.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unitLabel;

  /// No description provided for @usernameLabel.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get usernameLabel;

  /// No description provided for @userInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'User Information'**
  String get userInfoTitle;

  /// No description provided for @nameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get nameRequired;

  /// No description provided for @loginRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your login'**
  String get loginRequired;

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get emailRequired;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get passwordRequired;

  /// No description provided for @usernameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter your username'**
  String get usernameRequired;

  /// No description provided for @loginTitle.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginTitle;

  /// No description provided for @enterButton.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enterButton;

  /// No description provided for @createAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Create new account'**
  String get createAccountButton;

  /// No description provided for @createUserTitle.
  ///
  /// In en, this message translates to:
  /// **'Create User'**
  String get createUserTitle;

  /// No description provided for @newUserTitle.
  ///
  /// In en, this message translates to:
  /// **'New User'**
  String get newUserTitle;

  /// No description provided for @createAccountAction.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountAction;

  /// No description provided for @readonlyInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Read-only Information'**
  String get readonlyInfoTitle;

  /// No description provided for @newPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password (optional)'**
  String get newPasswordLabel;

  /// No description provided for @passwordHelperText.
  ///
  /// In en, this message translates to:
  /// **'Leave blank to keep your current password'**
  String get passwordHelperText;

  /// No description provided for @profileUpdatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get profileUpdatedSuccess;

  /// No description provided for @logoutButton.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutButton;

  /// No description provided for @logoutDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutDialogContent;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Feature Showcase'**
  String get homeTitle;

  /// No description provided for @homeLanguageTooltip.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get homeLanguageTooltip;

  /// No description provided for @homeThemeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get homeThemeTooltip;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// No description provided for @categoryData.
  ///
  /// In en, this message translates to:
  /// **'Data'**
  String get categoryData;

  /// No description provided for @categoryNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get categoryNetwork;

  /// No description provided for @categoryHardware.
  ///
  /// In en, this message translates to:
  /// **'Hardware'**
  String get categoryHardware;

  /// No description provided for @categoryMedia.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get categoryMedia;

  /// No description provided for @categoryUI.
  ///
  /// In en, this message translates to:
  /// **'UI'**
  String get categoryUI;

  /// No description provided for @featureAuthTitle.
  ///
  /// In en, this message translates to:
  /// **'Authentication'**
  String get featureAuthTitle;

  /// No description provided for @featureAuthSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Login, registration and profile'**
  String get featureAuthSubtitle;

  /// No description provided for @featureContactsTitle.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get featureContactsTitle;

  /// No description provided for @featureContactsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'CRUD with local database'**
  String get featureContactsSubtitle;

  /// No description provided for @featureHttpListTitle.
  ///
  /// In en, this message translates to:
  /// **'HTTP List'**
  String get featureHttpListTitle;

  /// No description provided for @featureHttpListSubtitle.
  ///
  /// In en, this message translates to:
  /// **'REST data fetch'**
  String get featureHttpListSubtitle;

  /// No description provided for @featureConnectivityTitle.
  ///
  /// In en, this message translates to:
  /// **'Connectivity'**
  String get featureConnectivityTitle;

  /// No description provided for @featureConnectivitySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Real-time network status'**
  String get featureConnectivitySubtitle;

  /// No description provided for @featureBiometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Biometrics'**
  String get featureBiometricTitle;

  /// No description provided for @featureBiometricSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint and Face ID'**
  String get featureBiometricSubtitle;

  /// No description provided for @featureSensorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sensors'**
  String get featureSensorsTitle;

  /// No description provided for @featureSensorsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Accelerometer and gyroscope'**
  String get featureSensorsSubtitle;

  /// No description provided for @featureQrCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'QR Code'**
  String get featureQrCodeTitle;

  /// No description provided for @featureQrCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'QR and barcode reader'**
  String get featureQrCodeSubtitle;

  /// No description provided for @featureCameraTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get featureCameraTitle;

  /// No description provided for @featureCameraSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Photo and video'**
  String get featureCameraSubtitle;

  /// No description provided for @featureBluetoothTitle.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth'**
  String get featureBluetoothTitle;

  /// No description provided for @featureBluetoothSubtitle.
  ///
  /// In en, this message translates to:
  /// **'BLE devices'**
  String get featureBluetoothSubtitle;

  /// No description provided for @featureGeoTitle.
  ///
  /// In en, this message translates to:
  /// **'Geolocation'**
  String get featureGeoTitle;

  /// No description provided for @featureGeoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'GPS and geocoding'**
  String get featureGeoSubtitle;

  /// No description provided for @featurePdfTitle.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get featurePdfTitle;

  /// No description provided for @featurePdfSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Generation and viewing'**
  String get featurePdfSubtitle;

  /// No description provided for @featureAudioTitle.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get featureAudioTitle;

  /// No description provided for @featureAudioSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Media playback'**
  String get featureAudioSubtitle;

  /// No description provided for @featureChartsTitle.
  ///
  /// In en, this message translates to:
  /// **'Charts'**
  String get featureChartsTitle;

  /// No description provided for @featureChartsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Line, bar and pie'**
  String get featureChartsSubtitle;

  /// No description provided for @featureLottiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Animations'**
  String get featureLottiesTitle;

  /// No description provided for @featureLottiesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Lottie and transitions'**
  String get featureLottiesSubtitle;

  /// No description provided for @featureCounterTitle.
  ///
  /// In en, this message translates to:
  /// **'Counter'**
  String get featureCounterTitle;

  /// No description provided for @featureCounterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Simple BLoC example'**
  String get featureCounterSubtitle;

  /// No description provided for @featureHtmlTitle.
  ///
  /// In en, this message translates to:
  /// **'HTML Viewer'**
  String get featureHtmlTitle;

  /// No description provided for @featureHtmlSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Render HTML with papyrus'**
  String get featureHtmlSubtitle;

  /// No description provided for @networkTitle.
  ///
  /// In en, this message translates to:
  /// **'Connectivity'**
  String get networkTitle;

  /// No description provided for @networkOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get networkOnline;

  /// No description provided for @networkOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get networkOffline;

  /// No description provided for @networkWifi.
  ///
  /// In en, this message translates to:
  /// **'Wi-Fi'**
  String get networkWifi;

  /// No description provided for @networkMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile data'**
  String get networkMobile;

  /// No description provided for @networkEthernet.
  ///
  /// In en, this message translates to:
  /// **'Ethernet'**
  String get networkEthernet;

  /// No description provided for @networkBluetooth.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth'**
  String get networkBluetooth;

  /// No description provided for @networkVpn.
  ///
  /// In en, this message translates to:
  /// **'VPN'**
  String get networkVpn;

  /// No description provided for @networkOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get networkOther;

  /// No description provided for @networkNone.
  ///
  /// In en, this message translates to:
  /// **'No connection'**
  String get networkNone;

  /// No description provided for @networkChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking...'**
  String get networkChecking;

  /// No description provided for @networkStreamInfo.
  ///
  /// In en, this message translates to:
  /// **'The stream updates automatically\nwhen the connection changes.'**
  String get networkStreamInfo;

  /// No description provided for @biometricTitle.
  ///
  /// In en, this message translates to:
  /// **'Biometrics'**
  String get biometricTitle;

  /// No description provided for @biometricTapToTest.
  ///
  /// In en, this message translates to:
  /// **'Tap \"Authenticate\" to test.'**
  String get biometricTapToTest;

  /// No description provided for @biometricWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for biometrics...'**
  String get biometricWaiting;

  /// No description provided for @biometricSuccess.
  ///
  /// In en, this message translates to:
  /// **'Authentication successful!'**
  String get biometricSuccess;

  /// No description provided for @biometricCancelled.
  ///
  /// In en, this message translates to:
  /// **'Authentication cancelled or failed.'**
  String get biometricCancelled;

  /// No description provided for @biometricErrorCheck.
  ///
  /// In en, this message translates to:
  /// **'Error checking biometrics: {message}'**
  String biometricErrorCheck(String message);

  /// No description provided for @biometricAuthError.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String biometricAuthError(String message);

  /// No description provided for @biometricFaceId.
  ///
  /// In en, this message translates to:
  /// **'Face ID'**
  String get biometricFaceId;

  /// No description provided for @biometricFingerprint.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint'**
  String get biometricFingerprint;

  /// No description provided for @biometricIris.
  ///
  /// In en, this message translates to:
  /// **'Iris'**
  String get biometricIris;

  /// No description provided for @biometricStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong biometrics'**
  String get biometricStrong;

  /// No description provided for @biometricWeak.
  ///
  /// In en, this message translates to:
  /// **'Weak biometrics'**
  String get biometricWeak;

  /// No description provided for @biometricUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Biometrics not available on this device or emulator.'**
  String get biometricUnavailable;

  /// No description provided for @biometricAvailableTypes.
  ///
  /// In en, this message translates to:
  /// **'Available types'**
  String get biometricAvailableTypes;

  /// No description provided for @biometricAuthButton.
  ///
  /// In en, this message translates to:
  /// **'Authenticate'**
  String get biometricAuthButton;

  /// No description provided for @biometricAuthReason.
  ///
  /// In en, this message translates to:
  /// **'Confirm your identity to continue'**
  String get biometricAuthReason;

  /// No description provided for @qrCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'QR Code Reader'**
  String get qrCodeTitle;

  /// No description provided for @qrCodeTorchTooltip.
  ///
  /// In en, this message translates to:
  /// **'Flashlight'**
  String get qrCodeTorchTooltip;

  /// No description provided for @qrCodeScanPrompt.
  ///
  /// In en, this message translates to:
  /// **'Point at a QR Code or barcode'**
  String get qrCodeScanPrompt;

  /// No description provided for @qrCodeWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for scan...'**
  String get qrCodeWaiting;

  /// No description provided for @qrCodeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Scan complete'**
  String get qrCodeSuccess;

  /// No description provided for @qrCodeScanButton.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get qrCodeScanButton;

  /// No description provided for @copyButton.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get copyButton;

  /// No description provided for @qrCodeCopiedMessage.
  ///
  /// In en, this message translates to:
  /// **'Copied to clipboard!'**
  String get qrCodeCopiedMessage;

  /// No description provided for @qrCodeNotSupported.
  ///
  /// In en, this message translates to:
  /// **'QR code scanner is not supported on this platform.'**
  String get qrCodeNotSupported;

  /// No description provided for @sensorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Sensors'**
  String get sensorsTitle;

  /// No description provided for @sensorsAccelerometer.
  ///
  /// In en, this message translates to:
  /// **'Accelerometer'**
  String get sensorsAccelerometer;

  /// No description provided for @sensorsGyroscope.
  ///
  /// In en, this message translates to:
  /// **'Gyroscope'**
  String get sensorsGyroscope;

  /// No description provided for @sensorsAccelerometerDesc.
  ///
  /// In en, this message translates to:
  /// **'Measures device acceleration on X, Y and Z axes (m/s²).'**
  String get sensorsAccelerometerDesc;

  /// No description provided for @sensorsGyroscopeDesc.
  ///
  /// In en, this message translates to:
  /// **'Measures rotation speed on X, Y and Z axes (rad/s).'**
  String get sensorsGyroscopeDesc;

  /// No description provided for @sensorsWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for sensor...'**
  String get sensorsWaiting;

  /// No description provided for @sensorsNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Sensors are not supported on this platform.'**
  String get sensorsNotSupported;

  /// No description provided for @chartsTitle.
  ///
  /// In en, this message translates to:
  /// **'Charts'**
  String get chartsTitle;

  /// No description provided for @chartsLine.
  ///
  /// In en, this message translates to:
  /// **'Line'**
  String get chartsLine;

  /// No description provided for @chartsBars.
  ///
  /// In en, this message translates to:
  /// **'Bars'**
  String get chartsBars;

  /// No description provided for @chartsPie.
  ///
  /// In en, this message translates to:
  /// **'Pie'**
  String get chartsPie;

  /// No description provided for @chartsMonthlySales.
  ///
  /// In en, this message translates to:
  /// **'Monthly sales (×1000)'**
  String get chartsMonthlySales;

  /// No description provided for @chartsQuarterlyRevenue.
  ///
  /// In en, this message translates to:
  /// **'Quarterly revenue (M)'**
  String get chartsQuarterlyRevenue;

  /// No description provided for @chartsMobileShare.
  ///
  /// In en, this message translates to:
  /// **'Mobile market share (%)'**
  String get chartsMobileShare;

  /// No description provided for @monthJan.
  ///
  /// In en, this message translates to:
  /// **'Jan'**
  String get monthJan;

  /// No description provided for @monthFeb.
  ///
  /// In en, this message translates to:
  /// **'Feb'**
  String get monthFeb;

  /// No description provided for @monthMar.
  ///
  /// In en, this message translates to:
  /// **'Mar'**
  String get monthMar;

  /// No description provided for @monthApr.
  ///
  /// In en, this message translates to:
  /// **'Apr'**
  String get monthApr;

  /// No description provided for @monthMay.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get monthMay;

  /// No description provided for @monthJun.
  ///
  /// In en, this message translates to:
  /// **'Jun'**
  String get monthJun;

  /// No description provided for @chartsSectionOthers.
  ///
  /// In en, this message translates to:
  /// **'Others'**
  String get chartsSectionOthers;

  /// No description provided for @lottiesTitle.
  ///
  /// In en, this message translates to:
  /// **'Lottie Animations'**
  String get lottiesTitle;

  /// No description provided for @lottiesAnimLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get lottiesAnimLoading;

  /// No description provided for @lottiesAnimSuccess.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get lottiesAnimSuccess;

  /// No description provided for @lottiesAnimError.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get lottiesAnimError;

  /// No description provided for @lottiesSpeed.
  ///
  /// In en, this message translates to:
  /// **'Speed: {speed}x'**
  String lottiesSpeed(String speed);

  /// No description provided for @lottiesNoAssets.
  ///
  /// In en, this message translates to:
  /// **'Add .json files to\nassets/lotties/ to display.'**
  String get lottiesNoAssets;

  /// No description provided for @lottiesPause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get lottiesPause;

  /// No description provided for @lottiesPlay.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get lottiesPlay;

  /// No description provided for @lottiesRestart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get lottiesRestart;

  /// No description provided for @testCrashTooltip.
  ///
  /// In en, this message translates to:
  /// **'Trigger test exception'**
  String get testCrashTooltip;

  /// No description provided for @featureFileShareTitle.
  ///
  /// In en, this message translates to:
  /// **'File Share'**
  String get featureFileShareTitle;

  /// No description provided for @featureFileShareSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Share text and files'**
  String get featureFileShareSubtitle;

  /// No description provided for @featurePrinterTitle.
  ///
  /// In en, this message translates to:
  /// **'Printer'**
  String get featurePrinterTitle;

  /// No description provided for @featurePrinterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Print documents'**
  String get featurePrinterSubtitle;

  /// No description provided for @cameraTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get cameraTitle;

  /// No description provided for @cameraTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get cameraTakePhoto;

  /// No description provided for @cameraPickGallery.
  ///
  /// In en, this message translates to:
  /// **'Pick from Gallery'**
  String get cameraPickGallery;

  /// No description provided for @cameraNoImage.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get cameraNoImage;

  /// No description provided for @cameraNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Camera is not supported on this platform.'**
  String get cameraNotSupported;

  /// No description provided for @cameraErrorPicking.
  ///
  /// In en, this message translates to:
  /// **'Failed to pick or capture image.'**
  String get cameraErrorPicking;

  /// No description provided for @bluetoothTitle.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth (BLE)'**
  String get bluetoothTitle;

  /// No description provided for @bluetoothScan.
  ///
  /// In en, this message translates to:
  /// **'Scan'**
  String get bluetoothScan;

  /// No description provided for @bluetoothStop.
  ///
  /// In en, this message translates to:
  /// **'Stop'**
  String get bluetoothStop;

  /// No description provided for @bluetoothScanning.
  ///
  /// In en, this message translates to:
  /// **'Scanning...'**
  String get bluetoothScanning;

  /// No description provided for @bluetoothNoDevices.
  ///
  /// In en, this message translates to:
  /// **'No devices found'**
  String get bluetoothNoDevices;

  /// No description provided for @bluetoothDevicesFound.
  ///
  /// In en, this message translates to:
  /// **'devices found'**
  String get bluetoothDevicesFound;

  /// No description provided for @bluetoothNotSupported.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is not supported on this platform.'**
  String get bluetoothNotSupported;

  /// No description provided for @bluetoothAdapterOff.
  ///
  /// In en, this message translates to:
  /// **'Bluetooth is off. Enable it and try again.'**
  String get bluetoothAdapterOff;

  /// No description provided for @bluetoothDeviceUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown device'**
  String get bluetoothDeviceUnknown;

  /// No description provided for @bluetoothPairedDevices.
  ///
  /// In en, this message translates to:
  /// **'Paired Devices'**
  String get bluetoothPairedDevices;

  /// No description provided for @bluetoothNearbyDevices.
  ///
  /// In en, this message translates to:
  /// **'Nearby Devices'**
  String get bluetoothNearbyDevices;

  /// No description provided for @bluetoothConnected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get bluetoothConnected;

  /// No description provided for @geolocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Geolocation'**
  String get geolocationTitle;

  /// No description provided for @geolocationGetPosition.
  ///
  /// In en, this message translates to:
  /// **'Get My Location'**
  String get geolocationGetPosition;

  /// No description provided for @geolocationLatitude.
  ///
  /// In en, this message translates to:
  /// **'Latitude'**
  String get geolocationLatitude;

  /// No description provided for @geolocationLongitude.
  ///
  /// In en, this message translates to:
  /// **'Longitude'**
  String get geolocationLongitude;

  /// No description provided for @geolocationAltitude.
  ///
  /// In en, this message translates to:
  /// **'Altitude'**
  String get geolocationAltitude;

  /// No description provided for @geolocationAccuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get geolocationAccuracy;

  /// No description provided for @geolocationSpeed.
  ///
  /// In en, this message translates to:
  /// **'Speed'**
  String get geolocationSpeed;

  /// No description provided for @geolocationWaiting.
  ///
  /// In en, this message translates to:
  /// **'Tap the button to get your location.'**
  String get geolocationWaiting;

  /// No description provided for @geolocationLoading.
  ///
  /// In en, this message translates to:
  /// **'Getting location...'**
  String get geolocationLoading;

  /// No description provided for @geolocationError.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String geolocationError(String message);

  /// No description provided for @geolocationPermissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied. Please enable it in settings.'**
  String get geolocationPermissionDenied;

  /// No description provided for @geolocationPermissionDeniedForever.
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied. Open app settings to enable it.'**
  String get geolocationPermissionDeniedForever;

  /// No description provided for @geolocationServiceDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled. Please enable GPS and try again.'**
  String get geolocationServiceDisabled;

  /// No description provided for @pdfTitle.
  ///
  /// In en, this message translates to:
  /// **'PDF'**
  String get pdfTitle;

  /// No description provided for @pdfPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview / Print'**
  String get pdfPreview;

  /// No description provided for @pdfInfo.
  ///
  /// In en, this message translates to:
  /// **'Tap to generate a sample PDF and open the print and share preview.'**
  String get pdfInfo;

  /// No description provided for @fileShareTitle.
  ///
  /// In en, this message translates to:
  /// **'File Share'**
  String get fileShareTitle;

  /// No description provided for @fileShareLabel.
  ///
  /// In en, this message translates to:
  /// **'Content to share'**
  String get fileShareLabel;

  /// No description provided for @fileShareHint.
  ///
  /// In en, this message translates to:
  /// **'Type something to share...'**
  String get fileShareHint;

  /// No description provided for @fileShareShareButton.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get fileShareShareButton;

  /// No description provided for @fileShareEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Please enter something to share.'**
  String get fileShareEmptyError;

  /// No description provided for @printerTitle.
  ///
  /// In en, this message translates to:
  /// **'Printer'**
  String get printerTitle;

  /// No description provided for @printerPrint.
  ///
  /// In en, this message translates to:
  /// **'Print'**
  String get printerPrint;

  /// No description provided for @printerPreview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get printerPreview;

  /// No description provided for @printerListLabel.
  ///
  /// In en, this message translates to:
  /// **'Available Printers'**
  String get printerListLabel;

  /// No description provided for @printerNoDevices.
  ///
  /// In en, this message translates to:
  /// **'No printers found on this device.'**
  String get printerNoDevices;

  /// No description provided for @printerPrinting.
  ///
  /// In en, this message translates to:
  /// **'Sending to printer...'**
  String get printerPrinting;

  /// No description provided for @printerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Document sent to printer!'**
  String get printerSuccess;

  /// No description provided for @printerError.
  ///
  /// In en, this message translates to:
  /// **'Print error: {message}'**
  String printerError(String message);

  /// No description provided for @htmlTitle.
  ///
  /// In en, this message translates to:
  /// **'HTML Viewer'**
  String get htmlTitle;

  /// No description provided for @htmlSampleHeading.
  ///
  /// In en, this message translates to:
  /// **'Hello from Papyrus!'**
  String get htmlSampleHeading;

  /// No description provided for @htmlSampleParagraph.
  ///
  /// In en, this message translates to:
  /// **'This page is raw HTML rendered inside a secure, policy-driven WebView.'**
  String get htmlSampleParagraph;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
