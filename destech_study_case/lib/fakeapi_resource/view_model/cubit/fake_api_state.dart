part of 'fake_api_cubit.dart';

class FakeApiState extends Equatable {
  FakeApiState({this.books,this.isUpdated = false,this.isLoading,this.favBooks,this.isLiked,this.isClickedToFavList,this.isTapped});
  final List<Data>? books;
  final List<Data>? favBooks;
  final bool? isLiked;
  final bool? isTapped;
  final bool? isLoading;
  final bool? isClickedToFavList;
  final bool isUpdated; // its for equatable solving in lists

  @override
  List<Object?> get props => [books,isLoading,favBooks,isLiked,isClickedToFavList,isTapped,isUpdated]; // don't trigger the page unless these values change


  //copyWith to update
  FakeApiState copyWith({
    List<Data>? books,
    List<Data>? favBooks,
    bool? isLoading,
    bool? isLiked,
    bool? isTapped,
    bool? isClickedToFavList,
    bool? isUpdated
  }){
    return FakeApiState(
      books :books ?? this.books,
      favBooks: favBooks ?? this.favBooks,
      isLoading : isLoading ?? this.isLoading,
      isLiked: isLiked ?? false,
      isClickedToFavList: isClickedToFavList ?? false,
      isTapped: isTapped ?? false,
      isUpdated: isUpdated ?? this.isUpdated
    );
  }
}

