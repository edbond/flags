import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer.freezed.dart';

@freezed
class Answer with _$Answer {
  const factory Answer({
    required String countryName,
    required DateTime start,
    required DateTime finish,
  }) = _Answer;
}
