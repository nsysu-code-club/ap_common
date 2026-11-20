import 'package:ap_common/ap_common.dart';
import 'package:ap_common_example/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SchoolInfoPage extends StatefulWidget {
  static const String routerName = '/SchoolInfo';

  @override
  SchoolInfoPageState createState() => SchoolInfoPageState();
}

class SchoolInfoPageState extends State<SchoolInfoPage>
    with SingleTickerProviderStateMixin {
  final List<PhoneModel> phoneModelList = <PhoneModel>[
    const PhoneModel('校安中心\n分機號碼：建工1 楠梓2 第一3 燕巢4 旗津5', '0800-550995'),
    const PhoneModel('建工校區', ''),
    const PhoneModel('校安專線', '0916-507-506'),
    const PhoneModel('事務組', '(07) 381-4526 #2650'),
    const PhoneModel('營繕組', '(07) 381-4526 #2630'),
    const PhoneModel('課外活動組', '(07) 381-4526 #2525'),
    const PhoneModel('諮商輔導中心', '(07) 381-4526 #2541'),
    const PhoneModel('圖書館', '(07) 381-4526 #3100'),
    const PhoneModel('校外賃居服務中心', '(07) 381-4526 #3420'),
    const PhoneModel('燕巢校區', ''),
    const PhoneModel('校安專線', '0925-350-995'),
    const PhoneModel('校外賃居服務中心', '(07) 381-4526 #8615'),
    const PhoneModel('第一校區', ''),
    const PhoneModel('生輔組', '(07)601-1000 #31212'),
    const PhoneModel('總務處 總機', '(07)601-1000 #31316'),
    const PhoneModel('總務處 場地租借', '(07)601-1000 #31312'),
    const PhoneModel('總務處 高科大會館', '(07)601-1000 #31306'),
    const PhoneModel('總務處 學雜費相關(原事務組)', '(07)601-1000 #31340'),
    const PhoneModel('課外活動組', '(07)601-1000 #31211'),
    const PhoneModel('諮輔組', '(07)601-1000 #31241'),
    const PhoneModel('圖書館', '(07)6011000 #1599'),
    const PhoneModel('生輔組', '(07)6011000 #31212'),
    const PhoneModel('楠梓校區', ''),
    const PhoneModel('總機', '07-3617141'),
    const PhoneModel('課外活動組', '07-3617141 #22070'),
    const PhoneModel('旗津校區', ''),
    const PhoneModel('旗津校區', '07-8100888'),
    const PhoneModel('學生事務處', '07-3617141 #2052'),
    const PhoneModel('課外活動組', '07-8100888 #25065'),
    const PhoneModel('生活輔導組', '07-3617141 #23967'),
  ];

  NotificationState notificationState = NotificationState.loading;

  List<Notifications> notificationList = <Notifications>[];
  int page = 1;

  PhoneState phoneState = PhoneState.finish;

  PdfState pdfState = PdfState.loading;

  TabController? controller;

  Uint8List? data;

  @override
  void initState() {
    AnalyticsUtil.instance.setCurrentScreen(
      'SchoolInfoPage',
      'school_info_page.dart',
    );
    controller = TabController(length: 3, vsync: this);
    _getNotifications();
    _getSchedules();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ApPageScaffold(
      title: Text(context.ap.schoolInfo),
      bottom: TabBar(
        controller: controller,
        tabs: <Widget>[
          Tab(icon: Icon(ApIcon.fiberNew), text: context.ap.notifications),
          Tab(icon: Icon(ApIcon.phone), text: context.ap.phones),
          Tab(icon: Icon(ApIcon.dateRange), text: context.ap.events),
        ],
      ),
      body: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          NotificationListView(
            state: notificationState,
            notificationList: notificationList,
            onRefresh: () async {
              setState(() {
                notificationList.clear();
              });
              await _getNotifications();
            },
            onLoadingMore: () async {
              setState(() => notificationState = NotificationState.loadingMore);
              await _getNotifications();
            },
          ),
          PhoneListView(
            state: phoneState,
            phoneModelList: phoneModelList,
          ),
          PdfView(
            state: pdfState,
            onRefresh: () => _getSchedules(),
            data: data,
          ),
        ],
      ),
    );
  }

  Future<void> _getNotifications() async {
    final String rawString =
        await rootBundle.loadString(FileAssets.notifications);
    final NotificationsData data = NotificationsData.fromRawJson(rawString);
    if (mounted) {
      setState(() {
        notificationList.addAll(data.data.notifications);
        notificationState = NotificationState.finish;
      });
    }
  }

  Future<void> _getSchedules() async {
    downloadFdf(
      'https://raw.githubusercontent.com/NKUST-ITC/NKUST-AP-Flutter/master/school_schedule.pdf',
    );
  }

  Future<void> downloadFdf(String url) async {
    try {
      final Response<Uint8List> response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      setState(() {
        pdfState = PdfState.finish;
        data = response.data;
      });
    } catch (e) {
      setState(() {
        pdfState = PdfState.error;
      });
      rethrow;
    }
  }
}
