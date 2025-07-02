import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'complaint_history_event.dart';
part 'complaint_history_state.dart';

class ComplaintHistoryBloc
    extends Bloc<ComplaintHistoryEvent, ComplaintHistoryState> {
  ComplaintHistoryBloc() : super(ComplaintHistoryInitial()) {
    on<ComplaintHistoryLoadEvent>(_complaintHistoryLoadEvent);
  }

  Future<void> _complaintHistoryLoadEvent(
    ComplaintHistoryLoadEvent event,
    Emitter<ComplaintHistoryState> emit,
  ) async {
    emit(ComplaintHistoryLoadingState(selectedIndex: event.selectedIndex));
    // Simulate a delay for loading data
    await Future.delayed(Duration(milliseconds: 300), () {
      
    // After loading, emit the data state with "dummy data"
      emit(
        ComplaintHistoryDataState(
          complaints: List.generate(20, (index) => 'Complaint ${index + 1}'),
          selectedIndex: event.selectedIndex,
        ),
      );
    });
  }
}
