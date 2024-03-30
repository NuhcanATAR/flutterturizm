import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/router/main_router/ticket_router/ticket_router.dart';
import 'package:flutterturizm/product/utility/database/mainviews_db/home_db/home_db.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/utility/service/citydistrict_service/citydistrict_service.dart';

abstract class MainTicketsBase<T extends StatefulWidget> extends State<T> {
  // model service
  TicketsModelService modelService = TicketsModelService();

  // router service
  TicketRouterService routerService = TicketRouterService();

  // extension
  DynamicViewExtensions dynamicViewExtensions = DynamicViewExtensions();

  @override
  void initState() {
    super.initState();
    getCityDistrictApi();
  }

  // get city distirct api
  void getCityDistrictApi() async {
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
          modelService.ticketDate = selectedDateTime;
        });
      },
      currentTime: DateTime.now(),
      locale: LocaleType.tr,
    );
  }
}
