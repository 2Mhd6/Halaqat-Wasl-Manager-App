import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'complaint_event.dart';
part 'complaint_state.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {

  int selectedIndex = 0;
  List<int> complaints = [];

  ComplaintBloc() : super(ComplaintInitial()) {
    on<ComplaintEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChangeDateRangeEvent>(changeDateRangeEvent);
    on<GettingDataBasedOnDate>(gettingDateBasedOnDate);
  }

  FutureOr<void> changeDateRangeEvent(ChangeDateRangeEvent event, Emitter<ComplaintState> emit){

    emit(LoadingState());
    selectedIndex = event.selectedIndex;
    emit(SuccessState());

  }

  FutureOr<void> gettingDateBasedOnDate(GettingDataBasedOnDate event, Emitter<ComplaintState> emit) async {
    
    emit(LoadingState());

    await Future.delayed(Duration(milliseconds: 700));

    switch (selectedIndex) {
      case 0:
        complaints = List.generate(7, (index) => index);

      case 1:
        complaints = List.generate(14, (index) => index);

      case 2:
        complaints = List.generate(30, (index) => index);

      case 3:
        complaints = List.generate(60, (index) => index);

      case 4:
        complaints = List.generate(90, (index) => index);
    }

    emit(SuccessState());
  }
}
