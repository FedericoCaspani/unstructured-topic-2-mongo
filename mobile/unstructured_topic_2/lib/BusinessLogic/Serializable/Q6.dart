import 'package:json_annotation/json_annotation.dart';

part 'Q6.g.dart';

@JsonSerializable()
class GreenPass {
  final int id;
  final String date;

  GreenPass({
    required this.id,
    required this.date
  });

  factory GreenPass.fromJson(Map<String, dynamic> json) => _$GreenPassFromJson(json);
  Map<String, dynamic> toJson() => _$GreenPassToJson(this);

}

