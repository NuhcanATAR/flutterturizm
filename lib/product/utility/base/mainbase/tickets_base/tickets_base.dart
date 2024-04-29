// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/ticket/ticket_mixin.dart';
import 'package:flutterturizm/product/mixin/mainview_mixin/ticket/ticketcreatebloc_mixin.dart';
import 'package:flutterturizm/product/model/auth_model/currentuser_model/currentuser_model.dart';
import 'package:flutterturizm/product/model/connection_model/connection_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketdateslist_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/router/main_router/ticket_router/ticket_router.dart';
import 'package:flutterturizm/product/utility/database/mainviews_db/home_db/home_db.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/utility/service/citydistrict_service/citydistrict_service.dart';

import 'package:http/http.dart' as http;

abstract class MainTicketsBase<T extends StatefulWidget> extends State<T>
    with TicketCreateBlocMixin, TicketMixin {
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
    ConnectionControlModel().checkConnection(context);
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
      dateOfBirthDay: dateOfBirthDay,
      dateOfBirthMonth: dateOfBirthMonth,
      dateOfBirthYear: dateOfBirthYear,
      accountType: accountType,
      identificationId: identificationId,
      phoneNumber: phoneNumber,
    );
  }

  // purchased ticket
  Future<bool> purchasedTickets(
    TicketDates ticketDates,
    int seatID,
    TicketsModelService modelService,
  ) async {
    final responseUrl = await http.get(
      Uri.parse(
        'http://192.168.1.103:3000/api/purchasedTickets?seatNumber=${seatID.toInt()}&ticketdateid=${ticketDates.id}',
      ),
    );

    if (responseUrl.statusCode == 200) {
      if (json.decode(responseUrl.body) is List &&
          json.decode(responseUrl.body).isEmpty) {
        modelService.isSeatActiveStatus = true;
      } else {
        modelService.isSeatActiveStatus = false;
      }
    } else {
      if (kDebugMode) {
        modelService.isSeatActiveStatus = false;
      }
    }

    return modelService.isSeatActiveStatus;
  }
}
