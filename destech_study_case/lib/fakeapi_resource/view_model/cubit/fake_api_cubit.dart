import 'package:bloc/bloc.dart';
import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/product/service/fakeapi_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'fake_api_state.dart';

class FakeApiCubit extends Cubit<FakeApiState> {
  FakeApiCubit(this.fakeApiService) : super(FakeApiState()){
    fetch(); // give it here or initState
  }
  final IFakeApiService fakeApiService;
  List<Data> books = [];
  List<Data> favBooks = [];
  Data detailedBook  = Data();

  Future<void> fetch() async{
    changeLoading();
    books = (await fakeApiService.fetchBookItem())?.data ?? [];
    emit(state.copyWith(books: books));
    changeLoading();
  }

  void getAll(){
    final seeAll = books;
    emit(state.copyWith(books: seeAll));
  }

  void searchByTitle(String data){
    final result = books.where((element) =>
        (element).title!.contains(data)).toList();
    emit(state.copyWith(books: result));
  }

  // void addToFavorite(index){
  //   final result = favBooks.add(state.books![index] as Data) ;
  //   emit(state.copyWith(favBooks: favBooks.add(state.books![index])));
  // }

  void changeClickedButton(){
    emit(state.copyWith(isClickedSearchButton: !(state.isClickedSearchButton ?? false)));
  }

  void changeLoading(){
    emit(state.copyWith(isLoading: !(state.isLoading ?? false)));
  }


  void changeLikeButton(bool newValue){
    emit(state.copyWith(isLiked: (newValue ?? false)));
  }

}