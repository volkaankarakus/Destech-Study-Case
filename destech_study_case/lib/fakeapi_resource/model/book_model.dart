import 'package:json_annotation/json_annotation.dart';
part 'book_model.g.dart';


//flutter pub run build_runner build
@JsonSerializable(createToJson: false) // no need for ToJson as a request is not thrown from model to service
class BookModel {
  List<Data>? data;

  BookModel({this.data});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return _$BookModelFromJson(json);
  }

  Map<String,dynamic>? toJson(){
    return null;
  }
}

@JsonSerializable(createToJson: false)
class Data {
  final int? id; // final for just read and show,these are not updatable variables
  final String? title;
  final String? author;
  final String? genre;
  final String? description;
  final String? isbn;
  final String? image;
  final String? published;
  final String? publisher;

  Data(
      {this.id,
        this.title,
        this.author,
        this.genre,
        this.description,
        this.isbn,
        this.image,
        this.published,
        this.publisher});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }
}