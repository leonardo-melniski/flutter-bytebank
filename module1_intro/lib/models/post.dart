import 'package:json_annotation/json_annotation.dart';

// execute on terminal:
// flutter pub run build_runner build
// to generate 'post.g.dart'
part 'post.g.dart';

//@JsonSerializable(nullable: false)

@JsonSerializable(explicitToJson: true)
class Post {
  final int id;
  @JsonKey(name: 'userId')
  final int usuarioId;
  @JsonKey(name: 'title')
  final String titulo;
  @JsonKey(name: 'body')
  final String corpo;

  Post(this.id, this.usuarioId, this.titulo, this.corpo);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);

}


