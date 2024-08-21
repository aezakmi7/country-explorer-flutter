import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'country_picker_event.dart';
part 'country_picker_state.dart';

class CountryPickerBloc extends Bloc<CountryPickerEvent, CountryPickerState> {
  CountryPickerBloc() : super(CountryPickerInitial()) {
    on<CountryPickerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
