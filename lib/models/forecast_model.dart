class ForecastModel {
  List<Forecast>? forecast;

  ForecastModel({this.forecast});

  ForecastModel.fromJson(Map<String, dynamic> json) {
    if (json['forecast'] != null) {
      forecast = <Forecast>[];
      json['forecast'].forEach((v) {
        forecast!.add(new Forecast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.forecast != null) {
      data['forecast'] = this.forecast!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Forecast {
  String? value;
  String? year;

  Forecast({this.value, this.year});

  Forecast.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['year'] = this.year;
    return data;
  }
}
