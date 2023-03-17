import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plant_health_backend/models/models.dart';

part 'state.g.dart';

@immutable
@JsonSerializable()
class State extends Equatable {
  final List<Image> images;

  State({required this.images});

  State rebuild({
    List<Image>? images,
  }) {
    return State(
      images: images ?? this.images,
    );
  }

  static State fromJson(Map<String, dynamic> json) => _$StateFromJson(json);

  Map<String, dynamic> toJson() => _$StateToJson(this);

  @override
  List<Object?> get props => [images];
}
