part of 'fake_api_cubit.dart';

class FakeApiState extends Equatable {
  FakeApiState({this.books,this.isUpdated = false,this.isLoading,this.favBooks,this.isLiked});
  final List<Data>? books;
  final List<Data>? favBooks;
  final bool? isLiked;
  final bool? isLoading;
  final bool isUpdated; // its for equatable solving in lists


  @override
  List<Object?> get props => [books,isLoading,favBooks,isLiked,isUpdated]; // don't trigger the page unless these values change


  //copyWith to update
  FakeApiState copyWith({
    List<Data>? books,
    List<Data>? favBooks,
    bool? isLoading,
    bool? isLiked,
    bool? isUpdated,
  }){
    return FakeApiState(
      books :books ?? this.books,
      favBooks: favBooks ?? this.favBooks,
      isLoading : isLoading ?? this.isLoading,
      isLiked: isLiked ?? false,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }
}

