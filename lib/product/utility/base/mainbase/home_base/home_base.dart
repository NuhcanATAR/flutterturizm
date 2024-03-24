// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/model/main_model/home_model/home_model.dart';
import 'package:flutterturizm/product/model/main_model/home_model/homeadverts_model.dart';
import 'package:flutterturizm/product/utility/database/mainviews_db/home_db/home_db.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/utility/exception/firebase_exception/firebase_exception.dart';
import 'package:flutterturizm/product/utility/service/citydistrict_service/citydistrict_service.dart';

abstract class MainHomeBase<T extends StatefulWidget> extends State<T> {
  // model service
  HomeModelService homeModelService = HomeModelService();

  // extension
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();

  @override
  void initState() {
    super.initState();
    getUserInformation();
    getCityDistrictApi();
  }

  // get city distirct api
  void getCityDistrictApi() async {
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

  // ticket date
  Future<void> selectTicketDate(BuildContext context) async {
    DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      onConfirm: (date) {
        DateTime selectedDateTime = DateTime(
          date.year,
          date.month,
          date.day,
        );

        setState(() {
          homeModelService.ticketDate = selectedDateTime;
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.tr,
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
      if (value == null) {
        throw FirebaseCloudFirestoreException('$value no null');
      } else {}
      return value.toJson();
    },
  ).get();
}
