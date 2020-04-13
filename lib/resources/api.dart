import 'package:project_inovation/core/models/login_model.dart';
import 'package:project_inovation/core/models/tms_model.dart';
import 'package:project_inovation/resources/network.dart';

class API {
  NetworkHelper _networkHelper = NetworkHelper();
  Future loginAPI(PostLoginModel body) async {
    var result = await _networkHelper.postLogin(body);
    return result;
  }
  Future TmsAPI(PostTMSModel body) async{
    var result = await _networkHelper.createTransorder(body);
    return result;
  }
}
