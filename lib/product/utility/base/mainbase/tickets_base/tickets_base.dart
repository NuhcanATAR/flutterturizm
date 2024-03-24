import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/tickets_model.dart';
import 'package:flutterturizm/product/model/main_model/tickets_model/ticketslist_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:flutterturizm/product/utility/service/citydistrict_service/citydistrict_service.dart';
import 'package:http/http.dart' as http;

abstract class MainTicketsBase<T extends StatefulWidget> extends State<T> {
  // model service
  TicketsModelService modelService = TicketsModelService();

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

  Future<void> fetchTickets(TicketsModelService modelService) async {
    final response = await http.post(
      modelService.ticketsListUrl,
      body: {
        'takeOffCity': modelService.selectStartCity,
        'arrivalCity': modelService.selectEndCity,
        'ticketDate':
            "${modelService.ticketDate.year}-${modelService.ticketDate.month}-${modelService.ticketDate.day}",
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body);

      if (jsonList.isNotEmpty) {
        List<Tickets> tempTicketsList = [];
        for (var jsonTicket in jsonList) {
          tempTicketsList.add(Tickets.fromJson(jsonTicket));
        }

        setState(() {
          modelService.ticketsList = tempTicketsList;
        });
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Biletler bulunamadı!'),
        ));
      }
    } else {
      throw Exception('Failed to load tickets');
    }
  }
}
