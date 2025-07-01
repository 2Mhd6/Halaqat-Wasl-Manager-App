import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'request_history_event.dart';
part 'request_history_state.dart';

class RequestHistoryBloc extends Bloc<RequestHistoryEvent, RequestHistoryState> {
  RequestHistoryBloc() : super(RequestHistoryInitial()) {
    on<RequestHistoryLoadEvent>(_requestHistoryLoadEvent);

  }

  Future<void> _requestHistoryLoadEvent(
      RequestHistoryLoadEvent event,
      Emitter<RequestHistoryState> emit,
  )async {
    emit(RequestHistoryLoadingState(selectedIndex: event.selectedIndex));
    // Simulate a delay for loading data
   await Future.delayed(Duration(milliseconds: 300), () {
      // After loading, emit the data state with dummy data
      emit(RequestHistoryDataState(
        requests: List.generate(20, (index) => 'Request ${index + 1}'),
        selectedIndex: event.selectedIndex,
      ));
    });
  }

}
