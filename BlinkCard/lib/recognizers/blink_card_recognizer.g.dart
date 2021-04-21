// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blink_card_recognizer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlinkCardRecognizer _$BlinkCardRecognizerFromJson(Map<String, dynamic> json) {
  return BlinkCardRecognizer()
    ..recognizerType = json['recognizerType'] as String
    ..allowBlurFilter = json['allowBlurFilter'] as bool
    ..anonymizationSettings = json['anonymizationSettings'] == null
        ? null
        : BlinkCardAnonymizationSettings.fromJson(
            json['anonymizationSettings'] as Map<String, dynamic>)
    ..extractCvv = json['extractCvv'] as bool
    ..extractExpiryDate = json['extractExpiryDate'] as bool
    ..extractIban = json['extractIban'] as bool
    ..extractOwner = json['extractOwner'] as bool
    ..fullDocumentImageDpi = json['fullDocumentImageDpi'] as int
    ..fullDocumentImageExtensionFactors =
        json['fullDocumentImageExtensionFactors'] == null
            ? null
            : ImageExtensionFactors.fromJson(
                json['fullDocumentImageExtensionFactors']
                    as Map<String, dynamic>)
    ..paddingEdge = (json['paddingEdge'] as num)?.toDouble()
    ..returnFullDocumentImage = json['returnFullDocumentImage'] as bool
    ..signResult = json['signResult'] as bool;
}

Map<String, dynamic> _$BlinkCardRecognizerToJson(
        BlinkCardRecognizer instance) =>
    <String, dynamic>{
      'recognizerType': instance.recognizerType,
      'allowBlurFilter': instance.allowBlurFilter,
      'anonymizationSettings': instance.anonymizationSettings,
      'extractCvv': instance.extractCvv,
      'extractExpiryDate': instance.extractExpiryDate,
      'extractIban': instance.extractIban,
      'extractOwner': instance.extractOwner,
      'fullDocumentImageDpi': instance.fullDocumentImageDpi,
      'fullDocumentImageExtensionFactors':
          instance.fullDocumentImageExtensionFactors,
      'paddingEdge': instance.paddingEdge,
      'returnFullDocumentImage': instance.returnFullDocumentImage,
      'signResult': instance.signResult,
    };
