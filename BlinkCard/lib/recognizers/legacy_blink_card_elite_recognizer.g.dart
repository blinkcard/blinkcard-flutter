// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legacy_blink_card_elite_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegacyBlinkCardEliteRecognizer _$LegacyBlinkCardEliteRecognizerFromJson(
    Map<String, dynamic> json) {
  return LegacyBlinkCardEliteRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..anonymizeCardNumber = json['anonymizeCardNumber'] as bool
    ..anonymizeCvv = json['anonymizeCvv'] as bool
    ..anonymizeOwner = json['anonymizeOwner'] as bool
    ..detectGlare = json['detectGlare'] as bool
    ..extractInventoryNumber = json['extractInventoryNumber'] as bool
    ..extractOwner = json['extractOwner'] as bool
    ..extractValidThru = json['extractValidThru'] as bool
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
        json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool;
}

Map<String, dynamic> _$LegacyBlinkCardEliteRecognizerToJson(
        LegacyBlinkCardEliteRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'anonymizeCardNumber': instance.anonymizeCardNumber,
      'anonymizeCvv': instance.anonymizeCvv,
      'anonymizeOwner': instance.anonymizeOwner,
      'detectGlare': instance.detectGlare,
      'extractInventoryNumber': instance.extractInventoryNumber,
      'extractOwner': instance.extractOwner,
      'extractValidThru': instance.extractValidThru,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
    };
