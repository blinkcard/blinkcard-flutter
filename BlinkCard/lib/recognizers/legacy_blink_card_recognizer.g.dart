// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legacy_blink_card_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LegacyBlinkCardRecognizer _$LegacyBlinkCardRecognizerFromJson(
    Map<String, dynamic> json) {
  return LegacyBlinkCardRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..anonymizeCardNumber = json['anonymizeCardNumber'] as bool
    ..anonymizeCvv = json['anonymizeCvv'] as bool
    ..anonymizeIban = json['anonymizeIban'] as bool
    ..anonymizeOwner = json['anonymizeOwner'] as bool
    ..detectGlare = json['detectGlare'] as bool
    ..extractCvv = json['extractCvv'] as bool
    ..extractIban = json['extractIban'] as bool
    ..extractInventoryNumber = json['extractInventoryNumber'] as bool
    ..extractOwner = json['extractOwner'] as bool
    ..extractValidThru = json['extractValidThru'] as bool
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..fullDocumentImageExtensionFactors = ImageExtensionFactors.fromJson(
        json['fullDocumentImageExtensionFactors'] as Map<String, dynamic>)
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
    ..signResult = json['signResult'] as bool;
}

Map<String, dynamic> _$LegacyBlinkCardRecognizerToJson(
        LegacyBlinkCardRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'anonymizeCardNumber': instance.anonymizeCardNumber,
      'anonymizeCvv': instance.anonymizeCvv,
      'anonymizeIban': instance.anonymizeIban,
      'anonymizeOwner': instance.anonymizeOwner,
      'detectGlare': instance.detectGlare,
      'extractCvv': instance.extractCvv,
      'extractIban': instance.extractIban,
      'extractInventoryNumber': instance.extractInventoryNumber,
      'extractOwner': instance.extractOwner,
      'extractValidThru': instance.extractValidThru,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
      'signResult': instance.signResult,
    };
