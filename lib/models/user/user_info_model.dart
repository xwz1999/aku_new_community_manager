class UserInfoModel {
  int id;
  String userName;
  String pwd;
  String actualName;
  String tel;
  int sex;
  String userCode;
  String birthday;
  String email;
  String idCard;
  int organizationId;
  String organizationIdPath;
  int positionId;
  String roleId;
  int status;
  int isDelete;
  int createId;
  String createDate;
  int modifyId;
  String modifyDate;
  String lastLoginIp;
  String lastLoginDate;
  String nickName;
  String code;
  String codeSendDate;
  int remake;
  int reportTo;
  String entryDate;

  UserInfoModel(
      {this.id,
      this.userName,
      this.pwd,
      this.actualName,
      this.tel,
      this.sex,
      this.userCode,
      this.birthday,
      this.email,
      this.idCard,
      this.organizationId,
      this.organizationIdPath,
      this.positionId,
      this.roleId,
      this.status,
      this.isDelete,
      this.createId,
      this.createDate,
      this.modifyId,
      this.modifyDate,
      this.lastLoginIp,
      this.lastLoginDate,
      this.nickName,
      this.code,
      this.codeSendDate,
      this.remake,
      this.reportTo,
      this.entryDate});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    pwd = json['pwd'];
    actualName = json['actualName'];
    tel = json['tel'];
    sex = json['sex'];
    userCode = json['userCode'];
    birthday = json['birthday'];
    email = json['email'];
    idCard = json['idCard'];
    organizationId = json['organizationId'];
    organizationIdPath = json['organizationIdPath'];
    positionId = json['positionId'];
    roleId = json['roleId'];
    status = json['status'];
    isDelete = json['isDelete'];
    createId = json['createId'];
    createDate = json['createDate'];
    modifyId = json['modifyId'];
    modifyDate = json['modifyDate'];
    lastLoginIp = json['lastLoginIp'];
    lastLoginDate = json['lastLoginDate'];
    nickName = json['nickName'];
    code = json['code'];
    codeSendDate = json['codeSendDate'];
    remake = json['remake'];
    reportTo = json['reportTo'];
    entryDate = json['entryDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['pwd'] = this.pwd;
    data['actualName'] = this.actualName;
    data['tel'] = this.tel;
    data['sex'] = this.sex;
    data['userCode'] = this.userCode;
    data['birthday'] = this.birthday;
    data['email'] = this.email;
    data['idCard'] = this.idCard;
    data['organizationId'] = this.organizationId;
    data['organizationIdPath'] = this.organizationIdPath;
    data['positionId'] = this.positionId;
    data['roleId'] = this.roleId;
    data['status'] = this.status;
    data['isDelete'] = this.isDelete;
    data['createId'] = this.createId;
    data['createDate'] = this.createDate;
    data['modifyId'] = this.modifyId;
    data['modifyDate'] = this.modifyDate;
    data['lastLoginIp'] = this.lastLoginIp;
    data['lastLoginDate'] = this.lastLoginDate;
    data['nickName'] = this.nickName;
    data['code'] = this.code;
    data['codeSendDate'] = this.codeSendDate;
    data['remake'] = this.remake;
    data['reportTo'] = this.reportTo;
    data['entryDate'] = this.entryDate;
    return data;
  }
}
