// Flutter imports:
// Project imports:
import 'package:aku_community_manager/ui/widgets/common/aku_scaffold.dart';
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
本隐私信息保护政策生效日期：2020年9月
本隐私信息保护政策版本：2020V2
欢迎您使用“小蜜蜂智慧小区”APP软件及服务！ 为使用“小蜜蜂智慧小区”APP软件（以下简称“许可软件”）及服务，您应当阅读并遵守《用户协议及隐私政策》（以下简称“本协议”）。请您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款，以及开通或使用某项服务的单独协议，并选择接受或不接受。限制、免责条款可能以加粗形式提示您注意。 一旦您下载安装使用许可软件，即表示您同意接受本协议所有条款和条件的约束。如您不同意本协议条款和条件，请勿使用许可软件，并请销毁所有许可软件副本。 请您注意，本协议不适用于您通过我们的产品/服务而接入的其他第三方产品/服务(“其他第三方”，包括您的交易相对方、任何第三方网站以及第三方服务提供者等)，具体规定请参照该第三方用户协议及隐私政策或类似声明。
第一部分 用户协议
一、协议的范围
1.1协议适用主体范围
本协议是您与深圳市凯达来科技有限公司（以下称凯达来）之间关于您下载、安装、使用、登录许可软件，以及使用许可软件提供的服务所订立的协议。
二、关于本服务
2.1本服务内容
本服务内容是指凯达来向用户提供的跨平台的生活助手（“小蜜蜂智慧小区”APP软件），同时提供由物业提供的基础服务、增值物业服务，周边商圈优惠信息，在线支付，政府提供的公共资源等服务内容。
2.2本服务形式
2.2.1 您使用本服务需要下载小蜜蜂智慧小区客户端软件，对于这些软件，凯达来给予您一项个人的、不可转让及非排他性的许可。
2.2.2 本服务中小蜜蜂智慧小区客户端软件提供包括但不限于iOS、android等多个应用版本，用户必须选择与所安装手机相匹配的软件版本。
2.3许可的范围
2.3.1 凯达来给予您一项个人的、不可转让及非排他性的许可，以使用许可软件。您可以为非商业目的在终端设备上安装、使用、显示、运行许可软件。
2.3.2 本条及本协议其他条款未明示授权的其他一切权利仍由凯达来保留，您在行使这些权利时须另外取得凯达来的书面许可。凯达来如果未行使前述任何权利，并不构成对该权利的放弃。
三、软件的获取
3.1 您可以直接从凯达来的网站上获取许可软件，也可以从得到凯达来授权的第三方获取。
3.2 如果您从未经凯达来授权的第三方获取许可软件或与许可软件名称相同的安装程序，凯达来无法保证该软件能够正常使用，并对因此给您造成的损失不予负责。
四、软件的安装与卸载
4.1 凯达来可能为不同的终端设备开发了不同的软件版本，您应当根据实际情况选择下载合适的版本进行安装。
4.2 下载安装程序后，您需要按照该程序提示的步骤正确安装。
4.3 为提供更加优质、安全的服务，在许可软件安装时凯达来可能推荐您安装其他软件，您可以选择安装或不安装。
4.4 如果您不再需要使用许可软件或者需要安装新版软件，可以自行卸载。如果您愿意帮助凯达来改进产品服务，请告知卸载的原因。
五、软件的更新
5.1 为了改善用户体验、完善服务内容，凯达来将不断努力开发新的服务，并为您不时提供软件更新（这些更新可能会采取软件替换、修改、功能强化、版本升级等形式）。
5.2 为了保证许可软件及服务的安全性和功能的一致性，凯达来有权不经向您特别通知而对软件进行更新，或者对软件的部分功能效果进行改变或限制。
5.3 许可软件新版本发布后，旧版本的软件可能无法使用。凯达来不保证旧版许可软件继续可用及相应的客户服务，请您随时核对并下载最新版本。
六、用户个人信息保护
6.1 保护用户个人信息是凯达来的一项基本原则，凯达来将会采取合理的措施保护用户的个人信息。除法律法规规定的情形外，未经用户许可凯达来不会向第三方公开、透露用户个人信息。凯达来对相关信息采用专业加密存储与传输方式，保障用户个人信息的安全。
6.2 您在注册账号或使用本服务的过程中，可能需要提供一些必要的信息，例如：为向您提供账号注册服务或进行用户身份识别，需要您填写手机号码、住址信息等。若国家法律法规或政策有特殊规定的，您需要提供真实的身份信息。若您提供的信息不完整，则无法使用本服务或在使用过程中受到限制。
6.3 一般情况下，您可随时浏览、修改自己提交的信息，但出于安全性和身份识别（如服务上门）的考虑，您最好不要修改注册时提供的住址信息及其他验证信息。
6.4 凯达来将运用各种安全技术和程序建立完善的管理制度来保护您的个人信息，以免遭受未经授权的访问、使用或披露。
6.5 未经您的同意，凯达来不会向凯达来以外的任何公司、组织和个人披露您的个人信息，但法律法规另有规定的除外。
七、主权利义务条款
7.1 账号使用规范
7.1.1 您在使用本服务前需要注册一个唯一的小蜜蜂智慧小区账号。注册账号时请按照软件的提示进行注册，为使填写的信息能尽快被核实通过，请填写您真实的个人及住址信息。 7.1.2 小蜜蜂智慧小区账号的所有权归凯达来所有，用户完成申请注册手续后，仅获得小蜜蜂智慧小区账号的使用权，且该使用权仅属于初始申请注册人，同时，初始申请注册人不得赠与、借用、租用、转让或售卖小蜜蜂智慧小区账号或者以其他方式许可非初始申请注册人使用小蜜蜂智慧小区账号。非初始申请注册人不得通过受赠、继承、承租、受让或者其他任何方式使用小蜜蜂智慧小区账号。 7.1.3 用户有责任妥善保管注册账户信息及账户密码的安全，用户需要对注册账户以及密码下的行为承担法律责任。用户同意在任何情况下不向他人透露账户及密码信息。在您怀疑他人在使用您的账号时，您应立即通知凯达来公司。
7.2 用户注意事项
7.2.1 您理解并同意：为了向您提供有效的服务，许可软件会利用您移动通讯终端的处理器和带宽等资源。许可软件使用过程中可能产生数据流量的费用，用户需自行向运营商了解相关资费信息，并自行承担相关费用。
7.2.2 您理解并同意凯达来将会尽其商业上的合理努力保障您在许可软件及服务中的数据存储安全，但是，凯达来并不能就此提供完全保证，包括但不限于以下情形：
7.2.2.1 凯达来不对您在许可软件及服务中相关数据的删除或储存失败负责；
7.2.2.2 凯达来有权根据实际情况自行决定单个用户在许可软件及服务中数据的最长储存期限，并在服务器上为其分配数据最大存储空间等。您可根据自己的需要自行备份许可软件及服务中的相关数据；
7.2.2.3 如果您停止使用许可软件及服务或服务被终止或取消，凯达来可以从服务器上永久地删除您的数据。服务停止、终止或取消后，凯达来没有义务向您返还任何数据。
7.2.3 用户在使用许可软件及服务时，须自行承担如下来自凯达来不可掌控的风险内容，包括但不限于：
7.2.3.1 由于不可抗拒因素可能引起的个人信息丢失、泄漏等风险；
7.2.3.2 用户必须选择与所安装手机相匹配的软件版本，否则，由于软件与手机型号不相匹配所导致的任何问题或损害，均由用户自行承担；
7.2.3.3 用户在使用许可软件访问第三方网站时，因第三方网站及相关内容所可能导致的风险，由用户自行承担；
7.2.3.4 用户发布的内容被他人转发、分享，因此等传播可能带来的风险和责任；
7.2.3.5 由于无线网络信号不稳定、无线网络带宽小等原因，所引起的小蜜蜂智慧小区登录失败、资料同步不完整、页面打开速度慢等风险。
7.2.4 为了提高园区订单（包括但不限于维修、投诉建议、咨询等）的流转速度，避免造成积压，同时也为了能够给您提供更高效的服务，在订单处理完成后请您及时进行确认并对我们的服务做出评价，若您因故未能在14日内进行订单确认，则系统会默认服务已经完成。
7.2.5 代表用户身份的二维码仅供本人用于在本系统中证明身份;
7.3 第三方产品和服务
7.3.1 您在使用许可软件第三方提供的产品或服务时，除遵守本协议约定外，还应遵守第三方的用户协议。凯达来和第三方对可能出现的纠纷在法律规定和约定的范围内各自承担责任。
八、用户行为规范
8.1 信息内容规范
8.1.1 您理解并同意，凯达来一直致力于为用户提供文明健康、规范有序的网络环境，您不得利用小蜜蜂智慧小区账号或许可软件及服务制作、复制、发布、传播如下干扰许可软件正常运营，以及侵犯其他用户或第三方合法权益的内容，包括但不限于：
8.1.1.1 发布、传送、传播、储存违反国家法律、危害国家安全统一、社会稳定、公序良俗、社会公德以及侮辱、诽谤、淫秽或含有任何性或性暗示的、暴力的内容；
8.1.1.2 发布、传送、传播、储存侵害他人名誉权、肖像权、知识产权、商业秘密等合法权利的内容；
8.1.1.3 涉及他人隐私、个人信息或资料的；
8.1.1.4 发表、传送、传播骚扰、广告信息及垃圾信息；
8.1.1.5 其他违反法律法规、政策及公序良俗、社会公德或干扰许可软件正常运营和侵犯其他用户或第三方合法权益内容的信息。
8.2 软件使用规范
除非法律允许或凯达来书面许可，您使用许可软件过程中不得从事下列行为：
8.2.1 删除许可软件及其副本上关于著作权的信息；
8.2.2 对许可软件进行反向工程、反向汇编、反向编译，或者以其他方式尝试发现许可软件的源代码；
8.2.3 对凯达来拥有知识产权的内容进行使用、出租、出借、复制、修改、链接、转载、汇编、发表、出版、建立镜像站点等；
8.2.4 对许可软件或者许可软件运行过程中释放到任何终端内存中的数据、软件运行过程中客户端与服务器端的交互数据，以及许可软件运行所必需的系统数据，进行复制、修改、增加、删除、挂接运行或创作任何衍生作品，形式包括但不限于使用插件、外挂或非凯达来经授权的第三方工具/服务接入许可软件和相关系统；
8.2.5 通过修改或伪造软件运行中的指令、数据，增加、删减、变动软件的功能或运行效果，或者将用于上述用途的软件、方法进行运营或向公众传播，无论这些行为是否为商业目的；
8.2.6 通过非凯达来开发、授权的第三方软件、插件、外挂、系统，登录或使用小蜜蜂智慧小区软件及服务，或制作、发布、传播上述工具；
8.2.7 自行或者授权他人、第三方软件对许可软件及其组件、模块、数据进行干扰；
8.2.8 其他未经凯达来明示授权的行为。
8.3 服务运营规范
除非法律允许或凯达来书面许可，您使用本服务过程中不得从事下列行为：
8.3.1 提交、发布虚假信息，或冒充、利用他人名义的；
8.3.2 诱导其他用户点击链接页面或分享信息的；
8.3.3 虚构事实、隐瞒真相以误导、欺骗他人的；
8.3.4 侵害他人名誉权、肖像权、知识产权、商业秘密等合法权利的；
8.3.5 未经凯达来书面许可利用小蜜蜂智慧小区账号和任何功能，以及第三方运营平台进行推广或互相推广的；
8.3.6 利用小蜜蜂智慧小区账号或许可软件及服务从事任何违法犯罪活动的；
8.3.7 制作、发布与以上行为相关的方法、工具，或对此类方法、工具进行运营或传播，无论这些行为是否为商业目的；
8.3.8 其他违反法律法规规定、侵犯其他用户合法权益、干扰产品正常运营或凯达来未明示授权的行为。
8.4 对自己行为负责
您充分了解并同意，您必须为自己注册账号下的一切行为负责，包括您所发表的任何内容以及由此产生的任何后果。您应对本服务中的内容自行加以判断，并承担因使用内容而引起的所有风险，包括因对内容的正确性、完整性或实用性的依赖而产生的风险。凯达来无法且不会对因前述风险而导致的任何损失或损害承担责任。
8.5 违约处理
8.5.1 如果凯达来发现或收到他人举报或投诉用户违反本协议约定的，凯达来有权不经通知随时对相关内容进行删除，并视行为情节对违规账号处以包括但不限于警告、限制或禁止使用全部或部分功能、账号封禁直至注销的处罚，并公告处理结果。
8.5.2 您理解并同意，凯达来有权依合理判断对违反有关法律法规或本协议规定的行为进行处罚，对违法违规的任何用户采取适当的法律行动，并依据法律法规保存有关信息向有关部门报告等，用户应独自承担由此而产生的一切法律责任。
8.5.3 您理解并同意，因您违反本协议或相关服务条款的规定，导致或产生第三方主张的任何索赔、要求或损失，您应当独立承担责任；凯达来因此遭受损失的，您也应当一并赔偿。
九、知识产权声明
9.1 凯达来是许可软件的知识产权权利人。许可软件的一切著作权、商标权、专利权、商业秘密等知识产权，以及与许可软件相关的所有信息内容（包括但不限于文字、图片、音频、视频、图表、界面设计、版面框架、有关数据或电子文档等）均受中华人民共和国法律法规和相应的国际条约保护，凯达来享有上述知识产权，但相关权利人依照法律规定应享有的权利除外。 9.2 未经凯达来或相关权利人书面同意，您不得为任何商业或非商业目的自行或许可任何第三方实施、利用、转让上述知识产权。
十、终端安全责任
10.1 您理解并同意，许可软件同大多数互联网软件一样，可能会受多种因素影响，包括但不限于用户原因、网络服务质量、社会环境等；也可能会受各种安全问题的侵扰，包括但不限于他人非法利用用户资料，进行现实中的骚扰；用户下载安装的其他软件或访问的其他网站中可能含有病毒、木马程序或其他恶意程序，威胁您的终端设备信息和数据安全，继而影响许可软件的正常使用等。因此，您应加强信息安全及个人信息的保护意识，注意密码保护，以免遭受损失。 10.2 您不得制作、发布、使用、传播用于窃取小蜜蜂智慧小区账号及他人个人信息、财产的恶意程序。 10.3 维护软件安全与正常使用是凯达来和您的共同责任，凯达来将按照行业标准合理审慎地采取必要技术措施保护您的终端设备信息和数据安全，但是您承认和同意凯达来并不能就此提供完全保证。 10.4 在任何情况下，您不应轻信借款、索要密码或其他涉及财产的网络信息。涉及财产操作的，请一定先核实对方身份，并请经常留意凯达来有关防范诈骗犯罪的提示。 10.5 若其他用户发布有攻击性的内容时，您可以通过提交举报或屏蔽的方式进行设置。也可在设置中取消对其用户的屏蔽。
十一、第三方软件或技术
11.1 许可软件可能会使用第三方软件或技术（包括许可软件可能使用的开源代码和公共领域代码等，下同），这种使用已经获得合法授权。 11.2 许可软件如果使用了第三方的软件或技术，凯达来将按照相关法规或约定，对相关的协议或其他文件，可能通过本协议附件、在许可软件安装包特定文件夹中打包等形式进行展示，它们可能会以“软件使用许可协议”、“授权协议”、“开源代码许可证”或其他形式来表达。前述通过各种形式展现的相关协议或其他文件，均是本协议不可分割的组成部分，与本协议具有同等的法律效力，您应当遵守这些要求。如果您没有遵守这些要求，该第三方或者国家机关可能会对您提起诉讼、罚款或采取其他制裁措施，并要求凯达来给予协助，您应当自行承担法律责任。 11.3 如因许可软件使用的第三方软件或技术引发的任何纠纷，应由该第三方负责解决，凯达来不承担任何责任。凯达来不对第三方软件或技术提供客服支持，若您需要获取支持，请与第三方联系。
十二、账号注销
12.1您可以通过以下方式注销您的账号： 登入小蜜蜂智慧小区管家APP，通过“我的-设置-账号管理-注销账号”来注销账号。在您注销账号前，请确保你在小蜜蜂智慧小区管家APP的账号同时满足以下条件，否则你注销账号的申请可能会被拒绝： （1）账户在小蜜蜂智慧小区管家APP中无资产、无欠款； （2）账户内无未完成的订单、已提供服务单未支付的订单/服务； 在您主动注销账户之后，我们将停止为您提供产品或服务，我们将删除您的个人信息，使其保持不可被检索、访问的状态，或对使其进行匿名化处理。 

12.2若想要删除部分您所填写的信息，如实名认证中（身份证号、身份证图像），请通过0574-87760023与我们联系。
隐私政策
为用户提供更好、更优、更个性化的服务是我们坚持不懈的追求，也希望通过我们提供的服务可以更方便您的生活。依据法律的规定，我们将在特定情形下收集、使用、保存和披露您的个人信息。以下条款描述了我们如何收集、使用、保存和披露您的个人信息。 本政策将帮助您了解以下内容，请根据以下目录阅读相应章节：
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
根据国家APP实名制管理规定，我们保存、使用和披露个人信息是为了通过创建账户、识别用户、回应查询等方式来为您提供服务。在得到您的许可之后，“小蜜蜂智慧小区管家APP”会向您提供基础物业服务、便民生活服务、业主自治及社交服务、社区生活相关的服务、发送资讯、调查、优惠和促销信息以及其他宣传材料，以为您提供更好的服务。物业基础服务包括：报修报事、生活缴费、蓝牙开门、访客通行、鹰眼服务、投诉表扬、常用电话、快递服务、装修管家、活动投票、问卷调查、咨询建议、资讯服务、幸福里、快递代寄、车位库房等服务。
1.2 信息收集的主要范围及方式 
为实现“小蜜蜂智慧小区管家APP”之服务目的，“小蜜蜂智慧小区管家APP”会通过技术手段收集您的个人信息，通过技术手段所收集的个人信息仅限于您的姓名、出生日期、身份证号码、联系方式、住址等使用“小蜜蜂智慧小区管家APP”所必需的信息。此外，为确保园区安全，使用蓝牙开门及鹰眼服务，需根据审核规范，上传您的有效身份证信息。 “小蜜蜂智慧小区管家APP”支持多类操作系统的使用：在您通过各种手机操作系统使用“小蜜蜂智慧小区管家APP”的过程中，“小蜜蜂智慧小区管家APP”所收集的信息仅限于您同意使用“小蜜蜂智慧小区管家APP”基本服务所必需的信息。 我们会遵循正当、合法、必要的原则，出于本政策所述的目的收集和使用您的个人信息。您需要授权我们收集和使用个人信息的场景如下所示： 
服务项 目的及收集范围 
报修报事 
如您使用报修报事功能时，我们可能收集您的姓名，房号，设备信息、报修时间 
投诉表扬/服务者评价 
如您使用投诉表扬功能时，我们可能会收集您的姓名、联系方式、房号、下单时间。如您使用服务者评价功能时，我们会收集您所上传或下载的信息，这类信息包括搜索关键字、发布和回复信息。 
缴费功能 
如您使用缴费功能时，我们可能收集您的姓名、联系地址、联系方式、支付渠道、支付账号、支付网关号、订单信息、交易和消费信息、获奖信息、虚拟财产信息。这些信息属于个人敏感信息，在获得您的明示同意后，我们将使用加密技术收集，此类信息的收集范围我们会在前述活动及其规则中向您明示。 
蓝牙开门 
如您使用蓝牙开门功能时，我们可能收集您的姓名、房号、使用时间、使用次数、开门状态信息。 
访客通行 
如您使用访客通行功能时，我们可能会收集您的姓名、房号信息以及访客姓名、访客手机号、访客身份证号码、访问时间、访问人数、访客类型、访客车牌、访客目的、访客状态信息。 
鹰眼服务 
如您使用鹰眼服务功能时，我们可能会收集您的姓名、联系方式、所在园区、房号、使用时间信息，并在使用服务前，按审核要求进行实名认证。 
投诉表扬 
如您使用投诉表扬功能时，我们可能会收集您的姓名、联系方式、房号、下单时间。 
常用电话 
如您使用常用电话功能时，我们可能向您请求收集相关通讯录信息（包括联系人姓名及对应的联系方式），通讯录信息属于个人敏感信息，我们将使用加密技术收集，用于向您推荐通信录中的好友。您可以通过关闭设备通讯录权限停止我们收集前述通讯录信息，一旦您取消了授权，我们将不再继续收集。但是，您停止授权的行为不会影响我们此前基于您的授权所进行的信息收集及使用。 
快递记录/快递代寄 
如您使用快递服务功能时，我们可能收集您的收件人姓名、联系方式、联系地址、收件人类型、快递公司、快递单号、来源、录入时间、领取时间信息或订单信息。 
装修管家 
如您使用装修管家功能时，我们可能会收集您的姓名、联系方式、房号信息。 
共享停车 
如您使用共享停车功能时，我们可能会收集您的姓名、联系方式、车牌号、使用次数、使用时间、车位信息。 
资讯服务 
如您使用资讯服务功能时，我们可能会收集您的姓名、查看时间信息。 
问卷调查/活动投票 
如您使用问卷调查功能时，我们可能会收集您的姓名、联系方式、所在园区、房号、调查结果或投票结果信息。 
咨询建议 
如您使用咨询建议功能时，我们会收集您所上传或下载的信息，这类信息包括搜索关键字、发布和回复信息。 
友邻社交 
如您使用友邻社交功能时，我们会收集您姓名、联系方式、房号、发布时间、发布内容、车位库房信息。
业主自治 
如您使用业主自治功能时，我们会收集您的姓名、联系方式、房号、发布时间、发布内容信息。 
中信ETC 
如您使用中信ETC功能时，我们会收集您的姓名、联系方式、车牌号、交易和消费信息、订单信息、虚拟财产信息。 
生活商圈 
如您使用生活商圈功能时，我们可能会收集您的姓名、联系地址、联系方式、支付渠道、支付账号、支付网关号、订单信息、交易和消费信息、获奖信息、虚拟财产信息。这些信息属于个人敏感信息，在获得您的明示同意后，我们将使用加密技术收集，此类信息的收集范围我们会在前述活动及其规则中向您明示。 园区健康 如您使用生活健康功能时，我们可能会收集您的姓名、联系方式、园区信息、房号、使用时间信息。 
服务者评价 
如您使用服务者评价功能时，我们会收集您所上传或下载的信息，这类信息包括搜索关键字、发布和回复信息。
开门码 
如您使用开门码功能时,我们会收集您的姓名、联系方式、住址信息。
您需要授权访问及使用权限的功能场景如下所示： 
业务场景 场景说明 访问及使用权限 实名认证 需要扫码证件或者选择相册图片 使用相机设备权限、访问外部存储权、写外部存储权限 邻里发帖 邻里发帖需要拍照或选择相册图片 使用相机设备权限、访问外部存储权限、写外部存储权限 更换头像 更换头像需要拍照或选择相册图片 使用相机设备权限、访问外部存储权限、写外部存储权限 活动添加参与人 参与人头像可以编辑，需要拍照或选择相册图片 使用相机设备权限、访问外部存储权限、写外部存储权限 首页扫一扫 首页扫一扫需要调用设备摄像头二维码或者从相册里选择图片 使用相机设备权限、访问外部存储权限、写外部存储权限 管家页面查一查功能 扫一扫需要调用设备摄像头二维码或者从相册里选择图片 使用相机设备权限、访问外部存储权限、写外部存储权限 订单评价 订单评价可以添加图片，需要拍照或选择相册图片 使用相机设备权限、访问外部存储权限、写外部存储权限 工单报事 报修报事、投诉表扬可以添加图片 使用相机设备权限、访问外部存储权限、写外部存储权限 物品出门 填写物品时可以添加图片，需要拍照或选择相册图片 使用相机设备权限、访问外部存储权限、写外部存储权限 语音管家报事 语音管家页面，输入咨询内容后，填写内容，可以选择图片，需要拍照或选择相册图片 使用相机设备权限、访问外部存储权限、写外部存储权限 商家和商品详情页 拨打商家和客服电话 拨打电话权限 电话物业 物业管家首页，点击“物业电话” 拨打电话权限 常用电话 拨打电话 拨打电话权限 语音管家 语音报事，需要语音识别 访问录音权限 保存图片 查看图片，点击保存图片 访问外部存储权限、写外部存储权限 选择项目 注册时选择项目，需要定位权限 访问位置权限 选择地址 我的地址里面添加或编辑地址 访问位置权限 蓝牙开门 蓝牙开门需要定位当前蓝牙点位置 访问位置权限
1.3 信息推送及服务 
您提供的信息，“小蜜蜂智慧小区管家APP”将最大限度尽合理之商业义务进行保密。经过您的同意，“小蜜蜂智慧小区管家APP”将会向您提供电子商务、生活服务、资讯、版本升级等服务。 为确保您的服务体验，在您使用平台功能时，根据服务状态，将为您发送快递、物业缴费、访客、物业工单、巡查、物品借用、活动报名、红包、拼团、商品订单、售后工单、发票状态信息，以及对快递服务的短信通知服务。
1.4 收集信息的其他方式 
我们将采用其他方式（例如：信息下载、购买产品或服务、用户支持、反馈以及调查表）来收集您的个人信息。如果您将个人信息填写在其他开放的平台上，其他用户可能会获知您的信息。
1.5 收集的其他信息 
为了便于您使用“小蜜蜂智慧小区管家APP”软件，我们的服务器将会收集关于您的移动通讯设备的信息，例如型号、设备ID、互联网协议地址、您访问的时间和地点、路由数据包、信息发送人和接收数据（但不是信息本身），以及其他类似的特征记录。
2.个人信息的使用 
2.1 您的个人信息将不会用于本政策载明的目的之外的其他目的，双方另有约定的除外。 
2.2 匿名汇总统计数据不是“小蜜蜂智慧小区管家APP”所定义的个人用户信息，我们将为多种目的，包括但不限于分析和使用模式的报告等，来保存和使用此类信息。用户使用本APP的，视为已授权“小蜜蜂智慧小区管家APP”提供方以任何目的自身或许可第三方使用和披露匿名汇总统计数据的权利。
3.个人信息的披露 
3.1 除非本政策载明的有限披露，我们会妥善保存您的个人信息并不会泄露客户信息。 
3.2 您于此授权，以下情形下，我们将会向第三方披露您的个人信息而无需通过您的同意： 如果我们披露这些信息是用来识别、联系或向可能对我们的权利或财产、网站用户或者其他任何人（包括其他任何人的权利和财产）造成损害之行为提起诉讼之必要； 法律调查之必要； 此类披露是法律规定或应向我们送达的传票或其他执法部门发出的令状之必要。
4.个人信息的共享 
您于此授权，我们将在必要时，向合作的第三方提供您的个人信息，以便为您提供某些服务或代表我们履行职能，我们仅会处于本隐私条款声明的合法、正当、必要、特定、明确的目的共享您的信息，合作的第三方只能接触到其履行职责所需信息，且不得将此信息用于其他任何目的，我们不允许合作的第三方伴进行转委托。关于合作的第三方的信息及提供的服务、场景应用见下： 第三方名称 场景描述 个人信息类型 个人信息字段 深圳市凯达来科技有限公司 app数据统计 个人常用设备信息 设备信息、网络信息
5.安全 
对我们来说，个人信息的安全非常重要。我们将尽可能保障您的个人信息安全，并实施合理的措施限制非授权访问、使用或者披露您的个人信息。尽管采取上述措施，但是您应当知晓“小蜜蜂智慧小区管家APP”不能完全避免与个人信息相关的安全危险。 双方同意，如发生下述情形，“小蜜蜂生活”APP不承担任何法律责任： ①依据法律规定或相关政府部门的要求提供您的个人信息； ②由于您的使用不当而导致任何个人信息的泄露； ③任何由于黑客攻击，电脑病毒的侵入，非法内容信息、骚扰信息的屏蔽，政府管制以及其他任何网络、技术、通信线路、信息安全管理措施等非“小蜜蜂生活”APP原因造成的服务中断、受阻等不能满足用户要求的情形； 您应当协助我们以保护您的个人信息安全。例如，不要泄露您的个人密码。
6.第三方网站 
6.1 当您点击“小蜜蜂智慧小区管家APP”链接的其他网站时，您已经离开我们的网站并访问其他网站，其他网站可能会收集您的个人信息或匿名数据，因此，我们无法控制、检查或者回应此类网站和网站内容。 
6.2 本政策不适用于在您点击链接后的外部网站收集数据的行为。

7.未成年人保护 
“小蜜蜂智慧小区管家APP”非常重视对未成年人信息的保护。根据相关法律法规的规定，若您是18周岁以下的未成年人，在使用本APP服务前，应事先取得您家长或法定监护人的书面同意。“小蜜蜂智慧小区管家APP”不会使用未成年人的个人信息，也不会向任何第三方透露可识别的信息。若您是未成年人的监护人，当您对您所监护的未成年人的个人信息有相关疑问时，请通过第8节中的联系方式与我们联系。

8.联系我们 
当您有其他的投诉、建议、未成年人个人信息相关问题时，您可以将您的问题发送至xin@akuhome.com 。我们将尽快审核所涉问题，并在验证您的用户身份后的十五天内予以回复。

9.我们如何收集和使用您的个人信息
9.1. 小蜜蜂智慧小区依据法律法规以及遵循正当、合法、必要的原则而收集和使用您在使用服务过程中主动提供或由于产品和/或服务需要而产生的个人信息。如果我们欲将您的个人信息用于本隐私政策未载明的其它用途，或基于特定目的将收集而来的信息用于其他目的，我们会及时以合理的方式向您告知，并在使用前再次征得您的同意。
9.2. 我们收集和使用的您的个人信息类型包括两种：第一种：我们产品与/或服务的核心业务功能所必需的信息：此类信息为产品与/或服务正常运行的必备信息，您须授权我们收集。如您拒绝提供，您将无法正常使用我们的产品与/或服务；第二种：附加业务功能可能需要收集的信息：此信息为非核心业务功能所需的信息，您可以选择是否授权我们收集。如您拒绝提供，将导致附加业务功能无法实现或无法达到我们拟达到的效果，但不影响您对核心业务功能的正常使用。
9.3. 我们需要特别提醒您的是：由于我们的产品和服务较多，为您提供的内容也不同，因此核心业务功能（包括其收集的您的个人信息类型）也会因产品/服务的内容不同而有所区别，具体以产品/服务实际提供为准。除此之外，您理解并同意，我们希望提供给您的产品和服务是完善的，所以我们会不断改进我们的产品和服务，包括技术，这意味着我们可能会经常推出新的业务功能，可能需要收集新的个人信息或变更个人信息使用目的或方式。如果某一需要收集您的个人信息的功能或产品/服务未能在本隐私政策中予以说明的，我们会通过更新本政策、页面提示、弹窗、网站公告等方式另行向您说明该信息收集的目的、内容、使用方式和范围，并为您提供自主选择同意的方式，且在征得您明示同意后收集。在此过程中，如果您对相关事宜有任何疑惑的，可以通过提供的方式联系我们，我们会尽快为您作出解答。
9.4. 通常情况下，我们会在以下场景中收集和使用您的个人信息：
9.4.1 账号注册
（1） 您注册并登录小蜜蜂智慧小区账号时，需要按照我们的指引完成一系列注册程序，在此过程中，您需要向我们提供以下信息：账号昵称、手机号码（个人敏感信息，用于接受验证码匹配个人身份）。您只有提供真实准确的上述信息，才能成功注册小蜜蜂智慧小区账号并使用产品和/或服务的核心功能。如果您选择不提供上述为实现小蜜蜂智慧小区核心产品功能的必备信息，或将导致我们无法为您提供该核心产品功能。
（2） 同时，您需理解，手机号码和验证码匹配结果属于您的个人敏感信息，我们收集该类信息是基于法律法规的相关要求，如您拒绝提供可能导致您无法注册账号并使用相关产品功能，请您谨慎考虑后再选择是否提供。
9.4.2 主要功能
（1） 您登录小蜜蜂智慧小区账号时，可能会使用到手机中的“巡更”或“一键报警”功能（均包含需要手机定位权限，前者由于业务需要，需要能够在巡更过程中自拍或上传照片）。在此过程中，您需要打开手机对应的功能并向我们提供以下信息：手机位置信息、手机摄像头、文件照片。如果您选择不提供上述为实现小蜜蜂智慧小区核心产品功能的必备信息，或将导致我们无法为您提供该核心产品功能。


10.您管理个人信息的权利
我们理解您对个人信息的关注，并尽全力确保您对于自己个人信息访问、更正、删除以及撤回授权的权利，以使您拥有充分的能力保障您的隐私和安全。您的权利包括：
10.1. 您有权访问您的个人信息
您可以按照我们提供的产品和服务的相关说明（或设置），对您已提供给我们的相关个人信息进行查阅。包括：
10.1.1 账号信息：您可以通过相关产品页面随时登陆您的个人中心，以访问您账号中的个人资料信息，包括：头像、昵称、性别、出生年月等；
10.1.2 使用信息：您可以通过相关产品页面随时查阅您的使用信息，包括：动态发布内容、投稿内容、历史记录、订单信息、地址信息、账单记录等；
10.1.3 其他信息：如您在访问过程中遇到操作问题需获取其他前述无法获知的个人信息内容，您可通过本隐私政策提供的方式联系我们。
10.2. 您有权更正/修改您的个人信息
当您发现您提供给我们的个人信息存在登记错误、不完整或有更新的，您可在我们的产品和/或服务中更正/修改您的个人信息。
10.3. 对于您的部分个人信息，我们在产品的相关功能页面为您提供了操作设置，您可以直接进行更正/修改，例如：“头像/昵称/性别/出生年月”在小蜜蜂智慧小区客户端中的更正/修改路径为：点击头像-编辑资料。
10.4. 对于您在行使上述权利过程中遇到的困难，或者其他可能目前无法向您提供在线自行更正/修改服务的，经过对您身份的验证，且更正/修改不影响信息的客观性和准确性的情况下，您有权对错误或不完整的信息作出更正或修改，或在特定情况下，尤其是数据错误时，通过我们公布的反馈与报错等措施将您的更正/修改申请提交给我们，要求我们更正或修改您的数据，但法律法规另有规定的除外。但出于安全性和身份识别的考虑，您可能无法修改注册时提交的某些初始注册信息。
3. 您有权删除您的个人信息
3.1 对于您的部分个人信息，您也可以自行通过我们提供的相关产品和服务的功能页面，主动删除您提供信息。您也可以自主删除您发布的视频、动态、图片等。一旦您删除后，我们即会对此类信息进行删除或匿名化处理，除非法律法规另有规定。
3.2 当发生以下情况时，您可以直接要求我们删除您的个人信息，但已做匿名化处理或法律法规另有规定的除外：
（1） 当我们处理个人信息的行为违反法律法规时；
（2） 当我们收集、使用您的个人信息，却未征得您的同意时；
（3） 当我们处理个人信息的行为违反了与您的约定时；
（4） 当您注销了小蜜蜂智慧小区账号时；
（5） 当我们终止服务及运营时。
4. 您有权撤回您对个人信息的授权
如前文所述，我们提供的产品和服务的部分功能需要获得您使用设备的相关权限（包括：位置、相机、麦克风、日程安排等，具体以本隐私政策第四条为准）。您可以在授权后随时撤回（或停止）对该权限的继续授权。当您更新App版本后，未经您的明确同意，我们不会更改您之前设置的权限状态。您也可以通过注销账号的方式，永久撤回我们继续收集您个人信息的全部授权。您需理解，当您撤回授权后，我们无法继续为您提供撤回授权所对应的特定功能和/或服务。但您撤回授权的决定，不会影响此前基于您的授权而开展的个人信息处理。
5. 您有权注销您的账号
您可以通过在线申请注销或客服或通过其他我们公示的方式申请注销您的账号。当您注销账号后，您将无法再以该账号登录和使用我们的产品与服务；且该账号在小蜜蜂智慧小区及旗下的其他产品与服务使用期间已产生的但未消耗完毕的权益及未来的逾期利益等全部权益将被清除；该账号下的内容、信息、数据、记录等将会被删除或匿名化处理（但法律法规另有规定或监管部门另有要求的除外，如依据《中华人民共和国网络安全法》规定，您的网络操作日志将至少保留六个月的时间）；小蜜蜂智慧小区账号注销完成后，将无法恢复。
更多关于小蜜蜂智慧小区账号注销的流程、条件等事项请详见《账号注销协议》。
如您在谨慎考虑后仍执意决定注销您的小蜜蜂智慧小区账号的，您可以在您使用的我们的产品与/或服务的相关功能设置页面或根据操作指引向我们提交注销申请，小蜜蜂智慧小区APP的注销路径为：“我的—设置—账号管理-账号注销”。
在您点击“账号注销”功能后，我们会实时将您的账号自动进行注销，且无法修复。如果您在处置您的个人信息时有任何疑问，您可以通过我们提供的联系方式与我们沟通解决。
    ''',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
