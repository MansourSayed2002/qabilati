// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifiModel _$NotifiModelFromJson(Map<String, dynamic> json) => NotifiModel(
  notifiId: (json['notifi_id'] as num?)?.toInt(),
  notifiSender: (json['notifi_sender'] as num?)?.toInt(),
  notifiReceiver: (json['notifi_receiver'] as num?)?.toInt(),
  notifiType: (json['notifi_type'] as num?)?.toInt(),
  notifiTitle: json['notifi_title'] as String?,
  notifiContent: json['notifi_content'] as String?,
);

Map<String, dynamic> _$NotifiModelToJson(NotifiModel instance) =>
    <String, dynamic>{
      'notifi_id': instance.notifiId,
      'notifi_sender': instance.notifiSender,
      'notifi_receiver': instance.notifiReceiver,
      'notifi_type': instance.notifiType,
      'notifi_title': instance.notifiTitle,
      'notifi_content': instance.notifiContent,
    };
