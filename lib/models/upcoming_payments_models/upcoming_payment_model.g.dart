// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingPaymentModel _$UpcomingPaymentModelFromJson(
        Map<String, dynamic> json) =>
    UpcomingPaymentModel(
      id: (json['id'] as num?)?.toInt(),
      orderId: (json['order_id'] as num?)?.toInt(),
      paidAmount: json['paid_amount'] as String?,
      remainingAmount: json['remaining_amount'] as String?,
      dueDate: json['due_date'] as String?,
    );

Map<String, dynamic> _$UpcomingPaymentModelToJson(
        UpcomingPaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'paid_amount': instance.paidAmount,
      'remaining_amount': instance.remainingAmount,
      'due_date': instance.dueDate,
    };
