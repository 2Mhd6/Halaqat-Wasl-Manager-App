import 'package:halaqat_wasl_manager_app/model/complaint_model/complaint_model.dart';
import 'package:halaqat_wasl_manager_app/shared/set_up.dart';

abstract class ComplaintsRepository {
  /// Fetches the list of complaints.
  Future<List<ComplaintModel>> fetchComplaints();

}

class ComplaintsRepositoryImpl implements ComplaintsRepository {
  @override
  Future<List<ComplaintModel>> fetchComplaints() async {
   
    final res =  await SetupSupabase.sharedSupabase.client.from('complaint').select('*');

   
    if (res.isNotEmpty) {
      return res.map((json) => ComplaintModelMapper.fromMap(json)).toList();
    }
    return [];
  }
}