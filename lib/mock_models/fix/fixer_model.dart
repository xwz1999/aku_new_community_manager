enum FIXER_TYPE {
  ///空调组
  AIR_CONDITION,

  ///电力组
  ELECTRIC,

  ///水泥组
  CEMENT,
}

class FixerModel {
  FIXER_TYPE type;
  String name;
  String phone;
}
