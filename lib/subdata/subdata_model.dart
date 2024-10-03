class SubDataModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  SubDataModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  // Factory constructor for creating a new instance from a JSON map
  factory SubDataModel.fromJson(Map<String, dynamic> json) {
    return SubDataModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => Data.fromJson(item))
          .toList(),
      support:
          json['support'] != null ? Support.fromJson(json['support']) : null,
    );
  }

  // Method to convert the instance back into a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (support != null) {
      data['support'] = support!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  Data({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  // Factory constructor for creating a new instance from a JSON map
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      color: json['color'],
      pantoneValue: json['pantone_value'],
    );
  }

  // Method to convert the instance back into a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['year'] = year;
    data['color'] = color;
    data['pantone_value'] = pantoneValue;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  // Factory constructor for creating a new instance from a JSON map
  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }

  // Method to convert the instance back into a JSON map
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
