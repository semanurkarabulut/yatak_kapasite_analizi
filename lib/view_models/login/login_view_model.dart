import 'package:mobx/mobx.dart';
import 'package:yatak_kapasite_analizi/constants/application_constan.dart';
import 'package:yatak_kapasite_analizi/models/login_response_model.dart';
import 'package:yatak_kapasite_analizi/services/services.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  @observable
  String? token;

  @action
  Future<dynamic> login(String email, String password) async {
    Map<String, dynamic> mapToPost = {"email": email, "password": password};
    dynamic response = await Service.postService(
        mapToPost, ApplicationConstant.API_URL + ApplicationConstant.LOGIN_URL);
    return response.map((x) => LoginResponseModel.fromJson(x));
  }
}
