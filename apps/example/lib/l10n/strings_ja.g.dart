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
class AppLocalizationsJa extends AppLocalizations with BaseTranslations<AppLocale, AppLocalizations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	AppLocalizationsJa({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, AppLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, AppLocalizations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final AppLocalizationsJa _root = this; // ignore: unused_field

	@override 
	AppLocalizationsJa $copyWith({TranslationMetadata<AppLocale, AppLocalizations>? meta}) => AppLocalizationsJa(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => 'NKUST AP';
	@override String get updateNoteContent => '* 一部端末のホームウィジェットエラーを修正';
	@override String get aboutOpenSourceContent => 'https://github.com/NKUST-ITC/NKUST-AP-Flutter\n\nThis project is licensed under the terms of the MIT license:\nThe MIT License (MIT)\n\nCopyright © 2021 Rainvisitor\n\nThis project is Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.';
	@override String busPickDate({required Object arg1}) => '乗車日：${arg1}';
	@override String get busNotPickDate => '乗車日を選択';
	@override String busCount({required Object arg1, required Object arg2}) => '(${arg1} / ${arg2})';
	@override String get busJiangongReservations => '燕巢行き、出発日：';
	@override String get busYanchaoReservations => '建工行き、出発日：';
	@override String get busJiangong => '燕巢行き、出発：';
	@override String get busYanchao => '建工行き、出発：';
	@override String get busJiangongReserved => '√ 燕巢行き、出発：';
	@override String get busYanchaoReserved => '√ 建工行き、出発：';
	@override String get busReserve => 'バス予約';
	@override String get busReservations => 'バス記録';
	@override String get busViolationRecords => 'バス違反金';
	@override String get unpaid => '未払い';
	@override String get paid => '支払い済み';
	@override String get busCancelReserve => 'バス予約キャンセル';
	@override String get busReserveConfirmTitle => 'このバスを予約しますか？';
	@override String busReserveConfirmContent({required Object arg1, required Object arg2}) => '${arg1}から${arg2}のバスを予約しますか？';
	@override String get busCancelReserveConfirmTitle => 'この予約を<b>キャンセル</b>しますか？';
	@override String busCancelReserveConfirmContent({required Object arg1, required Object arg2}) => '${arg1}から${arg2}のバスをキャンセルしますか？';
	@override String get busCancelReserveConfirmContent1 => 'キャンセルしますか？';
	@override String get busCancelReserveConfirmContent2 => 'から';
	@override String get busCancelReserveConfirmContent3 => 'のバス';
	@override String get busFromJiangong => '建工から燕巢';
	@override String get busFromYanchao => '燕巢から建工';
	@override String get busReserveDate => '予約日';
	@override String get busReserveLocation => '乗車地';
	@override String get busReserveTime => '予約便';
	@override String get jiangong => '建工';
	@override String get yanchao => '燕巢';
	@override String get first => '第一';
	@override String get nanzi => '楠梓';
	@override String get qijin => '旗津';
	@override String get reserve => '予約';
	@override String get reserved => '予約済み';
	@override String get canNotReserve => '予約不可';
	@override String get specialBus => '特別便';
	@override String get trialBus => '試験運行';
	@override String get busReserveSuccess => '予約成功！';
	@override String get busReserveCancelDate => 'キャンセル日';
	@override String get busReserveCancelLocation => '乗車地';
	@override String get busReserveCancelTime => 'キャンセル便';
	@override String get busCancelReserveSuccess => '予約キャンセル成功！';
	@override String get busCancelReserveFail => '予約キャンセル失敗';
	@override String get busReservationEmpty => 'まだバスを予約していません～\n公共交通機関を利用して地球を守りましょう 😋';
	@override String get busEmpty => '本日のバスは運休です～\n別の日を選んでください 😋';
	@override String busNotPick({required Object arg1}) => '日付が選択されていません！\n先に日付を選んでください ${arg1}';
	@override String get busNotifyHint => 'バス出発30分前にリマインドします！\nウェブで予約・キャンセルした場合はアプリを再起動してください。';
	@override String busNotifyContent({required Object arg1, required Object arg2}) => '${arg1}に${arg2}から出発するバスがあります！';
	@override String get busNotifyJiangong => '建工';
	@override String get busNotifyYanchao => '燕巢';
	@override String get busNotify => 'バスリマインド';
	@override String get busNotifySubTitle => '出発30分前にリマインド';
	@override String get bus => 'スクールバスシステム';
	@override String get fromJiangong => '建工乗車';
	@override String get fromYanchao => '燕巢乗車';
	@override String get fromFirst => '第一乗車';
	@override String get destination => '目的地';
	@override String get reserving => '予約中...';
	@override String get canceling => 'キャンセル中...';
	@override String get busFailInfinity => 'スクールバスシステムがサービス停止中です～';
	@override String get reserveDeadline => '予約締切';
	@override String get busRule => 'バス乗車規則';
	@override String get firstLoginHint => '初回ログインのデフォルトパスワードはIDの下4桁です';
	@override String searchStudentIdFormat({required Object arg1, required Object arg2}) => '氏名：${arg1}\n学籍番号：${arg2}\n';
	@override String get noExpiration => '無期限';
	@override String get punch => '写真打刻';
	@override String get punchSuccess => '打刻成功';
	@override String get nonCourseTime => '授業時間外';
	@override String get offlineScore => 'オフライン成績';
	@override String get offlineBusReservations => 'オフラインバス予約';
	@override String get offlineLeaveData => 'オフライン欠課データ';
	@override String get busRuleReservationRuleTitle => 'バス予約\n';
	@override String get busRuleTravelby => '• ';
	@override String get busRuleFourteenDay => 'バス予約システムで14日以内のバスを予約できます。\n総務処の派車要件に従ってください。\n';
	@override String get busRuleReservationTime => '■ 9時前の便：出発15時間前までに予約\n■ 9時以降の便：出発5時間前までに予約\n';
	@override String get busRuleCancellingTitle => '• キャンセル時間\n';
	@override String get busRuleCancelingTime => '■ 9時前の便：出発15時間前までにキャンセル\n■ 9時以降の便：出発5時間前までにキャンセル\n';
	@override String get busRuleBusRuleFollow => '• 全校の学生・教職員は規定に従いバスを予約してください。予約せず授業や勤務に遅刻した場合は自己責任となります。\n';
	@override String get busRuleTakeOn => '乗車\n';
	@override String get busRuleTwentyDollars => '• 乗車ごとに20元';
	@override String get busRulePrepareCoins => '（学生証がない場合はコインで支払い。20元硬貨をご用意ください。）\n';
	@override String get busRuleIdCard => '• 学生証または教職員証を持参してください（未発行の場合は身分証で識別）\n';
	@override String get busRuleNoIdCard => '• 証明書を持参していない場合はキャンセル待ちエリアに並んでください\n';
	@override String get busRuleFollowingTime => '予約した便の時間に従ってください（例：8:20と9:30は別便）。規定に従わない場合は乗車できず、違反点数が加算されます。\n';
	@override String get busRuleLateAndNoReservation => '• 遅刻または未予約の乗客はキャンセル待ちエリアに並んでください。\nキャンセル待ち乗車\n• 正規レーンで認証に通らなかった場合はキャンセル待ちエリアへ。\n• 予約者全員が乗車後、順番に乗車できます。\n';
	@override String get busRuleStandbyTitle => 'キャンセル待ち乗車\n';
	@override String get busRuleStandbyRule => '• 予約した便以外に乗車した場合は違反とし、違反点数1点が加算されます。\n• 教員の臨時休講・調課による場合は所属学科に申請し、管理者が違反記録を取り消します。\n';
	@override String get busRuleFineTitle => '罰金\n';
	@override String get busRuleFineRule => '• 違反3回までは点数加算なし。4回目から違反点数が記録され、各点数につきバス運賃相当の罰金が発生します。\n• 違反点数は学期末まで集計（前期1/31、後期8/31）。新学期に点数はリセットされます。罰金未納の場合、次学期の予約権限が停止されます。\n• 罰金は違反明細を印刷後、自動支払機または総務処出納で支払い、領収書で総務処事務組にて消込してください。消込完了翌日午前4時以降、9時以降のバスが予約可能になります。\n• 違反点数に疑義がある場合は、違反発生日から10日以内に総務処事務組に確認してください。\n';
	@override String get busViolationRecordEmpty => 'バスの違反記録はありません～';
	@override String get schoolCloseCourseHint => '学校が時間割システムを閉鎖しています。一時的に解決できません。\n学校にお問い合わせください。';
	@override String get loginAuth => 'ログイン認証';
	@override String get clickShowDescription => '説明を表示';
	@override String get mobileNkustLoginHint => 'ウェブページの読み込みを待ちます。\n学籍番号とパスワードは自動入力されます。\nreCaptchaを完了してログインをクリックすると自動的にリダイレクトされます。';
	@override String get mobileNkustLoginDescription => '学校が従来のクローラー機能を閉鎖したため、新しいモバイル校務システムでのログインが必要です。ログイン成功後は自動的にリダイレクトされます。証明書の期限切れ以外では再認証はほとんど不要です。「記住我」にチェックすることを強くお勧めします。';
	@override String get leaveApplyRecord => '欠席申請記録';
	@override String get testTitle => 'テストタイトル';
	@override String get testContent => '内容\n2行目';
	@override String get requestPermission => '権限を要求';
	@override String get showNow => '今すぐ表示';
	@override String get showInFiveSeconds => '5秒後に表示';
	@override String get setWeekDay => '曜日を設定';
	@override String get setTimeOfDay => '時間を設定';
	@override String get scheduleWeeklyNotifyTitle => '毎週の通知を設定';
	@override String scheduleWeeklyNotifyContent({required Object arg1, required Object arg2}) => '毎週${arg1} ${arg2}に設定';
	@override String get getPendingNotificationList => '保留中の通知リスト（タップでキャンセル）';
	@override String get cancelAll => 'すべてキャンセル';
	@override String get dialogUtilTest => 'ダイアログテスト';
	@override String get localNotificationTest => 'ローカル通知テスト';
	@override String get newFeature => '新機能';
	@override String get latestAnnouncements => '最新のお知らせ';
	@override String get postAnnouncement => '投稿';
	@override String get loginCardTitle => '学務システムにログイン';
	@override String get loginCardSubtitle => 'ログインして今日の時間割と成績を確認';
	@override String get campusServicesSection => 'キャンパスサービス';
	@override String get appSection => 'アプリケーション';
	@override String get schoolInfoSubtitle => '学内電話番号と年間行事予定';
	@override String get announcementReviewSubtitle => '学内イベントの投稿・審査管理';
	@override String get accountSheetTitle => 'アカウントと設定';
	@override String get viewProfileHint => 'プロフィールを表示・編集';
	@override String get busRoutesSection => '学内バス路線';
	@override String get courseNotLoaded => '時間割がまだ読み込まれていません。タップして表示';
	@override String get busDemoSubtitle => 'サンプル路線と時刻表';
	@override String get tabMore => 'キャンパス';
	@override String get tabBus => 'バス';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on AppLocalizationsJa {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appName' => 'NKUST AP',
			'updateNoteContent' => '* 一部端末のホームウィジェットエラーを修正',
			'aboutOpenSourceContent' => 'https://github.com/NKUST-ITC/NKUST-AP-Flutter\n\nThis project is licensed under the terms of the MIT license:\nThe MIT License (MIT)\n\nCopyright © 2021 Rainvisitor\n\nThis project is Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.',
			'busPickDate' => ({required Object arg1}) => '乗車日：${arg1}',
			'busNotPickDate' => '乗車日を選択',
			'busCount' => ({required Object arg1, required Object arg2}) => '(${arg1} / ${arg2})',
			'busJiangongReservations' => '燕巢行き、出発日：',
			'busYanchaoReservations' => '建工行き、出発日：',
			'busJiangong' => '燕巢行き、出発：',
			'busYanchao' => '建工行き、出発：',
			'busJiangongReserved' => '√ 燕巢行き、出発：',
			'busYanchaoReserved' => '√ 建工行き、出発：',
			'busReserve' => 'バス予約',
			'busReservations' => 'バス記録',
			'busViolationRecords' => 'バス違反金',
			'unpaid' => '未払い',
			'paid' => '支払い済み',
			'busCancelReserve' => 'バス予約キャンセル',
			'busReserveConfirmTitle' => 'このバスを予約しますか？',
			'busReserveConfirmContent' => ({required Object arg1, required Object arg2}) => '${arg1}から${arg2}のバスを予約しますか？',
			'busCancelReserveConfirmTitle' => 'この予約を<b>キャンセル</b>しますか？',
			'busCancelReserveConfirmContent' => ({required Object arg1, required Object arg2}) => '${arg1}から${arg2}のバスをキャンセルしますか？',
			'busCancelReserveConfirmContent1' => 'キャンセルしますか？',
			'busCancelReserveConfirmContent2' => 'から',
			'busCancelReserveConfirmContent3' => 'のバス',
			'busFromJiangong' => '建工から燕巢',
			'busFromYanchao' => '燕巢から建工',
			'busReserveDate' => '予約日',
			'busReserveLocation' => '乗車地',
			'busReserveTime' => '予約便',
			'jiangong' => '建工',
			'yanchao' => '燕巢',
			'first' => '第一',
			'nanzi' => '楠梓',
			'qijin' => '旗津',
			'reserve' => '予約',
			'reserved' => '予約済み',
			'canNotReserve' => '予約不可',
			'specialBus' => '特別便',
			'trialBus' => '試験運行',
			'busReserveSuccess' => '予約成功！',
			'busReserveCancelDate' => 'キャンセル日',
			'busReserveCancelLocation' => '乗車地',
			'busReserveCancelTime' => 'キャンセル便',
			'busCancelReserveSuccess' => '予約キャンセル成功！',
			'busCancelReserveFail' => '予約キャンセル失敗',
			'busReservationEmpty' => 'まだバスを予約していません～\n公共交通機関を利用して地球を守りましょう 😋',
			'busEmpty' => '本日のバスは運休です～\n別の日を選んでください 😋',
			'busNotPick' => ({required Object arg1}) => '日付が選択されていません！\n先に日付を選んでください ${arg1}',
			'busNotifyHint' => 'バス出発30分前にリマインドします！\nウェブで予約・キャンセルした場合はアプリを再起動してください。',
			'busNotifyContent' => ({required Object arg1, required Object arg2}) => '${arg1}に${arg2}から出発するバスがあります！',
			'busNotifyJiangong' => '建工',
			'busNotifyYanchao' => '燕巢',
			'busNotify' => 'バスリマインド',
			'busNotifySubTitle' => '出発30分前にリマインド',
			'bus' => 'スクールバスシステム',
			'fromJiangong' => '建工乗車',
			'fromYanchao' => '燕巢乗車',
			'fromFirst' => '第一乗車',
			'destination' => '目的地',
			'reserving' => '予約中...',
			'canceling' => 'キャンセル中...',
			'busFailInfinity' => 'スクールバスシステムがサービス停止中です～',
			'reserveDeadline' => '予約締切',
			'busRule' => 'バス乗車規則',
			'firstLoginHint' => '初回ログインのデフォルトパスワードはIDの下4桁です',
			'searchStudentIdFormat' => ({required Object arg1, required Object arg2}) => '氏名：${arg1}\n学籍番号：${arg2}\n',
			'noExpiration' => '無期限',
			'punch' => '写真打刻',
			'punchSuccess' => '打刻成功',
			'nonCourseTime' => '授業時間外',
			'offlineScore' => 'オフライン成績',
			'offlineBusReservations' => 'オフラインバス予約',
			'offlineLeaveData' => 'オフライン欠課データ',
			'busRuleReservationRuleTitle' => 'バス予約\n',
			'busRuleTravelby' => '• ',
			'busRuleFourteenDay' => 'バス予約システムで14日以内のバスを予約できます。\n総務処の派車要件に従ってください。\n',
			'busRuleReservationTime' => '■ 9時前の便：出発15時間前までに予約\n■ 9時以降の便：出発5時間前までに予約\n',
			'busRuleCancellingTitle' => '• キャンセル時間\n',
			'busRuleCancelingTime' => '■ 9時前の便：出発15時間前までにキャンセル\n■ 9時以降の便：出発5時間前までにキャンセル\n',
			'busRuleBusRuleFollow' => '• 全校の学生・教職員は規定に従いバスを予約してください。予約せず授業や勤務に遅刻した場合は自己責任となります。\n',
			'busRuleTakeOn' => '乗車\n',
			'busRuleTwentyDollars' => '• 乗車ごとに20元',
			'busRulePrepareCoins' => '（学生証がない場合はコインで支払い。20元硬貨をご用意ください。）\n',
			'busRuleIdCard' => '• 学生証または教職員証を持参してください（未発行の場合は身分証で識別）\n',
			'busRuleNoIdCard' => '• 証明書を持参していない場合はキャンセル待ちエリアに並んでください\n',
			'busRuleFollowingTime' => '予約した便の時間に従ってください（例：8:20と9:30は別便）。規定に従わない場合は乗車できず、違反点数が加算されます。\n',
			'busRuleLateAndNoReservation' => '• 遅刻または未予約の乗客はキャンセル待ちエリアに並んでください。\nキャンセル待ち乗車\n• 正規レーンで認証に通らなかった場合はキャンセル待ちエリアへ。\n• 予約者全員が乗車後、順番に乗車できます。\n',
			'busRuleStandbyTitle' => 'キャンセル待ち乗車\n',
			'busRuleStandbyRule' => '• 予約した便以外に乗車した場合は違反とし、違反点数1点が加算されます。\n• 教員の臨時休講・調課による場合は所属学科に申請し、管理者が違反記録を取り消します。\n',
			'busRuleFineTitle' => '罰金\n',
			'busRuleFineRule' => '• 違反3回までは点数加算なし。4回目から違反点数が記録され、各点数につきバス運賃相当の罰金が発生します。\n• 違反点数は学期末まで集計（前期1/31、後期8/31）。新学期に点数はリセットされます。罰金未納の場合、次学期の予約権限が停止されます。\n• 罰金は違反明細を印刷後、自動支払機または総務処出納で支払い、領収書で総務処事務組にて消込してください。消込完了翌日午前4時以降、9時以降のバスが予約可能になります。\n• 違反点数に疑義がある場合は、違反発生日から10日以内に総務処事務組に確認してください。\n',
			'busViolationRecordEmpty' => 'バスの違反記録はありません～',
			'schoolCloseCourseHint' => '学校が時間割システムを閉鎖しています。一時的に解決できません。\n学校にお問い合わせください。',
			'loginAuth' => 'ログイン認証',
			'clickShowDescription' => '説明を表示',
			'mobileNkustLoginHint' => 'ウェブページの読み込みを待ちます。\n学籍番号とパスワードは自動入力されます。\nreCaptchaを完了してログインをクリックすると自動的にリダイレクトされます。',
			'mobileNkustLoginDescription' => '学校が従来のクローラー機能を閉鎖したため、新しいモバイル校務システムでのログインが必要です。ログイン成功後は自動的にリダイレクトされます。証明書の期限切れ以外では再認証はほとんど不要です。「記住我」にチェックすることを強くお勧めします。',
			'leaveApplyRecord' => '欠席申請記録',
			'testTitle' => 'テストタイトル',
			'testContent' => '内容\n2行目',
			'requestPermission' => '権限を要求',
			'showNow' => '今すぐ表示',
			'showInFiveSeconds' => '5秒後に表示',
			'setWeekDay' => '曜日を設定',
			'setTimeOfDay' => '時間を設定',
			'scheduleWeeklyNotifyTitle' => '毎週の通知を設定',
			'scheduleWeeklyNotifyContent' => ({required Object arg1, required Object arg2}) => '毎週${arg1} ${arg2}に設定',
			'getPendingNotificationList' => '保留中の通知リスト（タップでキャンセル）',
			'cancelAll' => 'すべてキャンセル',
			'dialogUtilTest' => 'ダイアログテスト',
			'localNotificationTest' => 'ローカル通知テスト',
			'newFeature' => '新機能',
			'latestAnnouncements' => '最新のお知らせ',
			'postAnnouncement' => '投稿',
			'loginCardTitle' => '学務システムにログイン',
			'loginCardSubtitle' => 'ログインして今日の時間割と成績を確認',
			'campusServicesSection' => 'キャンパスサービス',
			'appSection' => 'アプリケーション',
			'schoolInfoSubtitle' => '学内電話番号と年間行事予定',
			'announcementReviewSubtitle' => '学内イベントの投稿・審査管理',
			'accountSheetTitle' => 'アカウントと設定',
			'viewProfileHint' => 'プロフィールを表示・編集',
			'busRoutesSection' => '学内バス路線',
			'courseNotLoaded' => '時間割がまだ読み込まれていません。タップして表示',
			'busDemoSubtitle' => 'サンプル路線と時刻表',
			'tabMore' => 'キャンパス',
			'tabBus' => 'バス',
			_ => null,
		};
	}
}
