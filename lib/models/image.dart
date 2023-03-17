import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'image.g.dart';

@immutable
@JsonSerializable()
class Image extends Equatable {
  final String id;

  Image({required this.id});

  Image copyWith({
    String? id,
  }) {
    return Image(
      id: id ?? this.id,
    );
  }

  static Image fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);

  @override
  List<Object?> get props => [id];
}
