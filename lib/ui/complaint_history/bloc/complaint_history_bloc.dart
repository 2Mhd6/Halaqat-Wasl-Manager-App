import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaqat_wasl_manager_app/model/complaint_model/complaint_model.dart';
import 'package:halaqat_wasl_manager_app/repo/complaints/complaints_repository.dart';
import 'package:meta/meta.dart';

part 'complaint_history_event.dart';
part 'complaint_history_state.dart';

class ComplaintHistoryBloc
    extends Bloc<ComplaintHistoryEvent, ComplaintHistoryState> {
  final ComplaintsRepository _complaintsRepository;

  ComplaintHistoryBloc({required ComplaintsRepository complaintsRepository})
    : _complaintsRepository = complaintsRepository,
      super(ComplaintHistoryInitial()) {
    on<ComplaintHistoryLoadEvent>(_complaintHistoryLoadEvent);
  }

  Future<void> _complaintHistoryLoadEvent(
    ComplaintHistoryLoadEvent event,
    Emitter<ComplaintHistoryState> emit,
  ) async {
    emit(ComplaintHistoryLoadingState(selectedIndex: event.selectedIndex));
   
   final complaints = await _complaintsRepository.fetchComplaints();
   print('Fetched complaints: $complaints');

    // Emit the data state with the fetched complaints
  emit(
        ComplaintHistoryDataState(
          complaints: complaints,
          selectedIndex: event.selectedIndex,
        ),
      ); }
}
