import 'package:easy_localization/easy_localization.dart';

class FormattedData {
  static String formattedData(DateTime data){
    
    return DateFormat('dd/MM/yyyy\nhh:mm a').format(data.add(Duration(hours: 3)));
    // return '${data.hour}:${data.minute.toString().padLeft(2, '0')}pm ${data.day}-${data.month}-${data.year}';
  }
}