///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class AppLocalizationsZhHantTw extends AppLocalizations with BaseTranslations<AppLocale, AppLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	AppLocalizationsZhHantTw({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, AppLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhHantTw,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-Hant-TW>.
	@override final TranslationMetadata<AppLocale, AppLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final AppLocalizationsZhHantTw _root = this; // ignore: unused_field

	@override 
	AppLocalizationsZhHantTw $copyWith({TranslationMetadata<AppLocale, AppLocalizations>? meta}) => AppLocalizationsZhHantTw(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => '高科校務通';
	@override String get updateNoteContent => '* 修正部分裝置桌面小工具無法顯示';
	@override String get aboutOpenSourceContent => 'https://github.com/NKUST-ITC/NKUST-AP-Flutter\n\n本專案採MIT 開放原始碼授權：\nThe MIT License (MIT)\n\nCopyright © 2021 Rainvisitor\n\nThis project is Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.';
	@override String busPickDate({required Object arg1}) => '選擇乘車時間：${arg1}';
	@override String get busNotPickDate => '選擇乘車時間';
	@override String busCount({required Object arg1, required Object arg2}) => '(${arg1} / ${arg2})';
	@override String get busJiangongReservations => '到燕巢，發車日期：';
	@override String get busYanchaoReservations => '到建工，發車日期：';
	@override String get busJiangong => '到燕巢，發車：';
	@override String get busYanchao => '到建工，發車：';
	@override String get busJiangongReserved => '√ 到燕巢，發車：';
	@override String get busYanchaoReserved => '√ 到建工，發車：';
	@override String get busReserve => '預定校車';
	@override String get busReservations => '校車紀錄';
	@override String get busViolationRecords => '校車罰緩';
	@override String get unpaid => '未繳款';
	@override String get paid => '已繳款';
	@override String get busCancelReserve => '取消預定校車';
	@override String get busReserveConfirmTitle => '確定要預定本次校車？';
	@override String busReserveConfirmContent({required Object arg1, required Object arg2}) => '要預定從${arg1}\n${arg2} 的校車嗎？';
	@override String get busCancelReserveConfirmTitle => '確定要<b>取消</b>本校車車次？';
	@override String busCancelReserveConfirmContent({required Object arg1, required Object arg2}) => '要取消從${arg1}\n${arg2} 的校車嗎？';
	@override String get busCancelReserveConfirmContent1 => '要取消從';
	@override String get busCancelReserveConfirmContent2 => '到';
	@override String get busCancelReserveConfirmContent3 => '的校車嗎？';
	@override String get busFromJiangong => '建工到燕巢';
	@override String get busFromYanchao => '燕巢到建工';
	@override String get reserve => '預約';
	@override String get busReserveDate => '預約日期';
	@override String get busReserveLocation => '上車地點';
	@override String get busReserveTime => '預約班次';
	@override String get jiangong => '建工';
	@override String get yanchao => '燕巢';
	@override String get first => '第一';
	@override String get nanzi => '楠梓';
	@override String get qijin => '旗津';
	@override String get unknown => '未知';
	@override String get campus => '校區';
	@override String get reserved => '已預約';
	@override String get canNotReserve => '無法預約';
	@override String get specialBus => '特殊班次';
	@override String get trialBus => '試辦車次';
	@override String get busReserveSuccess => '預約成功！';
	@override String get busReserveCancelDate => '取消日期';
	@override String get busReserveCancelLocation => '上車地點';
	@override String get busReserveCancelTime => '取消班次';
	@override String get busCancelReserveSuccess => '取消預約成功！';
	@override String get busCancelReserveFail => '取消預約失敗';
	@override String get busReservationEmpty => 'Oops！您還沒有預約任何校車喔～\n多多搭乘大眾運輸，節能減碳救地球 😋';
	@override String get busReserveFailTitle => 'Oops 預約失敗';
	@override String get iKnow => '我知道了';
	@override String get busEmpty => 'Oops！本日校車沒上班喔～\n請選擇其他日期 😋';
	@override String busNotPick({required Object arg1}) => '您尚未選擇日期！\n請先選擇日期 ${arg1}';
	@override String get busNotifyHint => '校車預約將於發車前三十分鐘提醒！\n若在網頁預約或取消校車請重登入此App。';
	@override String busNotifyContent({required Object arg1, required Object arg2}) => '您有一班 ${arg1} 從${arg2}出發的校車！';
	@override String get busNotifyJiangong => '建工';
	@override String get busNotifyYanchao => '燕巢';
	@override String get busNotify => '校車提醒';
	@override String get busNotifySubTitle => '發車前三十分鐘提醒';
	@override String get bus => '校車系統';
	@override String get fromJiangong => '建工上車';
	@override String get fromYanchao => '燕巢上車';
	@override String get fromFirst => '第一上車';
	@override String get destination => '目的地';
	@override String get reserving => '預約中...';
	@override String get canceling => '取消中...';
	@override String get busFailInfinity => '學校校車系統或許壞掉惹～';
	@override String get reserveDeadline => '預約截止時間';
	@override String get busRule => '校車搭乘規則';
	@override String get firstLoginHint => '首次登入密碼預設為身分證末四碼';
	@override String searchStudentIdFormat({required Object arg1, required Object arg2}) => '姓名：${arg1}\n學號：${arg2}\n';
	@override String get punch => '拍照打卡';
	@override String get punchSuccess => '打卡成功';
	@override String get nonCourseTime => '非上課時間';
	@override String get offlineScore => '離線成績';
	@override String get offlineBusReservations => '離線校車紀錄';
	@override String get offlineLeaveData => '離線缺曠資料';
	@override String get busRuleReservationRuleTitle => '預約校車\n';
	@override String get busRuleTravelBy => '• 請上 ';
	@override String get busRuleFourteenDay => '• 校車預約系統預約校車\n• 可預約14天以內的校車班次\n• 為配合總務處派車需求預約時間\n';
	@override String get busRuleReservationTime => '■ 9點以前的班次：請於發車前15個小時預約\n■ 9點以後的班次：請於發車前5個小時預約\n';
	@override String get busRuleCancellingTitle => '• 取消預約時間\n';
	@override String get busRuleCancelingTime => '■ 9點以前的班次：請於發車前15個小時預約\n■ 9點以後的班次：請於發車前5個小時預約\n';
	@override String get busRuleFollow => '• 請全校師生及職員依規定預約校車，若因未預約校車而無法到課或上班者，請自行負責\n';
	@override String get busRuleTakeOn => '上車\n';
	@override String get busRuleTwentyDollars => '• 每次上車繳款20元';
	@override String get busRulePrepareCoins => '（未發卡前先以投幣繳費，請自備20元銅板投幣）\n';
	@override String get busRuleIdCard => '• 請持學生證或教職員證(未發卡前先採用身分證識別)上車\n';
	@override String get busRuleNoIdCard => '• 未攜帶證件者請排後補區\n';
	@override String get busRuleFollowingTime => '• 請依預約的班次時間搭乘(例如：8:20與9:30視為不同班次），未依規定者不得上車，並計違規點數一點\n';
	@override String get busRuleLateAndNoReservation => '• 逾時或未預約搭乘者請至候補車道排隊候補上車。\n候補上車\n• 在正常車道上車時未通過驗證者(ex.未預約該班次)，請改至候補車道排隊候補上車。\n• 候補者需等待預約該班次的人全部上車之後才依序遞補上車\n';
	@override String get busRuleStandbyTitle => '候補上車\n';
	@override String get busRuleStandbyRule => '• 未依預約的班次搭乘者，視為違規，計違規點數一次(例如：8:20與9:30視為不同班次）\n• 因教師臨時請假、臨時調課致使需提前或延後搭車，得向開課系所提出申請，並由系所之交通車系統管理者註銷違規紀錄。\n候補上車\n• 在正常車道上車時未通過驗證者(ex.未預約該班次)，請改至候補車道排隊候補上車。\n• 候補者需等待預約該班次的人全部上車之後才依序遞補上車\n';
	@override String get busRuleFineTitle => '罰款\n';
	@override String get busRuleFineRule => '• 違規罰款金額計算，違規前三次不計點，從第四次開始違規記點，每點應繳納等同車資之罰款\n• 違規點數統計至學期末為止(上學期學期末1/31，下學期8/31)，新學期違規點數重新計算。當學期罰款未繳清者，次學期停止預約權限至罰款繳清為止\n• 罰款請自行列印違規明細後至自動繳費機或總務處出納組繳費，繳費後憑收據至總務處事務組銷帳(當天開列之收據須於當天銷帳)，銷帳完後隔天凌晨4點後才可預約當天9點後的校車。\n• 罰款點數如有疑義，請於違規發生日起10日內(含星期例假日)逕向總務處事務組確認。\n';
	@override String get busViolationRecordEmpty => '太好了！您沒有任何校車罰緩～';
	@override String get schoolCloseCourseHint => '學校關閉課表 我們暫時無法解決\n任何問題建議與校方反應';
	@override String get loginAuth => '登入驗證';
	@override String get clickShowDescription => '點擊看說明';
	@override String get mobileNkustLoginHint => '等待網頁完成載入\n將自動填寫學號密碼\n完成機器人驗證後點擊登入\n將自動跳轉';
	@override String get mobileNkustLoginDescription => '因應校方關閉原有爬蟲功能，此版本需透過新版手機版校務系統登入。成功登入後會自動跳轉，除非憑證過期，否則極少需要重複驗證，強烈建議將記住我勾選。';
	@override String get leaveApplyRecord => '請假查詢';
	@override String get localNotificationTest => '本地通知測試';
	@override String get testTitle => '測試標題';
	@override String get testContent => '內容\n第二行';
	@override String get requestPermission => '要求權限';
	@override String get showNow => '立即顯示';
	@override String get showInFiveSeconds => '顯示於五秒後';
	@override String get setWeekDay => '設定星期';
	@override String get setTimeOfDay => '設定時間';
	@override String get scheduleWeeklyNotifyTitle => '規劃每週通知';
	@override String scheduleWeeklyNotifyContent({required Object arg1, required Object arg2}) => '設定在每 ${arg1} ${arg2}';
	@override String get getPendingNotificationList => '等待通知列表(點擊可取消)';
	@override String get cancelAll => '取消全部';
	@override String get dialogUtilTest => '對話框測試';
	@override String get newFeature => '新功能';
	@override String get latestAnnouncements => '最新公告';
	@override String get postAnnouncement => '投稿';
	@override String get loginCardTitle => '登入校務系統';
	@override String get loginCardSubtitle => '登入後查看今日課表與學期成績';
	@override String get campusServicesSection => '校園服務';
	@override String get appSection => '應用程式';
	@override String get schoolInfoSubtitle => '查詢校園常用電話與年度行事曆';
	@override String get announcementReviewSubtitle => '投稿校園活動宣傳或管理審核';
	@override String get accountSheetTitle => '帳號與設定';
	@override String get viewProfileHint => '查看與編輯個人資料';
	@override String get busRoutesSection => '校園公車路線';
	@override String get courseNotLoaded => '尚未載入課表，點擊查看';
	@override String get busDemoSubtitle => '範例路線與發車時間';
	@override String get tabMore => '校園';
	@override String get tabBus => '校車';
}

/// The flat map containing all translations for locale <zh-Hant-TW>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on AppLocalizationsZhHantTw {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => '高科校務通',
			'updateNoteContent' => '* 修正部分裝置桌面小工具無法顯示',
			'aboutOpenSourceContent' => 'https://github.com/NKUST-ITC/NKUST-AP-Flutter\n\n本專案採MIT 開放原始碼授權：\nThe MIT License (MIT)\n\nCopyright © 2021 Rainvisitor\n\nThis project is Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.',
			'busPickDate' => ({required Object arg1}) => '選擇乘車時間：${arg1}',
			'busNotPickDate' => '選擇乘車時間',
			'busCount' => ({required Object arg1, required Object arg2}) => '(${arg1} / ${arg2})',
			'busJiangongReservations' => '到燕巢，發車日期：',
			'busYanchaoReservations' => '到建工，發車日期：',
			'busJiangong' => '到燕巢，發車：',
			'busYanchao' => '到建工，發車：',
			'busJiangongReserved' => '√ 到燕巢，發車：',
			'busYanchaoReserved' => '√ 到建工，發車：',
			'busReserve' => '預定校車',
			'busReservations' => '校車紀錄',
			'busViolationRecords' => '校車罰緩',
			'unpaid' => '未繳款',
			'paid' => '已繳款',
			'busCancelReserve' => '取消預定校車',
			'busReserveConfirmTitle' => '確定要預定本次校車？',
			'busReserveConfirmContent' => ({required Object arg1, required Object arg2}) => '要預定從${arg1}\n${arg2} 的校車嗎？',
			'busCancelReserveConfirmTitle' => '確定要<b>取消</b>本校車車次？',
			'busCancelReserveConfirmContent' => ({required Object arg1, required Object arg2}) => '要取消從${arg1}\n${arg2} 的校車嗎？',
			'busCancelReserveConfirmContent1' => '要取消從',
			'busCancelReserveConfirmContent2' => '到',
			'busCancelReserveConfirmContent3' => '的校車嗎？',
			'busFromJiangong' => '建工到燕巢',
			'busFromYanchao' => '燕巢到建工',
			'reserve' => '預約',
			'busReserveDate' => '預約日期',
			'busReserveLocation' => '上車地點',
			'busReserveTime' => '預約班次',
			'jiangong' => '建工',
			'yanchao' => '燕巢',
			'first' => '第一',
			'nanzi' => '楠梓',
			'qijin' => '旗津',
			'unknown' => '未知',
			'campus' => '校區',
			'reserved' => '已預約',
			'canNotReserve' => '無法預約',
			'specialBus' => '特殊班次',
			'trialBus' => '試辦車次',
			'busReserveSuccess' => '預約成功！',
			'busReserveCancelDate' => '取消日期',
			'busReserveCancelLocation' => '上車地點',
			'busReserveCancelTime' => '取消班次',
			'busCancelReserveSuccess' => '取消預約成功！',
			'busCancelReserveFail' => '取消預約失敗',
			'busReservationEmpty' => 'Oops！您還沒有預約任何校車喔～\n多多搭乘大眾運輸，節能減碳救地球 😋',
			'busReserveFailTitle' => 'Oops 預約失敗',
			'iKnow' => '我知道了',
			'busEmpty' => 'Oops！本日校車沒上班喔～\n請選擇其他日期 😋',
			'busNotPick' => ({required Object arg1}) => '您尚未選擇日期！\n請先選擇日期 ${arg1}',
			'busNotifyHint' => '校車預約將於發車前三十分鐘提醒！\n若在網頁預約或取消校車請重登入此App。',
			'busNotifyContent' => ({required Object arg1, required Object arg2}) => '您有一班 ${arg1} 從${arg2}出發的校車！',
			'busNotifyJiangong' => '建工',
			'busNotifyYanchao' => '燕巢',
			'busNotify' => '校車提醒',
			'busNotifySubTitle' => '發車前三十分鐘提醒',
			'bus' => '校車系統',
			'fromJiangong' => '建工上車',
			'fromYanchao' => '燕巢上車',
			'fromFirst' => '第一上車',
			'destination' => '目的地',
			'reserving' => '預約中...',
			'canceling' => '取消中...',
			'busFailInfinity' => '學校校車系統或許壞掉惹～',
			'reserveDeadline' => '預約截止時間',
			'busRule' => '校車搭乘規則',
			'firstLoginHint' => '首次登入密碼預設為身分證末四碼',
			'searchStudentIdFormat' => ({required Object arg1, required Object arg2}) => '姓名：${arg1}\n學號：${arg2}\n',
			'punch' => '拍照打卡',
			'punchSuccess' => '打卡成功',
			'nonCourseTime' => '非上課時間',
			'offlineScore' => '離線成績',
			'offlineBusReservations' => '離線校車紀錄',
			'offlineLeaveData' => '離線缺曠資料',
			'busRuleReservationRuleTitle' => '預約校車\n',
			'busRuleTravelBy' => '• 請上 ',
			'busRuleFourteenDay' => '• 校車預約系統預約校車\n• 可預約14天以內的校車班次\n• 為配合總務處派車需求預約時間\n',
			'busRuleReservationTime' => '■ 9點以前的班次：請於發車前15個小時預約\n■ 9點以後的班次：請於發車前5個小時預約\n',
			'busRuleCancellingTitle' => '• 取消預約時間\n',
			'busRuleCancelingTime' => '■ 9點以前的班次：請於發車前15個小時預約\n■ 9點以後的班次：請於發車前5個小時預約\n',
			'busRuleFollow' => '• 請全校師生及職員依規定預約校車，若因未預約校車而無法到課或上班者，請自行負責\n',
			'busRuleTakeOn' => '上車\n',
			'busRuleTwentyDollars' => '• 每次上車繳款20元',
			'busRulePrepareCoins' => '（未發卡前先以投幣繳費，請自備20元銅板投幣）\n',
			'busRuleIdCard' => '• 請持學生證或教職員證(未發卡前先採用身分證識別)上車\n',
			'busRuleNoIdCard' => '• 未攜帶證件者請排後補區\n',
			'busRuleFollowingTime' => '• 請依預約的班次時間搭乘(例如：8:20與9:30視為不同班次），未依規定者不得上車，並計違規點數一點\n',
			'busRuleLateAndNoReservation' => '• 逾時或未預約搭乘者請至候補車道排隊候補上車。\n候補上車\n• 在正常車道上車時未通過驗證者(ex.未預約該班次)，請改至候補車道排隊候補上車。\n• 候補者需等待預約該班次的人全部上車之後才依序遞補上車\n',
			'busRuleStandbyTitle' => '候補上車\n',
			'busRuleStandbyRule' => '• 未依預約的班次搭乘者，視為違規，計違規點數一次(例如：8:20與9:30視為不同班次）\n• 因教師臨時請假、臨時調課致使需提前或延後搭車，得向開課系所提出申請，並由系所之交通車系統管理者註銷違規紀錄。\n候補上車\n• 在正常車道上車時未通過驗證者(ex.未預約該班次)，請改至候補車道排隊候補上車。\n• 候補者需等待預約該班次的人全部上車之後才依序遞補上車\n',
			'busRuleFineTitle' => '罰款\n',
			'busRuleFineRule' => '• 違規罰款金額計算，違規前三次不計點，從第四次開始違規記點，每點應繳納等同車資之罰款\n• 違規點數統計至學期末為止(上學期學期末1/31，下學期8/31)，新學期違規點數重新計算。當學期罰款未繳清者，次學期停止預約權限至罰款繳清為止\n• 罰款請自行列印違規明細後至自動繳費機或總務處出納組繳費，繳費後憑收據至總務處事務組銷帳(當天開列之收據須於當天銷帳)，銷帳完後隔天凌晨4點後才可預約當天9點後的校車。\n• 罰款點數如有疑義，請於違規發生日起10日內(含星期例假日)逕向總務處事務組確認。\n',
			'busViolationRecordEmpty' => '太好了！您沒有任何校車罰緩～',
			'schoolCloseCourseHint' => '學校關閉課表 我們暫時無法解決\n任何問題建議與校方反應',
			'loginAuth' => '登入驗證',
			'clickShowDescription' => '點擊看說明',
			'mobileNkustLoginHint' => '等待網頁完成載入\n將自動填寫學號密碼\n完成機器人驗證後點擊登入\n將自動跳轉',
			'mobileNkustLoginDescription' => '因應校方關閉原有爬蟲功能，此版本需透過新版手機版校務系統登入。成功登入後會自動跳轉，除非憑證過期，否則極少需要重複驗證，強烈建議將記住我勾選。',
			'leaveApplyRecord' => '請假查詢',
			'localNotificationTest' => '本地通知測試',
			'testTitle' => '測試標題',
			'testContent' => '內容\n第二行',
			'requestPermission' => '要求權限',
			'showNow' => '立即顯示',
			'showInFiveSeconds' => '顯示於五秒後',
			'setWeekDay' => '設定星期',
			'setTimeOfDay' => '設定時間',
			'scheduleWeeklyNotifyTitle' => '規劃每週通知',
			'scheduleWeeklyNotifyContent' => ({required Object arg1, required Object arg2}) => '設定在每 ${arg1} ${arg2}',
			'getPendingNotificationList' => '等待通知列表(點擊可取消)',
			'cancelAll' => '取消全部',
			'dialogUtilTest' => '對話框測試',
			'newFeature' => '新功能',
			'latestAnnouncements' => '最新公告',
			'postAnnouncement' => '投稿',
			'loginCardTitle' => '登入校務系統',
			'loginCardSubtitle' => '登入後查看今日課表與學期成績',
			'campusServicesSection' => '校園服務',
			'appSection' => '應用程式',
			'schoolInfoSubtitle' => '查詢校園常用電話與年度行事曆',
			'announcementReviewSubtitle' => '投稿校園活動宣傳或管理審核',
			'accountSheetTitle' => '帳號與設定',
			'viewProfileHint' => '查看與編輯個人資料',
			'busRoutesSection' => '校園公車路線',
			'courseNotLoaded' => '尚未載入課表，點擊查看',
			'busDemoSubtitle' => '範例路線與發車時間',
			'tabMore' => '校園',
			'tabBus' => '校車',
			_ => null,
		};
	}
}
