import 'package:bloc/bloc.dart';
import 'package:destech_study_case/fakeapi_resource/model/book_model.dart';
import 'package:destech_study_case/product/service/fakeapi_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'fake_api_state.dart';

class FakeApiCubit extends Cubit<FakeApiState> {
  FakeApiCubit(this.fakeApiService) : super(FakeApiState()){
    fetch(); // give it here or initState
  }
  final IFakeApiService fakeApiService;
  List<Data> books = [];

  Future<void> fetch() async{
    changeLoading();
    books = (await fakeApiService.fetchBookItem())?.data ?? [];
    emit(state.copyWith(books: books));
    changeLoading();
  }

  void changeLoading(){
    emit(state.copyWith(isLoading: !(state.isLoading ?? false) ));
  }
}
