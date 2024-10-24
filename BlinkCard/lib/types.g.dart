// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardNumberAnonymizationSettings _$CardNumberAnonymizationSettingsFromJson(
        Map<String, dynamic> json) =>
    CardNumberAnonymizationSettings()
      ..mode = $enumDecode(_$BlinkCardAnonymizationModeEnumMap, json['mode'])
      ..prefixDigitsVisible = (json['prefixDigitsVisible'] as num).toInt()
      ..suffixDigitsVisible = (json['suffixDigitsVisible'] as num).toInt();

Map<String, dynamic> _$CardNumberAnonymizationSettingsToJson(
        CardNumberAnonymizationSettings instance) =>
    <String, dynamic>{
      'mode': _$BlinkCardAnonymizationModeEnumMap[instance.mode]!,
      'prefixDigitsVisible': instance.prefixDigitsVisible,
      'suffixDigitsVisible': instance.suffixDigitsVisible,
    };

const _$BlinkCardAnonymizationModeEnumMap = {
  BlinkCardAnonymizationMode.None: 0,
  BlinkCardAnonymizationMode.ImageOnly: 1,
  BlinkCardAnonymizationMode.FieldsOnly: 2,
  BlinkCardAnonymizationMode.FullResult: 3,
};

BlinkCardAnonymizationSettings _$BlinkCardAnonymizationSettingsFromJson(
        Map<String, dynamic> json) =>
    BlinkCardAnonymizationSettings()
      ..cardNumberAnonymizationSettings =
          json['cardNumberAnonymizationSettings'] == null
              ? null
              : CardNumberAnonymizationSettings.fromJson(
                  json['cardNumberAnonymizationSettings']
                      as Map<String, dynamic>)
      ..cardNumberPrefixAnonymizationMode = $enumDecode(
          _$BlinkCardAnonymizationModeEnumMap,
          json['cardNumberPrefixAnonymizationMode'])
      ..cvvAnonymizationMode = $enumDecode(
          _$BlinkCardAnonymizationModeEnumMap, json['cvvAnonymizationMode'])
      ..ibanAnonymizationMode = $enumDecode(
          _$BlinkCardAnonymizationModeEnumMap, json['ibanAnonymizationMode'])
      ..ownerAnonymizationMode = $enumDecode(
          _$BlinkCardAnonymizationModeEnumMap, json['ownerAnonymizationMode']);

Map<String, dynamic> _$BlinkCardAnonymizationSettingsToJson(
        BlinkCardAnonymizationSettings instance) =>
    <String, dynamic>{
      'cardNumberAnonymizationSettings':
          instance.cardNumberAnonymizationSettings,
      'cardNumberPrefixAnonymizationMode': _$BlinkCardAnonymizationModeEnumMap[
          instance.cardNumberPrefixAnonymizationMode]!,
      'cvvAnonymizationMode':
          _$BlinkCardAnonymizationModeEnumMap[instance.cvvAnonymizationMode]!,
      'ibanAnonymizationMode':
          _$BlinkCardAnonymizationModeEnumMap[instance.ibanAnonymizationMode]!,
      'ownerAnonymizationMode':
          _$BlinkCardAnonymizationModeEnumMap[instance.ownerAnonymizationMode]!,
    };

ImageExtensionFactors _$ImageExtensionFactorsFromJson(
        Map<String, dynamic> json) =>
    ImageExtensionFactors()
      ..upFactor = (json['upFactor'] as num?)?.toDouble()
      ..rightFactor = (json['rightFactor'] as num?)?.toDouble()
      ..downFactor = (json['downFactor'] as num?)?.toDouble()
      ..leftFactor = (json['leftFactor'] as num?)?.toDouble();

Map<String, dynamic> _$ImageExtensionFactorsToJson(
        ImageExtensionFactors instance) =>
    <String, dynamic>{
      'upFactor': instance.upFactor,
      'rightFactor': instance.rightFactor,
      'downFactor': instance.downFactor,
      'leftFactor': instance.leftFactor,
    };
