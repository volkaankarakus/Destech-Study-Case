part of 'fake_api_cubit.dart';

@immutable
class FakeApiState extends Equatable {
  FakeApiState({this.books,this.isLoading});
  final List<Data>? books;
  final bool? isLoading;

  @override
  List<Object?> get props => [books,isLoading];

  //copyWith to update
  FakeApiState copyWith({
    List<Data>? books,
    bool? isLoading,
  }){
    return FakeApiState(
      books :books ?? this.books,
      isLoading : isLoading ?? this.isLoading
    );
  }
}

