class AppStat {
  String? name;
  int? minutes;

  AppStat(this.name, this.minutes);

  factory AppStat.fromJson(dynamic json) {
    return AppStat(
      json['name'] == null ? null : json['name'] as String,
      json['duration'] == null ? null : json['duration'] as int,
    );
  }

  @override
  String toString() {
    return 'Log{name: $name, minutes: $minutes}';
  }
}
