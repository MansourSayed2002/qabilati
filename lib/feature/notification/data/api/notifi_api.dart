import 'package:qabilati/core/class/supabase_connect.dart';

class NotifiApi {
  static selectEq(String table, String column, int value) async {
    var response = await SupabaseConnect.supabase
        .from(table)
        .select()
        .eq(column, value);
    return response;
  }
}
