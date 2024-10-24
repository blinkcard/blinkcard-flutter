// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blinkcard_overlays.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkCardOverlaySettings _$BlinkCardOverlaySettingsFromJson(
        Map<String, dynamic> json) =>
    BlinkCardOverlaySettings()
      ..overlaySettingsType = json['overlaySettingsType'] as String?
      ..useFrontCamera = json['useFrontCamera'] as bool
      ..enableBeep = json['enableBeep'] as bool
      ..firstSideInstructions = json['firstSideInstructions'] as String?
      ..flipCardInstructions = json['flipCardInstructions'] as String?
      ..showFlashlightWarning = json['showFlashlightWarning'] as bool
      ..errorMoveCloser = json['errorMoveCloser'] as String?
      ..errorMoveFarther = json['errorMoveFarther'] as String?
      ..errorCardTooCloseToEdge = json['errorCardTooCloseToEdge'] as String?
      ..showOnboardingInfo = json['showOnboardingInfo'] as bool
      ..showIntroductionDialog = json['showIntroductionDialog'] as bool
      ..onboardingButtonTooltipDelay =
          (json['onboardingButtonTooltipDelay'] as num).toInt()
      ..language = json['language'] as String?
      ..country = json['country'] as String?;

Map<String, dynamic> _$BlinkCardOverlaySettingsToJson(
        BlinkCardOverlaySettings instance) =>
    <String, dynamic>{
      'overlaySettingsType': instance.overlaySettingsType,
      'useFrontCamera': instance.useFrontCamera,
      'enableBeep': instance.enableBeep,
      'firstSideInstructions': instance.firstSideInstructions,
      'flipCardInstructions': instance.flipCardInstructions,
      'showFlashlightWarning': instance.showFlashlightWarning,
      'errorMoveCloser': instance.errorMoveCloser,
      'errorMoveFarther': instance.errorMoveFarther,
      'errorCardTooCloseToEdge': instance.errorCardTooCloseToEdge,
      'showOnboardingInfo': instance.showOnboardingInfo,
      'showIntroductionDialog': instance.showIntroductionDialog,
      'onboardingButtonTooltipDelay': instance.onboardingButtonTooltipDelay,
      'language': instance.language,
      'country': instance.country,
    };
