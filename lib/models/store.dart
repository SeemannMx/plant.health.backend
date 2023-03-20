import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:plant_health_backend/models/models.dart';

part 'store.g.dart';

@immutable
@JsonSerializable()
class Store extends Equatable {
  final String? environment;
  final List<Image>? images;

  Store({this.environment, this.images}) {
    print('build store');
  }

  Store rebuild({
    final String? environment,
    List<Image>? images,
  }) {
    return Store(
      environment: environment ?? this.environment,
      images: images ?? this.images,
    );
  }

  static Store fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

  Map<String, dynamic> toJson() => _$StoreToJson(this);

  @override
  List<Object?> get props => [environment, images];
}
