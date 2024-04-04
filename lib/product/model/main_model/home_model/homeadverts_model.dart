import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:equatable/equatable.dart';

class HomeAdvertListModel extends Equatable {
  const HomeAdvertListModel({
    this.id,
    this.img,
    this.url,
    this.urlActive,
    this.active,
  });

  final String? id;
  final String? img;
  final String? url;
  final bool? urlActive;
  final bool? active;

  @override
  List<Object?> get props => [
        id,
        img,
        url,
        urlActive,
        active,
      ];

  HomeAdvertListModel copyWith({
    String? id,
    String? img,
    String? url,
    bool? urlActive,
    bool? active,
  }) {
    return HomeAdvertListModel(
      id: id ?? this.id,
      img: img ?? this.img,
      url: url ?? this.url,
      urlActive: urlActive ?? this.urlActive,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'img': img,
      'url': url,
      'urlActive': urlActive,
      'active': active,
    };
  }

  factory HomeAdvertListModel.fromJson(Map<String, dynamic> json) {
    return HomeAdvertListModel(
      id: json['ID'] as String?,
      img: json['IMG'] as String?,
      url: json['URL'] as String,
      urlActive: json['URLACTIVE'] as bool?,
      active: json['ACTIVE'] as bool?,
    );
  }

  factory HomeAdvertListModel.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return HomeAdvertListModel(
      id: snapshot.id,
      img: data?['IMG'] as String?,
      url: data?['URL'] as String,
      urlActive: data?['URLACTIVE'] as bool?,
      active: data?['ACTIVE'] as bool?,
    );
  }
}
