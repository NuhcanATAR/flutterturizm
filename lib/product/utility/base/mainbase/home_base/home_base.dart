import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/model/main_model/home_model/home_model.dart';
import 'package:flutterturizm/product/model/main_model/home_model/homeadverts_model.dart';
import 'package:flutterturizm/product/router/main_router/home_router/home_router.dart';
import 'package:flutterturizm/product/utility/database/mainviews_db/home_db/home_db.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/utility/service/citydistrict_service/citydistrict_service.dart';

abstract class MainHomeBase<T extends StatefulWidget> extends State<T> {
  // model service
  HomeModelService homeModelService = HomeModelService();

  // router service
  HomeRouterService routerService = HomeRouterService();

  // extension
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();

  @override
  void initState() {
    super.initState();
    getUserInformation();
    getCityDistrictApi();
  }

  // get city distirct api
  Future<void> getCityDistrictApi() async {
    final serviceApi = CityDistrictService(homeModelService.apiUrl);
    try {
      final allCityDistirctsList = await serviceApi.fetchAllCityDistricts();
      setState(() {
        homeModelService.cityDistricts = allCityDistirctsList;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  // get user information
  Future<CurrentUserModel> getUserInformation() async {
    final userRefCollection = await HomeDB.USERS.userRef;
    final userName = userRefCollection['NAME'];
    final userSurname = userRefCollection['SURNAME'];

    return CurrentUserModel(name: userName, surname: userSurname);
  }

  // adverts list response
  final responseAdverts =
      HomeDB.ADVERTS.homeAdvertsList.withConverter<HomeAdvertListModel>(
    fromFirestore: (snapshot, options) {
      final data = snapshot.data();
      return HomeAdvertListModel(
        id: snapshot.id,
        img: data?['IMG'] as String?,
        url: data?['URL'] as String,
        urlActive: data?['URLACTIVE'] as bool?,
        active: data?['ACTIVE'] as bool?,
      );
    },
    toFirestore: (value, options) {
      return value.toJson();
    },
  ).get();
}
