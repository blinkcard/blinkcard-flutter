// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blinkcard_overlays.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkCardOverlaySettings _$BlinkCardOverlaySettingsFromJson(
    Map<String, dynamic> json) {
  return BlinkCardOverlaySettings()
    ..overlaySettingsType = json['overlaySettingsType'] as String?
    ..useFrontCamera = json['useFrontCamera'] as bool
    ..enableBeep = json['enableBeep'] as bool
    ..language = json['language'] as String?
    ..country = json['country'] as String?
    ..firstSideInstructions = json['firstSideInstructions'] as String?
    ..flipCardInstructions = json['flipCardInstructions'] as String?
    ..showFlashlightWarning = json['showFlashlightWarning'] as bool;
}

Map<String, dynamic> _$BlinkCardOverlaySettingsToJson(
        BlinkCardOverlaySettings instance) =>
    <String, dynamic>{
      'overlaySettingsType': instance.overlaySettingsType,
      'useFrontCamera': instance.useFrontCamera,
      'enableBeep': instance.enableBeep,
      'language': instance.language,
      'country': instance.country,
      'firstSideInstructions': instance.firstSideInstructions,
      'flipCardInstructions': instance.flipCardInstructions,
      'showFlashlightWarning': instance.showFlashlightWarning,
    };
