import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'fake_api_state.dart';

class FakeApiCubit extends Cubit<FakeApiState> {
  FakeApiCubit() : super(FakeApiInitial());
}
