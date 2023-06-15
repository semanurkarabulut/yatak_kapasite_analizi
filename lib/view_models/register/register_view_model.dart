import 'package:mobx/mobx.dart';
import 'package:yatak_kapasite_analizi/constants/application_constan.dart';
import 'package:yatak_kapasite_analizi/services/services.dart';
part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  @action
  Future<String> register(
      String email, String password, String name, String surname) async {
    dynamic response = await Service.postService({
      "name": name,
      "surname": surname,
      "email": email,
      "password": password
    }, ApplicationConstant.API_URL + ApplicationConstant.REGISTER_URL);
    return response as String;
  }
}
