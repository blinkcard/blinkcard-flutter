import '../overlay_settings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blinkcard_overlays.g.dart';

/// Class for setting up BlinkCard overlay.
/// BlinkCard overlay is best suited for scanning payment cards.
@JsonSerializable()
class BlinkCardOverlaySettings extends OverlaySettings {
  /// String: user instructions that are shown above camera preview while the first side of the
  /// document is being scanned.
  /// If null, default value will be used.
  String? firstSideInstructions;

  /// String: user instructions that are shown above camera preview while the second side of the
  /// document is being scanned.
  /// If null, default value will be used.
  String? flipCardInstructions;

  /// Defines whether glare warning will be displayed when user turn on a flashlight
  /// Default true
  bool showFlashlightWarning = true;

  ///String: Instructions for the user to move the document closer
  ///
  /// If null, default value will be used.
  String? errorMoveCloser;

  ///String: Instructions for the user to move the document farther
  ///
  ///If null, default value will be used.
  String? errorMoveFarther;

  ///String: Instructions for the user to move the document from the edge
  ///
  ///If null, default value will be used.
  String? errorCardTooCloseToEdge;

  /// String: Instructions for the user when wrong side is being scanned.
  ///
  ///  If null, default value will be used.
  String? scanningWrongSideMessage;

  /// String: Instructions for the user when too much tilt is detected.
  ///
  /// If null, default value will be used.
  String? keepCardParallelMessage;

  ///Defines whether button for presenting onboarding screens will be present on screen
  ///
  ///Default: true
  bool showOnboardingInfo = true;

  ///Defines whether button for presenting onboarding screens will be present on screen
  ///
  ///Default: true
  bool showIntroductionDialog = true;

  ///Option to configure when the onboarding help tooltip will appear.
  ///
  ///Default: 8000
  int onboardingButtonTooltipDelay = 8000;

  ///Language of the UI.
  ///If default overlay contains textual information, text will be localized to this language. Otherwise device langauge will be used
  ///example: "en"
  String? language;

  ///Used with language variable, it defines the country locale
  ///
  ///example: "US" to use "en_US" on Android and en-US on iOS
  String? country;

  BlinkCardOverlaySettings() : super('BlinkCardOverlaySettings');

  factory BlinkCardOverlaySettings.fromJson(Map<String, dynamic> json) =>
      _$BlinkCardOverlaySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$BlinkCardOverlaySettingsToJson(this);
}
