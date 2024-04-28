import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/profile_mixin/profilebloc_mixin.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/model/main_model/profile_model/profile_model.dart';
import 'package:flutterturizm/product/router/main_router/profile_router/profile_router.dart';
import 'package:flutterturizm/product/utility/database/mainviews_db/home_db/home_db.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/utility/service/citydistrict_service/citydistrict_service.dart';

abstract class ProfileBase<T extends StatefulWidget> extends State<T>
    with ProfileBlocMixin {
  // router service
  ProfileRouterService routerService = ProfileRouterService();

  // model service
  ProfileModelService modelService = ProfileModelService();

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
    final serviceApi = CityDistrictService(modelService.apiUrl);
    try {
      final allCityDistirctsList = await serviceApi.fetchAllCityDistricts();
      setState(() {
        modelService.cityDistricts = allCityDistirctsList;
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
      identificationId: identificationId,
      dateOfBirthDay: dateOfBirthDay,
      dateOfBirthMonth: dateOfBirthMonth,
      dateOfBirthYear: dateOfBirthYear,
      accountType: accountType,
      phoneNumber: phoneNumber,
    );
  }
}
