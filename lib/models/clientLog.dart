class ClientLog {
  String? name;
  String? category;
  String? description;
  DateTime? start;
  DateTime? end;
  String value;
  String unit;
  bool? isEndCall;
  String? textName;

  ClientLog(this.name, this.category, this.description, this.start, this.end,
      this.value, this.unit, this.isEndCall, this.textName);

  @override
  String toString() {
    return 'ClientLog{name: $name, category: $category, description: $description, start: $start, end: $end, value: $value, unit: $unit, isEndCall: $isEndCall, textName: $textName}';
  }
}
