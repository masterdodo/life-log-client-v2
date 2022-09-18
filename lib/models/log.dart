class Log {
  int? id;
  String? name;
  String? category;
  String? description;
  DateTime? start;
  DateTime? end;
  String? type;
  double? lat;
  double? lng;
  DateTime? datetimeCreated;
  DateTime? datetimeCreatedUtcZero;
  DateTime? datetimeUpdated;
  DateTime? datetimeUpdatedUtcZero;

  Log(
      this.id,
      this.name,
      this.category,
      this.description,
      this.start,
      this.end,
      this.type,
      this.lat,
      this.lng,
      this.datetimeCreated,
      this.datetimeCreatedUtcZero,
      this.datetimeUpdated,
      this.datetimeUpdatedUtcZero);

  factory Log.fromJson(dynamic json) {
    return Log(
      json['id'] == null ? null : json['id'] as int,
      json['name'] == null ? null : json['name'] as String,
      json['category'] == null ? null : json['category'] as String,
      json['description'] == null ? null : json['description'] as String,
      json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String).toLocal(),
      json['end'] == null
          ? null
          : DateTime.parse(json['end'] as String).toLocal(),
      json['type'] == null ? null : json['type'] as String,
      json['lat'] == null ? null : json['lat'] as double,
      json['lng'] == null ? null : json['lng'] as double,
      json['datetime_created'] == null
          ? null
          : DateTime.parse(json['datetime_created'] as String).toLocal(),
      json['datetime_created_utc_zero'] == null
          ? null
          : DateTime.parse(json['datetime_created_utc_zero'] as String),
      json['datetime_updated'] == null
          ? null
          : DateTime.parse(json['datetime_updated'] as String).toLocal(),
      json['datetime_updated_utc_zero'] == null
          ? null
          : DateTime.parse(json['datetime_updated_utc_zero'] as String),
    );
  }

  @override
  String toString() {
    return 'Log{id: $id, name: $name, category: $category, description: $description, start: $start, end: $end, type: $type, lat: $lat, lng: $lng, datetimeCreated: $datetimeCreated, datetimeCreatedUtcZero: $datetimeCreatedUtcZero, datetimeUpdated: $datetimeUpdated, datetimeUpdatedUtcZero: $datetimeUpdatedUtcZero}';
  }
}
