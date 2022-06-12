import 'package:bloc/bloc.dart';
import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/product/service/fakeapi_service.dart';
import 'package:equatable/equatable.dart';

part 'fake_api_state.dart';

class FakeApiCubit extends Cubit<FakeApiState> {
  FakeApiCubit(this.fakeApiService) : super(FakeApiState()){
    fetch(); // give it here or initState
  }
  final IFakeApiService fakeApiService;
  List<Data> books = [];
  List<Data> favBooks = [];

  Future<void> fetch() async{
    changeLoading();
    books = (await fakeApiService.fetchBookItem())?.data ?? [];
    emit(state.copyWith(books: books));
    changeLoading();
  }

  void searchByTitle(String data){
    final result = books.where((element) =>
        (element).title!.contains(data)).toList();
    emit(state.copyWith(books: result));
  }

  void changeLoading(){
    emit(state.copyWith(isLoading: !(state.isLoading ?? false) ));
  }


  void clickIsTapped(){
    emit(state.copyWith(isTapped: true ));
  }

  void changeLikeButton(bool newValue){
    emit(state.copyWith(isLiked: (newValue ?? false) ));
  }

  void changeIsClickedToFavList(){
    emit(state.copyWith(isClickedToFavList: !(state.isClickedToFavList ?? false) ));
  }

}