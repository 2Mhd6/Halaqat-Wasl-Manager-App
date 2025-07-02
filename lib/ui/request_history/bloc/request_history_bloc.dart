import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halaqat_wasl_manager_app/model/request_model/request_model.dart';
import 'package:halaqat_wasl_manager_app/repo/requests/requests_repository.dart';
import 'package:meta/meta.dart';

part 'request_history_event.dart';
part 'request_history_state.dart';

class RequestHistoryBloc
    extends Bloc<RequestHistoryEvent, RequestHistoryState> {

      final RequestsRepository _requestsRepository;

  RequestHistoryBloc({
    required RequestsRepository requestsRepository,
  })  : _requestsRepository = requestsRepository,
        super(RequestHistoryInitial()) {
    on<RequestHistoryLoadEvent>(_requestHistoryLoadEvent);
  }

  Future<void> _requestHistoryLoadEvent(
    RequestHistoryLoadEvent event,
    Emitter<RequestHistoryState> emit,
  ) async {
    emit(RequestHistoryLoadingState(selectedIndex: event.selectedIndex));
    // Simulate a delay for loading data
      
    final response  = await _requestsRepository.fetchRequests();
      // After loading, emit the data state with dummy data
      emit(
        RequestHistoryDataState(
          requests: response,
          selectedIndex: event.selectedIndex,
        ),
      );
   
  }
}
