// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      title: json['title'] as String?,
      author: json['author'] as String?,
      genre: json['genre'] as String?,
      description: json['description'] as String?,
      isbn: json['isbn'] as String?,
      image: json['image'] as String?,
      published: json['published'] as String?,
      publisher: json['publisher'] as String?,
    );
