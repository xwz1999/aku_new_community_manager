// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AkuScaffold(
      title: '隐私协议',
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          children: [
            Text(
              '''
小蜜蜂智慧社区管家端APP是由深圳市凯达来科技有限公司提供的一款智慧社区APP，为用户提供更好、更优、更个性化的服务是我们坚持不懈的追求，也希望通过我们提供的服务可以更方便您的生活。依据法律的规定，我们将在特定情形下收集、使用、保存和披露您的个人信息。以下条款描述了我们如何收集、使用、保存和披露您的个人信息。
本政策将帮助您了解以下内容，请根据以下目录阅读相应章节：
1.个人信息的收集
2.个人信息的使用
3.个人信息的披露
4.个人信息的共享
5.安全
6.第三方网站
7.未成年人保护
8.联系我们
1.个人信息的收集
1.1信息收集目的
根据国家APP实名制管理规定，我们保存、使用和披露个人信息是为了通过创建账户、识别用户、回应查询等方式来为您提供服务。在得到您的许可之后，“小蜜蜂智慧社区APP”会向您提供基础物业服务、便民生活服务、业主自治及社交服务、社区生活相关的服务、发送资讯、调查、优惠和促销信息以及其他宣传材料，以为您提供更好的服务。物业基础服务包括：报修报事、生活缴费、蓝牙开门、访客通行、鹰眼服务、投诉表扬、常用电话、快递服务、装修管家、活动投票、问卷调查、咨询建议、资讯服务、幸福里、快递代寄、车位库房等服务。
1.2 信息收集的主要范围及方式
为实现“小蜜蜂智慧社区APP”之服务目的，“小蜜蜂智慧社区APP”会通过技术手段收集您的个人信息，通过技术手段所收集的个人信息仅限于您的姓名、出生日期、身份证号码、联系方式、住址等使用“小蜜蜂智慧社区APP”所必需的信息。此外，为确保园区安全，使用蓝牙开门及鹰眼服务，需根据审核规范，上传您的有效身份证信息。
“小蜜蜂智慧社区APP”支持多类操作系统的使用：在您通过各种手机操作系统使用“小蜜蜂智慧社区APP”的过程中，“小蜜蜂智慧社区APP”所收集的信息仅限于您同意使用“小蜜蜂智慧社区APP”基本服务所必需的信息。
我们会遵循正当、合法、必要的原则，出于本政策所述的目的收集和使用您的个人信息。您需要授权我们收集和使用个人信息的场景如下表所示：
服务项	目的及收集范围
报修报事	如您使用报修报事功能时，我们可能收集您的姓名，房号，设备信息、报修时间
投诉表扬/服务者评价	如您使用投诉表扬功能时，我们可能会收集您的姓名、联系方式、房号、下单时间。如您使用服务者评价功能时，我们会收集您所上传或下载的信息，这类信息包括搜索关键字、发布和回复信息。
缴费功能	如您使用缴费功能时，我们可能收集您的姓名、联系地址、联系方式、支付渠道、支付账号、支付网关号、订单信息、交易和消费信息、获奖信息、虚拟财产信息。这些信息属于个人敏感信息，在获得您的明示同意后，我们将使用加密技术收集，此类信息的收集范围我们会在前述活动及其规则中向您明示。
蓝牙开门	如您使用蓝牙开门功能时，我们可能收集您的姓名、房号、使用时间、使用次数、开门状态信息。
访客通行	如您使用访客通行功能时，我们可能会收集您的姓名、房号信息以及访客姓名、访客手机号、访客身份证号码、访问时间、访问人数、访客类型、访客车牌、访客目的、访客状态信息。
鹰眼服务	如您使用鹰眼服务功能时，我们可能会收集您的姓名、联系方式、所在园区、房号、使用时间信息，并在使用服务前，按审核要求进行实名认证。
投诉表扬	如您使用投诉表扬功能时，我们可能会收集您的姓名、联系方式、房号、下单时间。
常用电话	如您使用常用电话功能时，我们可能向您请求收集相关通讯录信息（包括联系人姓名及对应的联系方式），通讯录信息属于个人敏感信息，我们将使用加密技术收集，用于向您推荐通信录中的好友。您可以通过关闭设备通讯录权限停止我们收集前述通讯录信息，一旦您取消了授权，我们将不再继续收集。但是，您停止授权的行为不会影响我们此前基于您的授权所进行的信息收集及使用。
快递记录/快递代寄	如您使用快递服务功能时，我们可能收集您的收件人姓名、联系方式、联系地址、收件人类型、快递公司、快递单号、来源、录入时间、领取时间信息或订单信息。
装修管家	如您使用装修管家功能时，我们可能会收集您的姓名、联系方式、房号信息。
资讯服务	如您使用资讯服务功能时，我们可能会收集您的姓名、查看时间信息。
问卷调查/活动投票	如您使用问卷调查功能时，我们可能会收集您的姓名、联系方式、所在园区、房号、调查结果或投票结果信息。
咨询建议	如您使用咨询建议功能时，我们会收集您所上传或下载的信息，这类信息包括搜索关键字、发布和回复信息。
友邻社交	如您使用友邻社交功能时，我们会收集您姓名、联系方式、房号、发布时间、发布内容、车位库房信息。
业主自治	如您使用业主自治功能时，我们会收集您的姓名、联系方式、房号、发布时间、发布内容信息。
生活商圈	如您使用生活商圈功能时，我们可能会收集您的姓名、联系地址、联系方式、支付渠道、支付账号、支付网关号、订单信息、交易和消费信息、获奖信息、虚拟财产信息。这些信息属于个人敏感信息，在获得您的明示同意后，我们将使用加密技术收集，此类信息的收集范围我们会在前述活动及其规则中向您明示。
服务者评价	如您使用服务者评价功能时，我们会收集您所上传或下载的信息，这类信息包括搜索关键字、发布和回复信息。
智能家居	如您使用智能家居功能时，我们会收集您的姓名、联系方式、房号、设备信息、使用时间信息。
人脸通行/人脸智行	如您使用人脸通行功能时，我们会收集您的姓名、联系方式、面部数据、使用时间、使用次数信息。
开门码	如您使用开门码功能时,我们会收集您的姓名、联系方式、住址信息。
水电煤缴费	如您使用水电煤缴费功能时,我们会收集您的姓名、联系方式、住址信息。
智能家居	如您使用智能家居功能时,我们会收集您的姓名、联系方式、住址信息。
您需要授权访问及使用权限的功能场景如下表所示：
业务场景	场景说明	访问及使用权限
实名认证	需要扫码证件或者选择相册图片	使用相机设备权限、访问外部存储权、写外部存储权限
邻里发帖	邻里发帖需要拍照或选择相册图片	使用相机设备权限、访问外部存储权限、写外部存储权限
更换头像	更换头像需要拍照或选择相册图片	使用相机设备权限、访问外部存储权限、写外部存储权限
活动添加参与人	参与人头像可以编辑，需要拍照或选择相册图片	使用相机设备权限、访问外部存储权限、写外部存储权限
首页扫一扫	首页扫一扫需要调用设备摄像头二维码或者从相册里选择图片	使用相机设备权限、访问外部存储权限、写外部存储权限
管家页面查一查功能	扫一扫需要调用设备摄像头二维码或者从相册里选择图片	使用相机设备权限、访问外部存储权限、写外部存储权限
工作室	工作室编辑背景图，需要拍照或选择相册图片	使用相机设备权限、访问外部存储权限、写外部存储权限
订单评价	订单评价可以添加图片，需要拍照或选择相册图片	使用相机设备权限、访问外部存储权限、写外部存储权限
工单报事	报修报事、投诉表扬可以添加图片	使用相机设备权限、访问外部存储权限、写外部存储权限
物品出门	填写物品时可以添加图片，需要拍照或选择相册图片	使用相机设备权限、访问外部存储权限、写外部存储权限
语音管家报事	语音管家页面，输入咨询内容后，填写内容，可以选择图片，需要拍照或选择相册图片	使用相机设备权限、访问外部存储权限、写外部存储权限
商家和商品详情页	拨打商家和客服电话	拨打电话权限
电话物业	物业管家首页，点击“物业电话”	拨打电话权限
常用电话	拨打电话	拨打电话权限
语音管家	语音报事，需要语音识别	访问录音权限
保存图片	查看图片，点击保存图片	访问外部存储权限、写外部存储权限
选择项目	注册时选择项目，需要定位权限	访问位置权限
选择地址	我的地址里面添加或编辑地址	访问位置权限
蓝牙开门	蓝牙开门需要定位当前蓝牙点位置	访问位置权限
健康	生活健康页面需要获取用户步数信息(iOS特有)	访问健康权限
人脸通行/人脸采集	更换头像需要拍照或选择相册图片	使用相机设备权限、访问外部存储权限、写外部存储权限
1.3 信息推送及服务
您提供的信息，“小蜜蜂智慧社区APP”将最大限度尽合理之商业义务进行保密。经过您的同意，“小蜜蜂智慧社区APP”将会向您提供电子商务、生活服务、资讯、版本升级等服务。
为确保您的服务体验，在您使用平台功能时，根据服务状态，将为您发送快递、物业缴费、访客、物业工单、巡查、物品借用、活动报名、红包、拼团、商品订单、售后工单、发票状态信息，以及对快递服务的短信通知服务。
1.4 收集信息的其他方式
我们将采用其他方式（例如：信息下载、购买产品或服务、用户支持、反馈以及调查表）来收集您的个人信息。如果您将个人信息填写在其他开放的平台上，其他用户可能会获知您的信息。
1.5 收集的其他信息
为了便于您使用“小蜜蜂智慧社区APP”软件，我们的服务器将会收集关于您的移动通讯设备的信息，例如型号、设备ID、互联网协议地址、您访问的时间和地点、路由数据包、信息发送人和接收数据（但不是信息本身），以及其他类似的特征记录。
2.个人信息的使用
2.1 您的个人信息将不会用于本政策载明的目的之外的其他目的，双方另有约定的除外。
2.2 匿名汇总统计数据不是“小蜜蜂智慧社区APP”所定义的个人用户信息，我们将为多种目的，包括但不限于分析和使用模式的报告等，来保存和使用此类信息。用户使用本APP的，视为已授权“小蜜蜂智慧社区APP”提供方以任何目的自身或许可第三方使用和披露匿名汇总统计数据的权利。
3.个人信息的披露
3.1 除非本政策载明的有限披露，我们会妥善保存您的个人信息并不会泄露客户信息。
3.2 您于此授权，以下情形下，我们将会向第三方披露您的个人信息而无需通过您的同意：
如果我们披露这些信息是用来识别、联系或向可能对我们的权利或财产、网站用户或者其他任何人（包括其他任何人的权利和财产）造成损害之行为提起诉讼之必要；
法律调查之必要；
此类披露是法律规定或应向我们送达的传票或其他执法部门发出的令状之必要。
4.个人信息的共享
您于此授权，我们将在必要时，向合作的第三方提供您的个人信息，以便为您提供某些服务或代表我们履行职能，我们仅会处于本隐私条款声明的合法、正当、必要、特定、明确的目的共享您的信息，合作的第三方只能接触到其履行职责所需信息，且不得将此信息用于其他任何目的，我们不允许合作的第三方伴进行转委托。关于合作的第三方的信息及提供的服务、场景应用见下表：
合作的第三方名称	场景描述	个人信息类型	个人信息字段
深圳市凯达来科技有限公司	app数据统计	个人常用设备信息	设备信息、网络信息
5.安全
对我们来说，个人信息的安全非常重要。我们将尽可能保障您的个人信息安全，并实施合理的措施限制非授权访问、使用或者披露您的个人信息。尽管采取上述措施，但是您应当知晓“小蜜蜂智慧社区APP”不能完全避免与个人信息相关的安全危险。
双方同意，如发生下述情形，“小蜜蜂生活”APP不承担任何法律责任：
①依据法律规定或相关政府部门的要求提供您的个人信息；
②由于您的使用不当而导致任何个人信息的泄露；
③任何由于黑客攻击，电脑病毒的侵入，非法内容信息、骚扰信息的屏蔽，政府管制以及其他任何网络、技术、通信线路、信息安全管理措施等非“小蜜蜂生活”APP原因造成的服务中断、受阻等不能满足用户要求的情形；
您应当协助我们以保护您的个人信息安全。例如，不要泄露您的个人密码。
6.第三方网站
6.1 当您点击“小蜜蜂智慧社区APP”链接的其他网站时，您已经离开我们的网站并访问其他网站，其他网站可能会收集您的个人信息或匿名数据，因此，我们无法控制、检查或者回应此类网站和网站内容。
6.2 本政策不适用于在您点击链接后的外部网站收集数据的行为。
7.未成年人保护
“小蜜蜂智慧社区APP”非常重视对未成年人信息的保护。根据相关法律法规的规定，若您是18周岁以下的未成年人，在使用本APP服务前，应事先取得您家长或法定监护人的书面同意。“小蜜蜂智慧社区APP”不会使用未成年人的个人信息，也不会向任何第三方透露可识别的信息。若您是未成年人的监护人，当您对您所监护的未成年人的个人信息有相关疑问时，请通过第8节中的联系方式与我们联系。
8.联系我们
当您有其他的投诉、建议、未成年人个人信息相关问题时，您可以将您的问题发送至johnson.yang@akuhome.com 。我们将尽快审核所涉问题，并在验证您的用户身份后的十五天内予以回复。
深圳市凯达来科技有限公司
2020年10月20日
    ''',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
