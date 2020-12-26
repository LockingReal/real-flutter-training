import 'package:json_annotation/json_annotation.dart';

part 'lesson.g.dart';


@JsonSerializable()
class Lesson extends Object {

  @JsonKey(name: 'lesson_name')
  String lessonName;

  @JsonKey(name: 'lesson_img')
  String lessonImg;

  Lesson(this.lessonName,this.lessonImg,);

  factory Lesson.fromJson(Map<String, dynamic> srcJson) => _$LessonFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LessonToJson(this);

}


