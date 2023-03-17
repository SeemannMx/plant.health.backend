// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
      environment: json['environment'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
      'environment': instance.environment,
      'images': instance.images,
    };
