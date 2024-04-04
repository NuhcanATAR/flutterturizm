import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterturizm/product/model/main_model/home_model/homeadverts_model.dart';
import 'package:flutterturizm/product/utility/dynamicextension/dynamicextension.dart';
import 'package:kartal/kartal.dart';

class AdvertsSliderWidget extends StatelessWidget {
  const AdvertsSliderWidget({
    super.key,
    required this.dynamicViewExtensions,
    required this.responseAdverts,
  });

  final DynamicViewExtensions dynamicViewExtensions;
  final dynamic responseAdverts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: dynamicViewExtensions.maxWidth(context),
      height: dynamicViewExtensions.dynamicHeight(context, 0.17),
      child: Padding(
        padding: context.padding.onlyTopMedium,
        child: FutureBuilder<QuerySnapshot<HomeAdvertListModel>>(
          future: responseAdverts,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot<HomeAdvertListModel>> snapshot,
          ) {
            if (snapshot.hasError) {
              return const SizedBox();
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }

            if (snapshot.hasData &&
                snapshot.data != null &&
                snapshot.data!.docs.isNotEmpty) {
              final values = snapshot.data!.docs.map((e) => e.data()).toList();
              return CarouselSlider.builder(
                itemCount: values.length,
                itemBuilder: (context, index, realIdex) {
                  return Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(values[index].img.toString()),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
