import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yatak_kapasite_analizi/components/app_Bar.dart';
import 'package:yatak_kapasite_analizi/constants/application_constan.dart';
import 'package:yatak_kapasite_analizi/constants/color_constant.dart';
import 'package:yatak_kapasite_analizi/view_models/home/home_view_model.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _viewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => _viewModel.predictions());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(widgetContext: context, isLeading: false),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Yatak Doluluk Oranları",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(18)),
                child: ExpansionTile(
                  title: Text(
                    "Yıllara göre yatak doluluk oranları",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Observer(builder: (_) {
                          return ExpansionTile(
                            title: Text(
                              _viewModel.model!.forecast![index].year!,
                            ),
                            children: <Widget>[
                              ListTile(
                                  title: Text(
                                "Tahmin Edilen: Yatak Sayısı: "
                                "${_viewModel.model!.forecast![index].value!}\nİhtiyaç Duyulan Yatak Sayısı: ${_viewModel.getActualValues()[index]}",
                              ))
                            ],
                          );
                        });
                      },
                    )
                  ],
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 1,
            child: Stack(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.network(
                      ApplicationConstant.API_URL_PREDICT +
                          ApplicationConstant.VISUALIZE2,
                      headers: const {"Connection": "Keep-Alive"},
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
