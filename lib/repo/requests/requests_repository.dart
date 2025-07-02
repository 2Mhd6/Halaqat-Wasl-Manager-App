import 'package:halaqat_wasl_manager_app/model/request_model/request_model.dart';
import 'package:halaqat_wasl_manager_app/shared/set_up.dart';

abstract class RequestsRepository {
  /// Fetches the list of requests.
  Future<List<RequestModel>> fetchRequests();

}

class RequestsRepositoryImpl implements RequestsRepository {
  @override
  Future<List<RequestModel>> fetchRequests() async {
    final res =  await SetupSupabase.sharedSupabase.client.from('requests').select('*, hospital(*)');

    
    if (res.isNotEmpty) {
      return res.map((json) => RequestModelMapper.fromMap(json)).toList();
    }
    return [];
  }
}