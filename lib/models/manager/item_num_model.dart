class ItemNumModel {
  int? unProcessedNum;
  int? processedNum;
  int? processingNum;
  int? allNum;

  ItemNumModel(
      {this.unProcessedNum,
      this.processedNum,
      this.processingNum,
      this.allNum});

  ItemNumModel.fromJson(Map<String, dynamic> json) {
    unProcessedNum = json['unProcessedNum'];
    processedNum = json['processedNum'];
    processingNum = json['processingNum'];
    allNum = json['allNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unProcessedNum'] = this.unProcessedNum;
    data['processedNum'] = this.processedNum;
    data['processingNum'] = this.processingNum;
    data['allNum'] = this.allNum;
    return data;
  }
}
