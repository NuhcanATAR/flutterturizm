import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/model/connection_model/connection_model.dart';
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
    ConnectionControlModel().checkConnection(context);
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
    final city = userRefCollection['CITY'];
    final district = userRefCollection['DISTRICT'];
    final identificationId = userRefCollection['IDENTIFICATIONNUMBER'];
    final dateOfBirthDay = userRefCollection['DATEOFBIRTHDAY'];
    final dateOfBirthMonth = userRefCollection['DATEOFBIRTHMONTH'];
    final dateOfBirthYear = userRefCollection['DATEOFBIRTHYEAR'];
    final accountType = userRefCollection['AUTHTYPE'];
    final phoneNumber = userRefCollection['PHONENUMBER'];

    return CurrentUserModel(
      city: city,
      district: district,
      name: userName,
      surname: userSurname,
      accountType: accountType,
      identificationId: identificationId,
      dateOfBirthDay: dateOfBirthDay,
      dateOfBirthMonth: dateOfBirthMonth,
      dateOfBirthYear: dateOfBirthYear,
      phoneNumber: phoneNumber,
    );
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
