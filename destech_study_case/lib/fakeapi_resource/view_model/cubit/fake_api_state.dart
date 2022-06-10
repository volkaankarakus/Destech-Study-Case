part of 'fake_api_cubit.dart';

class FakeApiState extends Equatable {
  FakeApiState({this.books,this.isLoading,this.favBooks,this.isLiked,this.isClickedToFavList});
  final List<Data>? books;
  final List<Data>? favBooks;
  final bool? isLiked;
  final bool? isLoading;
  final bool? isClickedToFavList;

  @override
  List<Object?> get props => [books,isLoading,favBooks,isLiked,isClickedToFavList]; // don't trigger the page unless these values change


  //copyWith to update
  FakeApiState copyWith({
    List<Data>? books,
    List<Data>? favBooks,
    bool? isLoading,
    bool? isLiked,
    bool? isClickedToFavList
  }){
    return FakeApiState(
      books :books ?? this.books,
      favBooks: favBooks ?? this.favBooks,
      isLoading : isLoading ?? this.isLoading,
      isLiked: isLiked ?? false,
      isClickedToFavList: isClickedToFavList ?? this.isClickedToFavList,
    );
  }
}

