// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technology.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Technology _$TechnologyFromJson(Map<String, dynamic> json) => Technology(
      name: json['name'] as String,
      type: $enumDecodeNullable(_$TechnologyTypeEnumMap, json['type']) ??
          TechnologyType.any,
    );

Map<String, dynamic> _$TechnologyToJson(Technology instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$TechnologyTypeEnumMap[instance.type]!,
    };

const _$TechnologyTypeEnumMap = {
  TechnologyType.fullStack: 'fullStack',
  TechnologyType.frontEnd: 'frontEnd',
  TechnologyType.backEnd: 'backEnd',
  TechnologyType.mobile: 'mobile',
  TechnologyType.ai: 'ai',
  TechnologyType.imageProcessing: 'imageProcessing',
  TechnologyType.any: 'any',
};
