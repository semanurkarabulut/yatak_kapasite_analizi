import 'package:mobx/mobx.dart';
import 'package:yatak_kapasite_analizi/constants/application_constan.dart';
import 'package:yatak_kapasite_analizi/models/forecast_model.dart';
import 'package:yatak_kapasite_analizi/services/services.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  ForecastModel? model;

  @action
  Future<ForecastModel?> predictions() async {
    try {
      dynamic response = await Service.getService(
          ApplicationConstant.API_URL_PREDICT + ApplicationConstant.PREDICT,
          null);
      model = ForecastModel.fromJson(response);
      return model!;
    } catch (e) {
      return null;
    }
  }

  @action
  Map<int, double> getActualValues() {
    Map<int, double> map = {0: 3.543575, 1: 2.753864, 2: 4.546737, 3: 2.965684};
    return map;
  }
}
