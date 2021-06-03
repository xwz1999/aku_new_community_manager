enum FIXER_TYPE {
  ///空调组
  AIR_CONDITION,

  ///电力组
  ELECTRIC,

  ///水泥组
  CEMENT,

  ///物业组
  PROPERTY,
}

//TODO CLEAN BOTTOM CODES.
// @Deprecated("fixer_model need to be cleaned.")
// class FixerModel {
//   String name;
//   String phone;
//   FixerModel({this.name, this.phone});
// }

// class FixerTypedModel {
//   FIXER_TYPE type;
//   String get typeName {
//     switch (type) {
//       case FIXER_TYPE.AIR_CONDITION:
//         return '空调组';
//         break;
//       case FIXER_TYPE.ELECTRIC:
//         return '电力组';
//         break;
//       case FIXER_TYPE.CEMENT:
//         return '水泥组';
//         break;
//       case FIXER_TYPE.PROPERTY:
//         return '物业组';
//       default:
//         return '';
//     }
//   }

//   List<FixerModel> fixers;
//   FixerTypedModel({
//     this.type,
//     this.fixers,
//   });

//   static List<FixerTypedModel> models = [
//     FixerTypedModel(
//       type: FIXER_TYPE.AIR_CONDITION,
//       fixers: [
//         FixerModel(name: '刘能建师傅', phone: '18923747283'),
//         FixerModel(name: '李惠政师傅', phone: '18910298345'),
//         FixerModel(name: '李慧珍师傅', phone: '17872342382'),
//         FixerModel(name: '林 芝师傅', phone: '18292847752'),
//       ],
//     ),
//     FixerTypedModel(
//       type: FIXER_TYPE.CEMENT,
//       fixers: [
//         FixerModel(name: '李雷师傅', phone: '18923747283'),
//         FixerModel(name: '林智师傅', phone: '18910298345'),
//         FixerModel(name: '刘凯欣师傅', phone: '17872342382'),
//         FixerModel(name: '张亮师傅', phone: '18292847752'),
//       ],
//     ),
//     FixerTypedModel(
//       type: FIXER_TYPE.ELECTRIC,
//       fixers: [
//         FixerModel(name: '李建国师傅', phone: '18923747283'),
//         FixerModel(name: '李历程师傅', phone: '18910298345'),
//       ],
//     ),
//   ];

//   static List<FixerTypedModel> propertyModels = [
//     FixerTypedModel(
//       type: FIXER_TYPE.PROPERTY,
//       fixers: [
//         FixerModel(name: '李国师傅', phone: '18923747283'),
//         FixerModel(name: '章则林师傅', phone: '18910298345'),
//       ],
//     ),
//   ];
// }
