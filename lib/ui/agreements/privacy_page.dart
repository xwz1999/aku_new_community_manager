// Flutter imports:
// Project imports:
import 'package:aku_new_community_manager/ui/widgets/common/aku_scaffold.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

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
【前言】欢迎使用“小蜜蜂智慧生活管家端”（包括小蜜蜂智慧生活管家端网站、App、小程序及其他移动应用程序，以下统称“小蜜蜂智慧生活管家端”）提供的产品和服务。深圳市凯达来科技有限公司（注册地址：深圳市龙岗区横岗街道沙荷路40-11号）及其关联公司作为小蜜蜂智慧生活管家端运营者（或简称“我们”）深知个人信息对使用我们的产品和服务（以下统称“小蜜蜂智慧生活管家端服务”）之用户（以下统称“用户”或“您”）的重要性，我们一向庄严承诺保护您的个人信息及隐私安全。您在使用小蜜蜂智慧生活管家端服务时，我们可能会收集和使用您的相关个人信息。我们希望通过《小蜜蜂智慧生活管家端隐私政策》（以下简称“本政策”）向您说明我们在收集和使用您相关个人信息时对应的处理规则，以及我们为您提供的访问、更正、删除和保护这些个人信息的方式，以便更好的保障您的权益。
本政策适用于小蜜蜂智慧生活管家端提供的所有产品和服务，如与《小蜜蜂智慧生活管家端用户服务协议》条款之约定存在冲突的，以本政策为准。
需要特别说明的是，本政策不适用于其他第三方向您提供的服务，第三方向您提供的服务适用其向您另行说明的隐私政策。
 
【特别提示】请您在使用小蜜蜂智慧生活管家端服务前，仔细阅读（未成年人请在监护人陪同下阅读）并了解本政策（特别是加粗或下划线标注的内容），以做出适当选择。一旦您同意或在我们更新本政策后继续使用我们的产品或服务，即意味着您同意我们按照本政策处理您的相关个人信息。
 
在阅读完本政策后，如您对本政策或与本政策相关的事宜有任何问题，您可通过本政策“如何联系我们”章节所列的反馈渠道联系我们，我们会尽快为您作出解答。
 
本政策将帮助您了解以下内容：
 
一、我们如何收集和使用您的个人信息
二、我们如何使用 Cookies 和同类技术
三、我们如何共享、转让、公开披露您的个人信息
四、我们如何保护您的个人信息安全
五、您如何管理您的个人信息
六、第三方服务
七、未成年人信息的保护
八、通知和修订
九、如何联系我们
附件一：儿童个人信息收集使用规则
附件二：第三类SDK类服务商目录
 
一、我们如何收集和使用您的个人信息
我们收集您的个人信息主要是为了您能够更容易和更满意地使用小蜜蜂智慧生活管家端服务。小蜜蜂智慧生活管家端的目标是向所有的互联网用户提供安全、舒适的购物体验。而这些信息有助于我们实现这一目标。
 
（一）我们将通过以下途径收集和获得您的个人信息：                            
1、您提供的信息。 例如：
（1）您在注册小蜜蜂智慧生活管家端账号或使用小蜜蜂智慧生活管家端服务时，向我们提供的信息；
若您提供的信息中含有其他用户的个人信息，在向我们提供这些个人信息之前，您需确保您已经取得合法的授权。若涉及儿童个人信息的，您需在提供前取得该儿童监护人的同意。
（2）您通过小蜜蜂智慧生活管家端服务向第三方提供的共享信息，以及您使用小蜜蜂智慧生活管家端服务时所存储的信息。
请注意，如您在小蜜蜂智慧生活管家端服务中其他用户可见的公开区域内上传或发布的信息中、您对其他人上传或发布的信息作出的回应中公开您的信息，该等信息可能会被他人收集并加以使用。当您发现他人不正当地收集或使用您的信息时，可通过本政策“如何联系我们”章节所列的反馈渠道联系我们。
2、第三方共享的您的信息。亦即第三方使用小蜜蜂智慧生活管家端服务时所提供有关您的共享信息。
3、我们获取的您的信息。您在使用小蜜蜂智慧生活管家端服务时，我们经您授权后收集、汇总、记录的信息，例如日志信息、位置信息、设备信息。
 
（二）我们会出于以下目的，收集和使用您以下类型的个人信息：
1、帮助您完成注册/登录
为便于我们为您提供持续稳定的服务并保障您使用小蜜蜂智慧生活管家端服务的安全性，我们需要您提供您的手机号码进行注册，并创建您的用户名和密码。如果您仅需使用浏览、搜索等基本功能，您不需要创建账号及提供上述信息。
如您选择以非小蜜蜂智慧生活管家端账户的第三方账户登录小蜜蜂智慧生活管家端的，我们可能会根据您的授权从第三方处获取您的第三方账户信息，并与您的小蜜蜂智慧生活管家端账户进行绑定，使您可通过第三方账户直接登录、使用小蜜蜂智慧生活管家端服务。
在注册/登录过程中，如果您提供以下额外信息，将有助于我们给您提供个性化的商品推荐和更优的购物体验：您的昵称、性别、出生日期、头像以及您的实名认证等相关信息。但如果您不提供这些信息，并不会影响您使用小蜜蜂智慧生活管家端服务的基本功能。
2、向您提供服务信息展示及通知等基础功能
为了能赋予小蜜蜂消息和通知的推送能力，向您提供更契合您需求的页面展示和搜索结果、了解产品适配性、识别账号异常状态，我们可能会直接或者间接地收集关于您使用的服务以及使用方式的信息并将这些信息进行关联，以将信息通过安全加密的方式将服务器的消息和通知推送给您，这些信息包括：
   日志信息：当您使用我们的网站或客户端提供的产品或服务时，我们会自动收集您对我们服务的详细使用情况，作为有关网络日志保存。例如：您的浏览和搜索查询记录、IP地址、电信运营商、使用的语言、访问日期和时间。
   设备信息：我们会根据您在软件安装及使用中的具体操作，接收并记录您所使用的设备相关信息。具体如下：（1）设备型号、操作系统版本、MAC地址、设备设置，用于识别用户的设备类型、设备型号、系统版本等，确保推送消息准确下发；（2）设备标识符（IMEI/Android ID/IDFA/OpenUDID/GUID/SIM 卡IMSI 信息），用于识别唯一用户，保证推送信息的精准送达；（3）设备环境信息、设备所在位置相关信息（包括IP 地址、GPS位置以及WLAN接入点、蓝牙和基站等传感器信息）和设备权限信息（包括存储权限），用于优化SDK与服务器的网络连接请求，保证服务的稳定性和连续性；（4）app应用列表及活跃状态信息，用于当同个设备有多个推送链路同时活跃时，我们会随机合并成一条链路，以达到为用户节省电量的目的；我们会向您提供智能推送服务，通过该消息推荐符合您需要的推送内容，减少无用信息对您的打扰。以上信息的获取同时也为确保设备操作环境的安全以及提供小蜜蜂智慧生活管家端服务所必需，防止恶意程序和反作弊。
请注意，单独的设备信息、日志信息等是无法识别特定自然人身份的信息。如果我们将这类非个人信息与其他信息结合用于识别特定自然人身份，或者将其与个人信息结合使用，则在结合使用期间，这类非个人信息将被视为个人信息，除取得您授权或法律法规另有规定外，我们会将该类个人信息做匿名化、去标识化处理。
3、为您提供巡更管理功能
在您使用巡更功能时，您至少需要向我们提供您的位置信息，用以在使用该服务中对“通过读取相册中的二维码照片扫码来完成任务”的情况进行甄别，我们会收集包括您设备的定位信息用于实现上述功能及其他我们明确告知的目的。
请注意，您的位置信息属于个人敏感信息，请您谨慎提供，如果拒绝提供您将可能无法获得相关服务，但不影响其他功能与服务的正常使用。
您在小蜜蜂智慧生活管家端的使用过程中，将可能包含您或者其他人的身份信息、联络信息，这些都属于敏感信息，请您谨慎向他人展示或对外提供。我们也将会在展示信息时，在保证信息可用性的基础上尽量做去标识化处理（如对业主身份申请人的手机号进行脱敏处理）。
4、保障您的使用安全
为提高您使用小蜜蜂智慧生活管家端服务的安全性，更好地预防钓鱼网站、计算机病毒等安全风险，保护您或其他用户或公众的人身财产安全，更准确地识别违反法律法规或小蜜蜂智慧生活管家端相关协议规则的情况，我们可能整合您的个人信息、交易信息、设备信息、网络日志及其他第三方依法共享的信息来综合判断您账户及交易风险、进行身份验证、检测及防范安全事件，并依法采取必要的记录、审计、分析、处置措施。
5、为您提供其他扩展服务
为向您提供更符合您需求的产品及/或服务，提升您使用小蜜蜂智慧生活管家端的体验，我们在向您提供以下扩展服务时可能会基于您的授权收集和使用您的个人信息：
（1）基于位置信息的巡更管理服务：我们会在您开启位置权限后访问获取您的位置信息，根据您的位置信息向您展示您当前所处位置。我们仅收集您当时所处的地理位置，但不会将您各时段的位置信息进行结合以判断您的行踪轨迹。如果您拒绝提供，您也可以不使用该服务。
（2）基于相机的扩展服务：您可在开启相机/摄像头权限后使用该功能进行拍照用于确认巡更是否到达指定地点，拍摄照片或视频用于任务上报。请您知晓，即使您已同意开启相机权限，我们也仅会在您主动点击客户端内相机图标或录制视频时通过相机获取照片信息。
（3）基于相册（图片库/视频库）的图片/视频访问及上传的扩展服务：您可在开启相册权限后使用该功能上传您的照片/图片/视频，以实现更换头像、上传巡更现场信息等功能。我们可能会通过您所上传的照片/图片来使用包含您所上传照片或图片的信息进行登记。
您理解并同意，实现上述扩展服务需要您通过开启您设备中相应权限的方式授权我们访问您的相机、相册、日历或获取您的位置信息。如您不提供该授权，不影响您对小蜜蜂智慧生活管家端服务基本功能的使用。当您需要取消授权时，您可以关闭您设备中的相应权限，具体方法请参考您的设备说明书或联系您设备的服务商或生产商。但是，您关闭权限的决定不会影响此前基于您的授权所进行的信息收集及使用。
12、其他目的和用途
请您注意，如果我们要将您的个人信息用于本政策中未载明的其他用途或额外收集未提及的其他个人信息，我们会通过页面提示、交互流程、网站公告或其他方式另行征得您的同意。一旦您同意，该等额外用途将视为本政策的一部分，该等额外信息也将适用本政策。
 
（三）我们通过间接方式收集您个人信息的情形
我们可能会从关联方、第三方合作伙伴获取您授权共享的相关信息。例如，当您通过第三方合作伙伴网站及其移动应用软件等下单时，您向其提供的订单信息可能会转交给我们，以便我们处理您的订单并保证服务的顺利完成；本条款前述您通过第三方账户登录小蜜蜂智慧生活管家端时，我们将根据您的授权从第三方合作伙伴获取您授权共享的相关信息（如用户名、头像、昵称，具体以您的授权内容为准），并将您的第三方账户与您的小蜜蜂智慧生活管家端账户绑定，使您可以通过第三方账户直接登录小蜜蜂智慧生活管家端。
我们将在符合相关法律法规规定，并依据与关联方或第三方合作伙伴的约定、确定其提供的个人信息来源合法的前提下，在关联方或第三方合作伙伴已获得您授权同意的范围内收集并使用您的这些个人信息，如确需超出前述范围使用，将会另行征得您的同意。我们会使用不低于我们对自身用户个人信息同等的保护手段与措施对间接获取的个人信息进行保护。
 
（四）征得授权同意的例外
根据相关法律法规规定，以下情形中收集您的个人信息无需征得您的授权同意：
1、与国家安全、国防安全直接相关的；
2、与公共安全、公共卫生、重大公共利益直接相关的；
3、与刑事侦查、起诉、审判和判决执行等直接相关的；
4、出于维护您或其他个人的生命、财产等重大合法权益但又很难得到本人同意的；
5、所收集的个人信息是您自行向社会公众公开的；
6、从合法公开披露的信息中收集个人信息的，如合法的新闻报道、政府信息公开等渠道；
7、根据您的要求签订和履行合同所必需的；
8、维护小蜜蜂智慧生活管家端所提供的产品或服务的安全稳定运行所必需的，例如发现、处置产品或服务的故障；
9、开展合法的新闻报道所必需的；
10、出于公共利益开展统计或学术研究所必要，且对外提供学术研究或描述的结果时，对结果中所包含的个人信息进行去标识化处理的；
11、法律法规规定的其他情形。
您知悉并理解，在收集您的个人信息后，我们可能通过技术手段对数据进行去标识化处理，去标识化处理的信息将无法识别您的身份，在此情况下我们有权使用已经去标识化的信息，对用户数据库进行分析并予以商业化的利用，而无需另行获得您的同意。
 
（五）有关个人敏感信息的提示
个人敏感信息，是指一旦泄露、非法提供或滥用可能危害人身和财产安全，极易导致个人名誉、身心健康受到损害或歧视性待遇等的个人信息。以上由您提供或我们收集您的信息中，可能包含您的个人敏感信息，例如身份证件号码、个人生物识别信息（包括面部识别特征、声纹等）、银行账号、通信记录和内容、财产信息、征信信息、行踪轨迹、住宿信息、健康生理信息、交易信息。请您谨慎并留意个人敏感信息，您同意我们可以按本政策所述的目的和方式来处理您的个人敏感信息。
二、我们如何使用 Cookies 和同类技术
（一）Cookies
我们或我们的第三方合作伙伴可能通过Cookies或同类技术获取和使用您的信息，并将该等信息存储为日志信息。
通过使用Cookies，我们向用户提供简单易行并富个性化的网络体验。一个Cookies是少量的数据，它们从一个网络服务器送至您的浏览器并存在计算机硬盘上。我们使用Cookies是为了让您可以受益，比如简化您重复登录的步骤、存储您的购物偏好或您购物车中的商品等数据进而为您提供购物的偏好设置、帮助您优化对广告的选择与互动、帮助判断您的登录状态以及账户或数据安全。
 
(二) 网站信标等同类技术
除 Cookies 外，我们还会在网站上使用网站信标和像素标签等其他同类技术。例如，我们向您发送的电子邮件可能含有链接至我们网站内容的地址链接，如果您点击该链接，我们会跟踪此次点击，帮助我们了解您的产品或服务偏好，以便于我们主动改善客户服务体验。网站信标通常是一种嵌入到网站或电子邮件中的透明图像。借助于电子邮件中的像素标签，我们能够获知电子邮件是否被打开。
 
（三）Cookies及同类技术的使用
我们使用Cookies或同类技术，可能用于以下用途：
1、记住您的身份。例如：Cookies或同类技术有助于我们辨认您作为我们的注册用户的身份，或保存您向我们提供有关您的喜好或其他信息，或协助判断您的登录状态是否正常、账号是否存在异常情况；
2、分析您使用我们服务的情况。我们可利用Cookies或同类技术来了解您使用小蜜蜂智慧生活管家端服务的什么功能、或哪些产品/服务最受欢迎；
3、广告优化。Cookies或同类技术有助于我们根据您的信息，向您提供与您相关的广告而非进行普遍的广告投放。
我们为上述目的使用Cookies或同类技术的同时，可能将通过Cookies或同类技术收集的非个人身份信息汇总提供给广告商或其他合作伙伴，用于分析您和其他用户如何使用小蜜蜂智慧生活管家端服务并用于广告服务。
您可根据自己的偏好管理或删除、退订 Cookies或同类技术。您通常可根据自己的需要来修改浏览器的设置以拒绝 Cookies或其他同类技术，或清除软件内保存的所有Cookies或同类技术，或根据相应的选择机制拒绝Cookies或同类技术的应用。但如果您这么做，您可能无法享受最佳的服务体验，如您可能需要在每一次访问小蜜蜂智慧生活管家端时亲自更改用户设置，而且您之前所记录的相应信息也均会被删除，某些服务也可能无法正常使用。
三、我们如何共享、转让、公开披露您的个人信息
（一）共享
我们不会与小蜜蜂智慧生活管家端运营者以外的公司、组织和个人共享您的个人信息，但以下情况除外：
1、在获取您授权同意的情况下共享：获得您授权同意后，我们会与第三方共享您的个人信息。
2、在法定情形下共享：我们可能会根据法律法规规定、诉讼争议解决需要，或按行政、司法机关依法提出的要求，对外共享您的个人信息。
3、为实现本政策第一条“我们如何收集和使用您的个人信息”部分所述目的的情形下共享。
4、与我们的关联方共享：为便于我们基于统一的账号体系向您提供一致化服务、保障系统和账号安全，便于您进行统一管理，提升您的使用体验，我们可能会将您的个人信息与我们的关联方共享。但我们只会共享必要的个人信息，且受本政策中所声明目的的约束。如果我们的关联方改变个人信息的使用及处理目的，将再次征求您的授权同意。
5、与授权合作伙伴共享：仅为实现本政策中声明的目的，我们可能会与授权合作伙伴共享您的订单信息、账户信息、设备信息、日志信息以及位置信息，以提供更好的客户服务和用户体验。我们仅会出于合法、正当、必要、特定、明确的目的共享您的个人信息，并且只会共享提供服务所必要的个人信息。我们的授权合作伙伴无权将共享的个人信息用于与小蜜蜂智慧生活管家端服务无关的其他用途。
目前，我们暂无授权合作伙伴

6、履行我们在本政策或我们与您达成的其他协议中的义务和行使我们的权利。
对我们与之共享个人信息的公司、组织和个人，我们会与其签署严格的保密协议，要求他们按照我们的说明、本政策以及其他任何相关的保密和安全措施来处理个人信息。
 
（二）转让
我们不会将您的个人信息转让给任何公司、组织和个人，但以下情况除外：
1、在获取授权同意的情况下转让：获得您的授权同意后，我们会向第三方转让您的个人信息；
2、随着我们业务的持续发展，我们有可能进行合并、收购、资产转让或类似的交易，而您的信息有可能作为此类交易的一部分而被转移。我们会要求新的持有您个人信息的公司、组织继续受本政策的约束，否则我们将要求该公司、组织重新向您征求授权同意。
 
（三）披露
我们仅会在以下情况下，且采取符合业界标准的安全防护措施的前提下，披露您的个人信息：
1、获得您授权同意或基于您的主动选择，我们可能会披露您的个人信息；
2、根据法律、法规的要求、强制性的行政执法或司法要求所必须提供您个人信息的情况下，我们可能会依据所要求的个人信息类型和披露方式披露您的个人信息。在符合法律法规的前提下，当我们收到上述披露信息的请求时，我们会要求接收方必须出具与之相应的法律文件，如传票或调查函。
 
（四）共享、转让、披露个人信息时事先征得授权同意的例外
以下情形中，共享、转让、披露您的个人信息无需事先征得您的授权同意：
1、与国家安全、国防安全直接相关的；
2、与公共安全、公共卫生、重大公共利益直接相关的；
3、与刑事侦查、起诉、审判和判决执行等直接相关的；
4、出于维护您或其他个人的生命、财产等重大合法权益但又很难得到您同意的；
5、您自行向社会公众公开的个人信息；
6、从合法公开披露的信息中收集个人信息的，如合法的新闻报道、政府信息公开等渠道；
7、基于法律法规规定履行法定义务；
8、与我们履行法律法规规定的义务相关的。
根据法律规定，共享、转让经去标识化处理的个人信息，且确保数据接收方无法复原并重新识别个人信息主体的，不属于个人信息的对外共享、转让及披露行为，对此类数据的保存及处理将无需另行向您通知并征得您的同意。
四、我们如何保护您的个人信息安全
（一）除法律法规或监管部门另有规定外，我们仅在本政策所述目的所必需且最短时限内存储您的个人信息，除非法律法规或监管机关另有要求或延长保留期征得您的同意。当您的个人信息超出我们所保存的期限后，我们会对您的个人信息进行删除或匿名化处理。
 
（二）如我们终止服务或运营，我们将及时停止继续收集您个人信息的活动，同时会遵守相关法律法规要求提前向您通知，并在终止服务或运营后对您的个人信息进行删除或匿名化处理，但法律法规或监管部门另有规定的除外。涉及儿童个人信息的，我们会将停止运营的通知及时告知儿童监护人。
 
（三）我们在中华人民共和国境内运营中收集和产生的信息，均存储在中国境内，目前我们暂时不存在跨境存储您的个人信息或向境外提供个人信息的场景。如需跨境存储或向境外提供个人信息的，我们会单独向您明确告知并征得您的授权同意。
 
（四）信息安全保障措施
我们非常重视个人信息安全，成立了专门的安全团队，并采取一切合理可行的措施，保护您的个人信息。
1、数据安全技术措施
我们会采用符合业界标准、合理可行的安全防护措施保护您提供的个人信息，防止您的个人信息遭到未经授权访问、公开披露、使用、修改、损坏或丢失。
（1）我们会采用加密技术确保数据的保密性。例如，在您的浏览器与服务器之间交换数据（如信用卡信息）时受 SSL（Secure Socket Layer）加密保护。
（2）我们会采用数据脱敏技术增强个人信息在使用中安全性。
（3）我们对小蜜蜂智慧生活管家端提供HTTPS（Hyper Text Transfer Protocol over Secure Socket Layer）安全浏览方式。
（4）我们会采用受信赖的保护机制防止数据遭到恶意攻击。
（5）我们会采用严格的数据访问权限控制和多重身份认证技术保护个人信息，避免数据被违规使用。
2、其他安全措施
（1）我们有行业先进的以数据为核心，围绕数据生命周期进行的数据安全管理体系，从组织建设、制度设计、人员管理、产品技术等方面多维度提升整个系统的安全性。
（2）我们通过建立数据分级制度、数据安全管理规范、数据安全开发规范来管理规范个人信息的存储和使用。
（3）我们会部署访问控制机制，仅允许有必要知晓这些信息的员工、合作伙伴访问您的个人信息，并为此设置了严格的访问权限控制和监控机制。我们同时要求可能接触到您个人信息的所有人员履行相应的保密义务。如果未能履行这些义务，可能会被追究法律责任或被中止与我们的合作关系。
（4）我们会举办安全和隐私保护培训课程，加强员工对于保护个人信息重要性的认识。
（5）我们有行业先进的以数据为核心、围绕数据生命周期进行的数据安全管理体系，从组织建设、制度设计、人员管理、产品技术等方面多维度提升整个系统的安全性。
（6）我们会采取一切合理可行的措施，确保未收集无关的个人信息。
3、互联网环境并非百分之百安全，我们将尽力确保或担保您发送给我们的任何信息的安全性。如果我们的物理、技术、或管理防护设施遭到破坏，导致信息被非授权访问、公开披露、篡改、或毁坏，导致您的合法权益受损，我们将承担相应的法律责任。
 
（五）安全提示
1、在使用小蜜蜂智慧生活管家端服务进行沟通或购买商品及服务时，您不可避免地要向交易对方或潜在的交易对方披露自己的个人信息，如联络方式或联系地址。请您妥善保护自己的个人信息，仅在必要的情形下向他人提供。
2、请注意，您在使用我们服务时自愿共享甚至公开分享的信息，可能会涉及您或他人的个人信息甚至个人敏感信息，如您在评价或分享晒单时选择上传包含个人信息的图片。请您更加谨慎地考虑，是否在使用我们的服务时共享甚至公开分享相关信息。若您公开分享的信息中涉及儿童个人信息的，您需在发布前征得该儿童监护人的同意。
3、请您理解，由于技术的限制以及风险防范的局限，即便我们已经尽量加强安全措施，也无法始终保证信息百分之百的安全。您需要了解，您接入小蜜蜂智慧生活管家端服务所用的系统和通讯网络，有可能因我们可控范围外的情况而发生问题。
 
（六）安全事件处置
为应对个人信息泄露、损毁和丢失等可能出现的风险，我们制定了多项制度，明确安全事件、安全漏洞的分类分级标准及相应的处理流程。我们也为安全事件建立了专门的应急响应团队，按照安全事件处置规范要求，针对不同安全事件启动安全预案，进行止损、分析、定位、制定补救措施、联合相关部门进行溯源和打击。
在不幸发生信息安全事件后，我们将按照法律法规的要求，及时向您告知：安全事件的基本情况和可能的影响、我们已采取或将要采取的处置措施、您可自主防范和降低风险的建议、对您的补救措施等。我们会及时将事件相关情况以邮件、信函、电话、推送通知等方式告知您，难以逐一告知个人信息主体时，我们会采取合理、有效的方式发布公告。同时，我们还将按照监管部门要求，主动上报信息安全事件的处置情况。
五、您如何管理您的个人信息
我们非常重视您对个人信息的关注，并尽全力保护您对于您个人信息访问、更正、删除以及撤回同意的权利，以使您拥有充分的能力保障您的隐私和安全。同时也请您理解，您更正、删除、撤回授权或注销账号的决定，并不影响我们此前基于您的授权而开展的个人信息处理。
您可以通过以下方式来管理您的个人信息，但请您知悉，除法律法规另有规定，当您更正、删除您的个人信息或申请注销账号时，我们可能不会立即从备份系统中更正或删除部分特定信息，但会在备份更新时更正或删除这些信息。
 
（一）访问、更正您的个人信息
您有权随时访问、更正您的个人信息，法律法规另有规定的情况除外。您可以通过以下方式自行访问、更正您的个人信息：
1、您可以登录移动客户端账号，在底部点击“我的”进入个人页面，然后点击左上角的头像进入个人中心查询、更正您的个人信息及账户信息；点击“我的”中的“地址”查询、更正您的收货地址；
3、如果您无法通过上述路径访问、更正该等个人信息，您可以通过我们的在线客服与我们取得联系。对于您在使用小蜜蜂智慧生活管家端服务过程中产生的其他个人信息需要访问或更正，我们会根据本政策所列明的方式、期限及范围来响应您的请求。但出于安全性和身份识别的考虑，您可能无法修改注册时提交的某些初始注册信息。
 
（二）删除您的个人信息
1、您可以通过“（一）访问、更正您的个人信息”中列明的方式自主删除您的部分个人信息。在部分信息删除时，我们可能会要求您进行身份验证，以保障信息安全。
2、在以下情形中，如您无法通过前述第1款所述方式自主删除您的个人信息，您可以向我们提出删除个人信息的请求：
（1）如果我们处理个人信息的行为违反法律法规；
（2）如果我们收集、使用您的个人信息，却未征得您的授权同意；
（3）如果我们处理个人信息的行为严重违反了与您的约定；
（4）如果我们不再为您提供小蜜蜂智慧生活管家端服务。
若我们确认您的删除请求符合法律法规及其他公示的要求，我们还将同时尽可能通知从我们处获得您的个人信息的关联方及授权合作伙伴，要求其及时删除，除非法律法规另有规定，或这些实体获得您的独立授权。
 
（三）改变您授权同意的范围或撤回您的授权
请您理解，有些基本的个人信息是您使用小蜜蜂智慧生活管家端服务所必需的，但大多数其他个人信息的提供是由您决定的。您可以通过删除信息、关闭设备功能等方式改变您授权我们继续调用附加功能收集您个人信息的范围或撤回您的授权。当您撤回授权后，我们将无法继续为您提供您撤回授权所对应的服务，也不再处理您相应的个人信息。
 
（四）注销您的账户
您可以登录小蜜蜂智慧生活管家端移动客户端，通过“我的-设置-账户与安全-注销账户”申请注销您的账户。在您主动注销账户之后，我们将停止为您提供产品或服务，我们将根据适用法律的要求删除您的个人信息，或使其匿名化处理。
 
（五）约束信息系统自动决策
在某些业务功能中，我们可能仅依据信息系统、算法等在内的非人工自动决策机制做出决定。如果这些决定显著影响您的合法权益，您有权要求我们做出解释，我们也将在不侵害小蜜蜂智慧生活管家端商业秘密或其他用户权益、社会公共利益的前提下提供适当的救济方式。
 
（六）响应您的上述请求
为保障安全，您可能需要提供书面请求，或以其他方式证明您的身份。我们可能会先要求您验证自己的身份，然后再处理您的请求。
一般情况下，我们将在十五日内做出答复。如您不满意，还可以通过本政策“如何联系我们”章节所列的反馈渠道与我们联系。
对于您合理的请求，我们原则上会按照本政策约定进行响应，但对于无端重复、需要过多技术手段（例如，需要开发新系统或从根本上改变现行惯例）、给他人合法权益带来风险或者非常不切实际（例如，涉及备份磁带上存放的信息）的请求，我们可能会予以拒绝。
在以下情形中，按照法律法规要求，我们将无法响应您的请求：
1、与我们履行法律法规规定的义务相关的；
2、与国家安全、国防安全直接相关的；
3、与公共安全、公共卫生、重大公共利益直接相关的；
4、与刑事侦查、起诉、审判和执行判决等直接相关的；
5、我们有充分证据表明您存在主观恶意或滥用权利的；
6、出于维护您或其他个人的生命、财产等重大合法权益但又很难得到本人同意的；
7、响应您的请求将导致您或其他个人、组织的合法权益受到严重损害的；
8、涉及商业秘密的。
六、第三方服务
小蜜蜂智慧生活管家端服务可能接入或链接至第三方提供的社交媒体或其他服务（包括网站或其他服务形式）。包括：
1、您可利用“分享”键将小蜜蜂智慧生活管家端上的某些内容分享给第三方产品，或您可利用第三方服务登录小蜜蜂智慧生活管家端服务。这些功能可能会收集您的信息（包括您的日志信息），并可能在您的设备内装置Cookies，从而正常运行上述功能；
2、我们通过广告或我们服务的其他方式向您提供链接，使您可以链接至第三方的服务或网站；
3、我们可能会接入第三方SDK或其他类似的应用程序服务（如以嵌入代码、插件等形式），您在小蜜蜂智慧生活管家端使用这类由第三方提供的服务时，该第三方可能会收集和处理您的部分信息。目前我们接入的第三方SDK或其他类似应用程序服务及相应的信息收集情况主要有：
（1）各类手机厂商的Push SDK可能会收集您的设备信息，用于推送/下发通知栏消息；
（2）高德地图SDK可能会在您授权后收集您的设备位置信息，用于预测产品的配送时限；
（3）运营商SDK可能会收集您的设备信息和手机号，用于快速便捷登录小蜜蜂智慧生活管家端；
（4）设备系统SDK可能会收集您的设备信息，用于监测系统运营安全性、诊断并解决系统故障。
我们接入的部分第三方SDK或类似应用程序可能会收集您的个人信息，如您在我们的服务中使用这类由第三方提供的服务时，您同意将由其直接收集和处理您的信息。我们会评估这类第三方服务收集个人信息的合法性、正当性、必要性，要求该等第三方对您的个人信息采取保护措施，并严格遵守相关法律法规与监管要求。您可以查看《第三方SDK类服务商目录》，了解我们主要接入的第三方SDK基本情况。您也可以选择通过本政策“如何联系我们”章节所列的反馈渠道联系我们，我们会尽快为您作出解答。
以上第三方服务由相关的第三方负责运营。您使用该等第三方服务（包括您向该等第三方提供的任何信息），须受第三方的服务条款及信息保护声明（而非本政策）约束。为了最大程度保障您的信息安全，我们强烈建议您在使用任何第三方服务前先行查看其隐私条款。我们会尽我们最大努力在接入第三方服务时进行安全检测并不定期进行审计，如发现第三方存在违规收集用户信息情形将及时切断接入，但我们无法对任何第三方使用由您提供的信息承担任何责任。如您发现这些第三方服务存在风险时，建议您终止相关操作并及时与我们联系以保护您的合法权益并及时与我们取得联系。
七、未成年人信息的保护
小蜜蜂智慧生活管家端服务主要面向具有完全民事行为能力的成年人。未经父母或者监护人同意，未满十四周岁的儿童不应创建小蜜蜂智慧生活管家端账户或者使用小蜜蜂智慧生活管家端服务。如您为未成年人，我们要求您请您的父母或其他监护人仔细阅读本政策及儿童个人信息收集使用规则，并在征得您的父母或其他监护人同意的前提下使用我们的服务或向我们提供信息。
如果我们识别出您是儿童用户的，我们将通知您的监护人并要求您的监护人阅读并同意本政策及附件一《儿童个人信息收集使用规则》。对于经父母或其他监护人同意使用我们的产品或服务而收集儿童个人信息的情况，我们只会在法律法规允许、父母或其他监护人明确同意或者保护儿童所必要的情况下使用、共享、转让或披露此信息。若您是儿童的父母或其他监护人，请您关注您监护的儿童是否是在取得您的授权同意之后使用我们的服务的。如您对您所监护的儿童的个人信息有疑问，请通过“如何联系我们”章节中所列反馈渠道与我们联系。
八、通知和修订
（一）为了给您提供更好的服务，我们可能会根据小蜜蜂智慧生活管家端服务的更新情况及法律法规的相关要求适时修改本政策的条款，该等修改构成本政策的一部分。如该等更新造成您在本政策下权利的实质减少或重大变更（如收集和使用的个人信息类型、收集和使用方式发生重大变化），我们将在本政策生效前通过网站公告、推送通知、弹窗提示或其他方式来通知您，您如果不同意该等变更，可以选择停止使用小蜜蜂智慧生活管家端服务；如您仍然继续使用小蜜蜂智慧生活管家端服务的，即表示您已充分阅读、理解并同意受经修订的本政策的约束。
我们的任何修改都会将您的满意度置于首位。我们鼓励您在每次使用小蜜蜂智慧生活管家端服务时都查阅我们的隐私政策。
 
（二）我们可能在必需时（例如当我们由于系统维护而暂停某一项服务时）发出与服务有关的公告。您可能无法取消这些与服务有关、性质不属于推广的公告。
九、如何联系我们
我们设立了个人信息保护专职部门，将按照本政策保护您的个人信息。如您有关于网络信息安全的投诉和举报，或您对本政策、小蜜蜂智慧生活管家端的隐私措施、您的信息的相关事宜有任何问题、意见或建议，请与小蜜蜂智慧生活管家端的个人信息保护工作人员联系，可发送邮件至kaidalai@163.com或写信至以下地址：深圳市龙岗区横岗街道沙荷路40-11号
 个人信息保护专员（收）；邮编：518000。
一般情况下，我们将在收到您的问题、意见或建议，并验证您的用户身份后的十五日内予以回复。
 
 
 
 
 
附件一：儿童个人信息收集使用规则
我们一直非常注重对未成年人的保护，致力于践行我们的企业社会责任。本《儿童个人信息收集使用规则》（以下也称“本规则”）旨在更详细的向监护人（以下也称“您”）和儿童（专指未满十四周岁的未成年人，下同）说明我们如何收集、使用、存储和处理儿童个人信息，以及我们为您与儿童提供的访问、更正、删除、保护这些信息的方式。请您仔细阅读、充分理解并决定选择是否同意本规则以及是否同意您监护的儿童使用小蜜蜂智慧生活管家端服务。
 
一、适用范围
本规则为《小蜜蜂智慧生活管家端隐私政策》的一部分；如在儿童个人信息收集和使用规则方面，本规则与《小蜜蜂智慧生活管家端隐私政策》正文存在不一致的，本规则优先适用，如本规则中未提及的，则适用《小蜜蜂智慧生活管家端隐私政策》。
 
二、我们收集和使用儿童个人信息的规则
我们会严格履行法律规定的儿童个人信息保护义务与责任，遵循正当必要、知情同意、目的明确、安全保障、依法利用的原则收集和使用儿童个人信息，在征得监护人的同意后收集和使用儿童个人信息，不会收集与我们提供的产品与/或服务无关的儿童个人信息，不会违反法律规定和我们与您的约定收集、使用儿童个人信息。
1、在注册/登录过程中，用户可以填写出生日期；用户购买礼品卡超过1000元时，我们会要求用户进行实名认证。在前述场景下，我们可能会根据用户填写的信息识别该用户是否为儿童。
2、当我们识别出用户为儿童时，我们可能会收集监护人的联系方式（例如手机号码、电子邮箱），联系监护人以验证其与儿童的监护关系，并在征得监护人同意后允许儿童使用小蜜蜂智慧生活管家端服务。在此过程中，为了更好地保护儿童的权益，我们还可能向监护人收集更多信息（例如姓名、身份证、户口本或其他监护关系证明），以便进一步验证监护人与儿童的监护关系。
3、我们还可能收集由您或者其他用户主动上传的儿童个人信息，如在使用评价、晒单等功能分享商品相关信息时上传含有儿童个人信息的图片、视频或文字，我们会提示相关用户谨慎选择分享的信息内容，您作为监护人亦应当正确履行监护职责，保护儿童个人信息安全。
4、在儿童使用小蜜蜂智慧生活管家端服务过程中，我们可能还会收集和使用其他儿童个人信息，具体请查阅《小蜜蜂智慧生活管家端隐私政策》“我们如何收集和使用个人信息”章节进行详细了解。如我们需要超出上述范围收集和使用儿童个人信息，我们将再次征得监护人的同意。
5、有关儿童个人敏感信息的提示
由儿童或监护人提供或我们收集的儿童信息中，可能包含儿童的个人敏感信息，例如身份证件号码、个人生物识别信息、征信信息、行踪轨迹、住宿信息、健康生理信息、交易信息。请监护人和儿童应谨慎并留意儿童个人敏感信息，监护人同意儿童相关个人敏感信息我们可以按本规则所述的目的和方式来处理。
 
三、我们共享、转让、公开披露儿童个人信息的规则
对于儿童个人信息，我们仅在《小蜜蜂智慧生活管家端隐私政策》所述的目的和范围内或依照法律要求进行共享，并遵循正当必要、知情同意、目的明确、安全保障、依法利用的原则转让、公开披露儿童个人信息，您可以查阅《小蜜蜂智慧生活管家端隐私政策》“我们如何共享、转让、公开披露您的个人信息”章节了解更多细节。
 
四、您及/或儿童对儿童个人信息的管理规则
(一) 查询和访问儿童个人信息
您或儿童可以在小蜜蜂智慧生活管家端PC端“个人中心”及App端“个人”页面查询和访问儿童的相关个人信息，例如：账户信息、地址管理。
 
(二) 更正/修改儿童个人信息
您可以在小蜜蜂智慧生活管家端PC端“个人中心”及App端“个人”页面更正/修改儿童的相关个人信息，或您可以联系我们解决，我们会在经对您的身份进行验证，且不影响信息的客观性和准确性的情况下进行更正/修改。但出于安全性和身份识别的考虑，您可能无法修改注册时提交的某些初始注册信息。
同时，如您或儿童发现我们收集、存储、使用、披露的儿童个人信息有错误且无法通过前述途径进行更正的，可以联系我们更正，我们会在完成身份验证和核实问题后及时采取措施予以更正。
 
(三) 删除儿童个人信息
您可以通过前述“（二）更正/修改儿童个人信息”中列明的途径自主删除您的部分个人信息。在部分信息删除时，我们可能会要求您进行身份验证，以保障信息安全。
在以下情形下，您或儿童无法通过前述途径删除儿童个人信息的，可以直接向我们提出删除儿童个人信息的请求，我们会在完成身份验证和核实问题后及时采取措施予以删除，包括：
1、我们违反法律法规的规定或者与监护人和儿童的约定收集、存储、使用、转移、披露儿童个人信息的；
2、超出目的范围或者必要期限收集、存储、使用、转移、披露儿童个人信息的；
3、监护人撤回同意的；
4、监护人或儿童通过注销等方式终止使用小蜜蜂智慧生活管家端服务的；
5、法律法规等规定的其他情形。
 
五、我们存储和保护儿童个人信息的规则
我们依照法律法规的规定，仅将儿童个人信息存储于中华人民共和国境内。我们仅在《小蜜蜂智慧生活管家端隐私政策》所述目的所必需的最短时限内存储儿童个人信息，除非法律法规或监管机关另有要求。当儿童个人信息超出我们所保存的期限后，我们会对儿童个人信息进行删除或匿名化处理。
我们采用了符合行业标准的安全技术措施及配套的管理体系等多层面保护措施来保护儿童个人信息；同时，我们遵循最小授权原则，对工作人员设定了严格的信息访问权限，控制儿童个人信息知悉范围；我们也采取了必要技术措施，避免违法复制、下载儿童个人信息。如您希望了解更多，请您查阅《小蜜蜂智慧生活管家端隐私政策》“我们如何保护您的个人信息安全”章节。
 
六、如何联系我们
我们设有个人信息保护专职部门并指定了专门的儿童个人信息保护负责人，将严格按照本规则保护儿童个人信息。如监护人和儿童有关于网络信息安全的投诉和举报，或对本规则、儿童个人信息保护措施等相关事宜有任何问题、意见或建议，请随时与我们联系，可以发送邮件至kaidalai@163.com或写信至以下地址：深圳市龙岗区横岗街道沙荷路40-11号；邮编：518000。
一般情况下，我们将在收到问题、意见或建议，并验证监护人和/或儿童身份后的十五个工作日内予以回复。如监护人或儿童不满意我们的回复，还可以向消费者权益保护部门投诉或向有管辖权的法院提起诉讼。
 
 
附件二：第三方SDK类服务商目录
为保障小蜜蜂智慧生活管家端服务的相关功能的实现与应用安全稳定的运行，我们可能会接入由第三方提供的软件开发包（SDK）或类似应用程序实现相关目的。我们会对合作方获取信息的软件工具开发包（SDK）或类似应用程序进行严格的安全评估，以保护您的个人信息安全。以下是我们接入的主要的第三方服务商的信息：
 
小米推送SDK
使用目的：推送消息
数据类型：设备标识信息
官网链接：https://dev.mi.com/console/appservice/push.html
 
华为推送SDK
使用目的：推送消息
数据类型：设备标识信息
官网链接： https://developer.huawei.com/consumer/cn/service/hms/pushservice.html
 
VIVO推送SDK
使用目的：推送消息
数据类型：设备标识信息
官网链接：https://dev.vivo.com.cn/documentcenter/doc/233
 
OPPO推送SDK
使用目的：推送消息
数据类型：设备标识信息
官网链接：https://open.oppomobile.com/wiki/doctid=10196
 
Glide SDK
使用目的：在线加载图片
数据类型：网络状态信息
官网链接：https://github.com/ansen666/GlideTest
 
微信SDK
使用目的：用于微信账号登录小蜜蜂智慧生活管家端服务、帮助用户分享内容至微信客户端
数据类型：设备标识信息
官网链接：https://open.weixin.qq.com/
  
QQ SDK
使用目的：用于QQ账号小蜜蜂智慧生活管家端服务、帮助用户分享内容至QQ客户端
数据类型：设备标识信息
官网链接：https://open.tencent.com/
 
微信支付
使用目的：帮助用户在应用内使用微信支付
数据类型：设备标识信息
官网链接：https://pay.weixin.qq.com/
 
支付宝
使用目的：帮助用户在应用内使用支付宝支付
数据类型：设备标识信息
官网链接：https://docs.open.alipay.com/
 
银联手机支付控件SDK
使用目的：帮助用户在应用内使用云闪付支付
数据类型：设备标识信息
官网链接：https://open.unionpay.com/tjweb/index
    
高德定位SDK
使用目的：定位以及地图展示及poi查询
数据类型：外部存储状态，最近一次地理位置信息，持续定位，网络类型，网络服务运营商，IMEI，MAC地址，WIFI信息
官网链接：https://lbs.amap.com/
隐私政策链接：https://lbs.amap.com/home/privacy/''',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
