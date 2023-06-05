class PartInfo {
  String? title;
  List<Data>? data;

  PartInfo({this.title, this.data});

  PartInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  List<String>? character;
  List<String>? equipment;

  Data({this.name, this.character, this.equipment});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    character = json['character'].cast<String>();
    equipment = json['equipment'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['character'] = character;
    data['equipment'] = equipment;
    return data;
  }
}