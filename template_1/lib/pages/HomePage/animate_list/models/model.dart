import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'model.freezed.dart';

@freezed
class DetailsModel with _$DetailsModel {
  const factory DetailsModel(
      {required String? userId,
      required String? username,
      required List? imgArr,
      required String? avatar,
      required String? saying,
      required String? details,
      required String? summary,
      required String? context,
      required String? date,
      required List? comments}) = _DetailsModel;
}
