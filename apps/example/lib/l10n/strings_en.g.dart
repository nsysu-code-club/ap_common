///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef AppLocalizationsEn = AppLocalizations; // ignore: unused_element
class AppLocalizations with BaseTranslations<AppLocale, AppLocalizations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final app = AppLocalizations.of(context);
	static AppLocalizations of(BuildContext context) => InheritedLocaleData.of<AppLocale, AppLocalizations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	AppLocalizations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, AppLocalizations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, AppLocalizations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final AppLocalizations _root = this; // ignore: unused_field

	AppLocalizations $copyWith({TranslationMetadata<AppLocale, AppLocalizations>? meta}) => AppLocalizations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Google sign-in is not configured for this iOS example.'
	String get exampleGoogleSignInUnavailable => 'Google sign-in is not configured for this iOS example.';

	/// en: 'NKUST AP'
	String get appName => 'NKUST AP';

	/// en: '* Fix part of device home widget error.'
	String get updateNoteContent => '* Fix part of device home widget error.';

	/// en: 'https://github.com/NKUST-ITC/NKUST-AP-Flutter This project is licensed under the terms of the MIT license: The MIT License (MIT) Copyright © 2021 Rainvisitor This project is Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.'
	String get aboutOpenSourceContent => 'https://github.com/NKUST-ITC/NKUST-AP-Flutter\n\nThis project is licensed under the terms of the MIT license:\nThe MIT License (MIT)\n\nCopyright © 2021 Rainvisitor\n\nThis project is Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.';

	/// en: 'Chosen Date: $arg1'
	String busPickDate({required Object arg1}) => 'Chosen Date: ${arg1}';

	/// en: 'Chosen Date'
	String get busNotPickDate => 'Chosen Date';

	/// en: '($arg1 / $arg2)'
	String busCount({required Object arg1, required Object arg2}) => '(${arg1} / ${arg2})';

	/// en: 'To YanChao, Scheduled date：'
	String get busJiangongReservations => 'To YanChao, Scheduled date：';

	/// en: 'To JianGong, Scheduled date：'
	String get busYanchaoReservations => 'To JianGong, Scheduled date：';

	/// en: 'To YanChao, Departure time：'
	String get busJiangong => 'To YanChao, Departure time：';

	/// en: 'To JianGong, Departure time：'
	String get busYanchao => 'To JianGong, Departure time：';

	/// en: '√ To YanChao, Departure time：'
	String get busJiangongReserved => '√ To YanChao, Departure time：';

	/// en: '√ To JianGong, Departure time：'
	String get busYanchaoReserved => '√ To JianGong, Departure time：';

	/// en: 'Bus Reservation'
	String get busReserve => 'Bus Reservation';

	/// en: 'Bus Record'
	String get busReservations => 'Bus Record';

	/// en: 'Bus Penalty'
	String get busViolationRecords => 'Bus Penalty';

	/// en: 'Unpaid'
	String get unpaid => 'Unpaid';

	/// en: 'Paid'
	String get paid => 'Paid';

	/// en: 'Cancel Bus Reservation'
	String get busCancelReserve => 'Cancel Bus Reservation';

	/// en: 'Reserve this bus?'
	String get busReserveConfirmTitle => 'Reserve this bus?';

	/// en: 'Are you sure to reserve a seat from $arg1 at $arg2 ?'
	String busReserveConfirmContent({required Object arg1, required Object arg2}) => 'Are you sure to reserve a seat from ${arg1} at ${arg2} ?';

	/// en: '<b>Cancel</b> this reservation?'
	String get busCancelReserveConfirmTitle => '<b>Cancel</b> this reservation?';

	/// en: 'Are you sure to cancel a seat from $arg1 at $arg2 ?'
	String busCancelReserveConfirmContent({required Object arg1, required Object arg2}) => 'Are you sure to cancel a seat from ${arg1} at ${arg2} ?';

	/// en: 'Are you sure to cancel a seat from '
	String get busCancelReserveConfirmContent1 => 'Are you sure to cancel a seat from ';

	/// en: ' to '
	String get busCancelReserveConfirmContent2 => ' to ';

	/// en: ' ?'
	String get busCancelReserveConfirmContent3 => ' ?';

	/// en: 'JianGong to YanChao'
	String get busFromJiangong => 'JianGong to YanChao';

	/// en: 'YanChao to JianGong'
	String get busFromYanchao => 'YanChao to JianGong';

	/// en: 'Date'
	String get busReserveDate => 'Date';

	/// en: 'Location'
	String get busReserveLocation => 'Location';

	/// en: 'Time'
	String get busReserveTime => 'Time';

	/// en: 'JianGong'
	String get jiangong => 'JianGong';

	/// en: 'YanChao'
	String get yanchao => 'YanChao';

	/// en: 'first'
	String get first => 'first';

	/// en: 'Nanzi'
	String get nanzi => 'Nanzi';

	/// en: 'Qijin'
	String get qijin => 'Qijin';

	/// en: 'Reserve'
	String get reserve => 'Reserve';

	/// en: 'Reserved'
	String get reserved => 'Reserved';

	/// en: 'Can't reserve'
	String get canNotReserve => 'Can\'t reserve';

	/// en: 'Special Bus'
	String get specialBus => 'Special Bus';

	/// en: 'Trial Bus'
	String get trialBus => 'Trial Bus';

	/// en: 'Successfully Reserved!'
	String get busReserveSuccess => 'Successfully Reserved!';

	/// en: 'Date'
	String get busReserveCancelDate => 'Date';

	/// en: 'Location'
	String get busReserveCancelLocation => 'Location';

	/// en: 'Time'
	String get busReserveCancelTime => 'Time';

	/// en: 'Successfully Canceled!'
	String get busCancelReserveSuccess => 'Successfully Canceled!';

	/// en: 'Fail Canceled'
	String get busCancelReserveFail => 'Fail Canceled';

	/// en: 'Oops! You haven't reserved any bus~ Ride public transport to save the Earth 😋'
	String get busReservationEmpty => 'Oops! You haven\'t reserved any bus~\n Ride public transport to save the Earth 😋';

	/// en: 'Oops! No bus today~ Please choose another date 😋'
	String get busEmpty => 'Oops! No bus today~\n Please choose another date 😋';

	/// en: 'You have not chosen a date! Please choose a date first $arg1'
	String busNotPick({required Object arg1}) => 'You have not chosen a date!\n Please choose a date first ${arg1}';

	/// en: 'Reminder will pop up 30 mins before reserved bus ! If you reserved or canceled the seat via website, please restart the app.'
	String get busNotifyHint => 'Reminder will pop up 30 mins before reserved bus !\nIf you reserved or canceled the seat via website, please restart the app.';

	/// en: 'You've got a bus departing at $arg1 from $arg2!'
	String busNotifyContent({required Object arg1, required Object arg2}) => 'You\'ve got a bus departing at ${arg1} from ${arg2}!';

	/// en: 'JianGong'
	String get busNotifyJiangong => 'JianGong';

	/// en: 'YanChao'
	String get busNotifyYanchao => 'YanChao';

	/// en: 'Bus Reservation Reminder'
	String get busNotify => 'Bus Reservation Reminder';

	/// en: 'Reminder 30 mins before reserved bus'
	String get busNotifySubTitle => 'Reminder 30 mins before reserved bus';

	/// en: 'Bus Reservation'
	String get bus => 'Bus Reservation';

	/// en: 'From JianGong'
	String get fromJiangong => 'From JianGong';

	/// en: 'From YanChao'
	String get fromYanchao => 'From YanChao';

	/// en: 'From First'
	String get fromFirst => 'From First';

	/// en: 'Destination'
	String get destination => 'Destination';

	/// en: 'Reserving...'
	String get reserving => 'Reserving...';

	/// en: 'Canceling...'
	String get canceling => 'Canceling...';

	/// en: 'Bus system perhaps broken!!!'
	String get busFailInfinity => 'Bus system perhaps broken!!!';

	/// en: 'Reserve Deadline'
	String get reserveDeadline => 'Reserve Deadline';

	/// en: 'Bus Rule'
	String get busRule => 'Bus Rule';

	/// en: 'For first-time login, please fill in the last four number of your ID as your password'
	String get firstLoginHint => 'For first-time login, please fill in the last four number of your ID as your password';

	/// en: 'Name：$arg1 Student ID：$arg2 '
	String searchStudentIdFormat({required Object arg1, required Object arg2}) => 'Name：${arg1}\nStudent ID：${arg2}\n';

	/// en: 'No Expiration'
	String get noExpiration => 'No Expiration';

	/// en: 'Punch'
	String get punch => 'Punch';

	/// en: 'Punch Success'
	String get punchSuccess => 'Punch Success';

	/// en: 'Non Course Time'
	String get nonCourseTime => 'Non Course Time';

	/// en: 'Offline Score'
	String get offlineScore => 'Offline Score';

	/// en: 'Offline Bus Reservations'
	String get offlineBusReservations => 'Offline Bus Reservations';

	/// en: 'Offline absent Report'
	String get offlineLeaveData => 'Offline absent Report';

	/// en: 'Bus Reservation '
	String get busRuleReservationRuleTitle => 'Bus Reservation\n';

	/// en: '• Go to '
	String get busRuleTravelby => '• Go to ';

	/// en: ' Bus Reservation System can reserve bus in 14 days in need to follow office of general affairs's time requirement '
	String get busRuleFourteenDay => ' Bus Reservation System can reserve bus in 14 days\nin need to follow office of general affairs\'s time requirement\n';

	/// en: '■ The classes before 9 A.M.：Please do resevation in 15 hours ago. ■ The classes after 9 A.M.：Please do resevation in 5 hours ago '
	String get busRuleReservationTime => '■ The classes before 9 A.M.：Please do resevation in 15 hours ago.\n■ The classes after 9 A.M.：Please do resevation in 5 hours ago\n';

	/// en: '• Cancelation Time '
	String get busRuleCancellingTitle => '• Cancelation Time\n';

	/// en: '■ The classes before 9 A.M.：Please do calcelation in 15 hours ago. ■ The classes after 9 A.M.：Please do calcelation in 5 hours ago '
	String get busRuleCancelingTime => '■ The classes before 9 A.M.：Please do calcelation in 15 hours ago.\n■ The classes after 9 A.M.：Please do calcelation in 5 hours ago\n';

	/// en: '• All students, teachers and staff reserve bus should be follow the rule，if you late or absent from class or work, please be responsible of whatever you do. '
	String get busRuleBusRuleFollow => '• All students, teachers and staff reserve bus should be follow the rule，if you late or absent from class or work, please be responsible of whatever you do.\n';

	/// en: 'Take Bus '
	String get busRuleTakeOn => 'Take Bus\n';

	/// en: '• Every time take bus need pay 20 NTD'
	String get busRuleTwentyDollars => '• Every time take bus need pay 20 NTD';

	/// en: '（Use coin when you don't got Student ID，Please prepare 20 dollars coin first.） '
	String get busRulePrepareCoins => '（Use coin when you don\'t got Student ID，Please prepare 20 dollars coin first.）\n';

	/// en: '• Please take your student or staff ID(Before you get student or staff ID, Please use your ID) take bus '
	String get busRuleIdCard => '• Please take your student or staff ID(Before you get student or staff ID, Please use your ID) take bus\n';

	/// en: '• If you don't take any ID, please line up standby zone '
	String get busRuleNoIdCard => '• If you don\'t take any ID, please line up standby zone\n';

	/// en: 'Please follow the bus schedule (ex. 8:20 and 9:30 is different class), People can't take bus and get violation point who don follow rule. '
	String get busRuleFollowingTime => 'Please follow the bus schedule (ex. 8:20 and 9:30 is different class), People can\'t take bus and get violation point who don	 follow rule.\n';

	/// en: '• Late or don't reserved passenger, please line up standby zone waiting. Standby • If you can't pass verification(ex. Don't reserved)，Please change to standby zone waiting. "• Standby passenger can get on the bus in order after waiting all reserved passangers got on the bus. '
	String get busRuleLateAndNoReservation => '• Late or don\'t reserved passenger, please line up standby zone waiting.\nStandby\n• If you can\'t pass verification(ex. Don\'t reserved)，Please change to standby zone waiting.\n"• Standby passenger can get on the bus in order after waiting all reserved passangers got on the bus.\n';

	/// en: 'Standby '
	String get busRuleStandbyTitle => 'Standby\n';

	/// en: '• If you don't take the bus but you reserved already，It's a violation，and you get a violation point(ex. 8:20 and 9:30 is different class • If your class teacher take temporary leave、transfer cause you need take the bus early or lately，you need apply to class department then，deparment bus system administator will logout violation. '
	String get busRuleStandbyRule => '• If you don\'t take the bus but you reserved already，It\'s a violation，and you get a violation point(ex. 8:20 and 9:30 is different class\n• If your class teacher take temporary leave、transfer cause you need take the bus early or lately，you need apply to class department then，deparment bus system administator will logout violation.\n';

	/// en: 'Fine '
	String get busRuleFineTitle => 'Fine\n';

	/// en: '• Fine Calculation，violation times below 3 times don't get point, From 4th violation begin recording point，every point should be pay off fine equal to bus fare. • Violation point recording until the end of the semester(1st Semester ended at 1/31，2nd Semester ended at 8/31)，violation point will restart recording. When you not paid off fine，next semester will stop your reservation right until you pay off fine. • Go to the auto payment machine or Office of General Affairs cashier pay off fine after you print violation statement by yourself, After paid off, go to Office of General Affairs General Affairs Division write off payment by receipt(Write off payment need receipt on the day.)，After write off and the next day 4A.M. will be reserve class after 9.A.M.. • If you have any suspicion about violation point，please go to Office of General Affairs General Affairs Division check violation directly in 10 days(included holidays). '
	String get busRuleFineRule => '• Fine Calculation，violation times below 3 times don\'t get point, From 4th violation begin recording point，every point should be pay off fine equal to bus fare.\n• Violation point recording until the end of the semester(1st Semester ended at 1/31，2nd Semester ended at 8/31)，violation point will restart recording. When you not paid off fine，next semester will stop your reservation right until you pay off fine.\n• Go to the auto payment machine or Office of General Affairs cashier pay off fine after you print violation statement by yourself, After paid off, go to Office of General Affairs General Affairs Division write off payment by receipt(Write off payment need receipt on the day.)，After write off and the next day 4A.M. will be reserve class after 9.A.M..\n• If you have any suspicion about violation point，please go to Office of General Affairs General Affairs Division check violation directly in 10 days(included holidays).\n';

	/// en: 'Good！No any bus violation record～'
	String get busViolationRecordEmpty => 'Good！No any bus violation record～';

	/// en: 'School close course system, we can't solve it temporarily. Any problems are recommended to the school.'
	String get schoolCloseCourseHint => 'School close course system, we can\'t solve it temporarily.\nAny problems are recommended to the school.';

	/// en: 'Login Authentication'
	String get loginAuth => 'Login Authentication';

	/// en: 'Description'
	String get clickShowDescription => 'Description';

	/// en: 'Wait for the webpage to finish loading, the student ID and password will be filled in automatically. After completing the Google reCaptcha and clicking login, it will automatically redirected.'
	String get mobileNkustLoginHint => 'Wait for the webpage to finish loading, the student ID and password will be filled in automatically.\nAfter completing the Google reCaptcha and clicking login, it will automatically redirected.';

	/// en: 'Because the school has closed the original crawler function, this version needs to be logged in through the new version of the mobile school system. After successful login, it will be redirected automatically. Unless the certificate expires, repeated verification is rarely required. It is strongly recommended to "記住我" to check it.。'
	String get mobileNkustLoginDescription => 'Because the school has closed the original crawler function, this version needs to be logged in through the new version of the mobile school system. After successful login, it will be redirected automatically. Unless the certificate expires, repeated verification is rarely required. It is strongly recommended to "記住我" to check it.。';

	/// en: 'Apply Records'
	String get leaveApplyRecord => 'Apply Records';

	/// en: 'Test Title'
	String get testTitle => 'Test Title';

	/// en: 'Content Second lines'
	String get testContent => 'Content\nSecond lines';

	/// en: 'Request Permission'
	String get requestPermission => 'Request Permission';

	/// en: 'Show now'
	String get showNow => 'Show now';

	/// en: 'Show in 5 second'
	String get showInFiveSeconds => 'Show in 5 second';

	/// en: 'Set Week Day'
	String get setWeekDay => 'Set Week Day';

	/// en: 'Set Time Of Day'
	String get setTimeOfDay => 'Set Time Of Day';

	/// en: 'Schedule Weekly Notify'
	String get scheduleWeeklyNotifyTitle => 'Schedule Weekly Notify';

	/// en: 'Schedule in every $arg1 $arg2'
	String scheduleWeeklyNotifyContent({required Object arg1, required Object arg2}) => 'Schedule in every ${arg1} ${arg2}';

	/// en: 'Pending Notification List(Click to cancel)'
	String get getPendingNotificationList => 'Pending Notification List(Click to cancel)';

	/// en: 'Cancel All'
	String get cancelAll => 'Cancel All';

	/// en: 'Dialog Util Test'
	String get dialogUtilTest => 'Dialog Util Test';

	/// en: 'Local Notification Test'
	String get localNotificationTest => 'Local Notification Test';

	/// en: 'New'
	String get newFeature => 'New';

	/// en: 'Latest Announcements'
	String get latestAnnouncements => 'Latest Announcements';

	/// en: 'Submit'
	String get postAnnouncement => 'Submit';

	/// en: 'Sign In to Campus Portal'
	String get loginCardTitle => 'Sign In to Campus Portal';

	/// en: 'Sign in to view today's schedule and semester grades'
	String get loginCardSubtitle => 'Sign in to view today\'s schedule and semester grades';

	/// en: 'Campus Services'
	String get campusServicesSection => 'Campus Services';

	/// en: 'Application'
	String get appSection => 'Application';

	/// en: 'Campus directory & academic calendar'
	String get schoolInfoSubtitle => 'Campus directory & academic calendar';

	/// en: 'Submit or manage campus announcements'
	String get announcementReviewSubtitle => 'Submit or manage campus announcements';

	/// en: 'Account & Settings'
	String get accountSheetTitle => 'Account & Settings';

	/// en: 'View and edit profile'
	String get viewProfileHint => 'View and edit profile';

	/// en: 'Campus Bus Routes'
	String get busRoutesSection => 'Campus Bus Routes';

	/// en: 'Timetable not loaded yet, tap to view'
	String get courseNotLoaded => 'Timetable not loaded yet, tap to view';

	/// en: 'Sample routes and departure times'
	String get busDemoSubtitle => 'Sample routes and departure times';

	/// en: 'Campus'
	String get tabMore => 'Campus';

	/// en: 'Bus'
	String get tabBus => 'Bus';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on AppLocalizations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'exampleGoogleSignInUnavailable' => 'Google sign-in is not configured for this iOS example.',
			'appName' => 'NKUST AP',
			'updateNoteContent' => '* Fix part of device home widget error.',
			'aboutOpenSourceContent' => 'https://github.com/NKUST-ITC/NKUST-AP-Flutter\n\nThis project is licensed under the terms of the MIT license:\nThe MIT License (MIT)\n\nCopyright © 2021 Rainvisitor\n\nThis project is Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.',
			'busPickDate' => ({required Object arg1}) => 'Chosen Date: ${arg1}',
			'busNotPickDate' => 'Chosen Date',
			'busCount' => ({required Object arg1, required Object arg2}) => '(${arg1} / ${arg2})',
			'busJiangongReservations' => 'To YanChao, Scheduled date：',
			'busYanchaoReservations' => 'To JianGong, Scheduled date：',
			'busJiangong' => 'To YanChao, Departure time：',
			'busYanchao' => 'To JianGong, Departure time：',
			'busJiangongReserved' => '√ To YanChao, Departure time：',
			'busYanchaoReserved' => '√ To JianGong, Departure time：',
			'busReserve' => 'Bus Reservation',
			'busReservations' => 'Bus Record',
			'busViolationRecords' => 'Bus Penalty',
			'unpaid' => 'Unpaid',
			'paid' => 'Paid',
			'busCancelReserve' => 'Cancel Bus Reservation',
			'busReserveConfirmTitle' => 'Reserve this bus?',
			'busReserveConfirmContent' => ({required Object arg1, required Object arg2}) => 'Are you sure to reserve a seat from ${arg1} at ${arg2} ?',
			'busCancelReserveConfirmTitle' => '<b>Cancel</b> this reservation?',
			'busCancelReserveConfirmContent' => ({required Object arg1, required Object arg2}) => 'Are you sure to cancel a seat from ${arg1} at ${arg2} ?',
			'busCancelReserveConfirmContent1' => 'Are you sure to cancel a seat from ',
			'busCancelReserveConfirmContent2' => ' to ',
			'busCancelReserveConfirmContent3' => ' ?',
			'busFromJiangong' => 'JianGong to YanChao',
			'busFromYanchao' => 'YanChao to JianGong',
			'busReserveDate' => 'Date',
			'busReserveLocation' => 'Location',
			'busReserveTime' => 'Time',
			'jiangong' => 'JianGong',
			'yanchao' => 'YanChao',
			'first' => 'first',
			'nanzi' => 'Nanzi',
			'qijin' => 'Qijin',
			'reserve' => 'Reserve',
			'reserved' => 'Reserved',
			'canNotReserve' => 'Can\'t reserve',
			'specialBus' => 'Special Bus',
			'trialBus' => 'Trial Bus',
			'busReserveSuccess' => 'Successfully Reserved!',
			'busReserveCancelDate' => 'Date',
			'busReserveCancelLocation' => 'Location',
			'busReserveCancelTime' => 'Time',
			'busCancelReserveSuccess' => 'Successfully Canceled!',
			'busCancelReserveFail' => 'Fail Canceled',
			'busReservationEmpty' => 'Oops! You haven\'t reserved any bus~\n Ride public transport to save the Earth 😋',
			'busEmpty' => 'Oops! No bus today~\n Please choose another date 😋',
			'busNotPick' => ({required Object arg1}) => 'You have not chosen a date!\n Please choose a date first ${arg1}',
			'busNotifyHint' => 'Reminder will pop up 30 mins before reserved bus !\nIf you reserved or canceled the seat via website, please restart the app.',
			'busNotifyContent' => ({required Object arg1, required Object arg2}) => 'You\'ve got a bus departing at ${arg1} from ${arg2}!',
			'busNotifyJiangong' => 'JianGong',
			'busNotifyYanchao' => 'YanChao',
			'busNotify' => 'Bus Reservation Reminder',
			'busNotifySubTitle' => 'Reminder 30 mins before reserved bus',
			'bus' => 'Bus Reservation',
			'fromJiangong' => 'From JianGong',
			'fromYanchao' => 'From YanChao',
			'fromFirst' => 'From First',
			'destination' => 'Destination',
			'reserving' => 'Reserving...',
			'canceling' => 'Canceling...',
			'busFailInfinity' => 'Bus system perhaps broken!!!',
			'reserveDeadline' => 'Reserve Deadline',
			'busRule' => 'Bus Rule',
			'firstLoginHint' => 'For first-time login, please fill in the last four number of your ID as your password',
			'searchStudentIdFormat' => ({required Object arg1, required Object arg2}) => 'Name：${arg1}\nStudent ID：${arg2}\n',
			'noExpiration' => 'No Expiration',
			'punch' => 'Punch',
			'punchSuccess' => 'Punch Success',
			'nonCourseTime' => 'Non Course Time',
			'offlineScore' => 'Offline Score',
			'offlineBusReservations' => 'Offline Bus Reservations',
			'offlineLeaveData' => 'Offline absent Report',
			'busRuleReservationRuleTitle' => 'Bus Reservation\n',
			'busRuleTravelby' => '• Go to ',
			'busRuleFourteenDay' => ' Bus Reservation System can reserve bus in 14 days\nin need to follow office of general affairs\'s time requirement\n',
			'busRuleReservationTime' => '■ The classes before 9 A.M.：Please do resevation in 15 hours ago.\n■ The classes after 9 A.M.：Please do resevation in 5 hours ago\n',
			'busRuleCancellingTitle' => '• Cancelation Time\n',
			'busRuleCancelingTime' => '■ The classes before 9 A.M.：Please do calcelation in 15 hours ago.\n■ The classes after 9 A.M.：Please do calcelation in 5 hours ago\n',
			'busRuleBusRuleFollow' => '• All students, teachers and staff reserve bus should be follow the rule，if you late or absent from class or work, please be responsible of whatever you do.\n',
			'busRuleTakeOn' => 'Take Bus\n',
			'busRuleTwentyDollars' => '• Every time take bus need pay 20 NTD',
			'busRulePrepareCoins' => '（Use coin when you don\'t got Student ID，Please prepare 20 dollars coin first.）\n',
			'busRuleIdCard' => '• Please take your student or staff ID(Before you get student or staff ID, Please use your ID) take bus\n',
			'busRuleNoIdCard' => '• If you don\'t take any ID, please line up standby zone\n',
			'busRuleFollowingTime' => 'Please follow the bus schedule (ex. 8:20 and 9:30 is different class), People can\'t take bus and get violation point who don	 follow rule.\n',
			'busRuleLateAndNoReservation' => '• Late or don\'t reserved passenger, please line up standby zone waiting.\nStandby\n• If you can\'t pass verification(ex. Don\'t reserved)，Please change to standby zone waiting.\n"• Standby passenger can get on the bus in order after waiting all reserved passangers got on the bus.\n',
			'busRuleStandbyTitle' => 'Standby\n',
			'busRuleStandbyRule' => '• If you don\'t take the bus but you reserved already，It\'s a violation，and you get a violation point(ex. 8:20 and 9:30 is different class\n• If your class teacher take temporary leave、transfer cause you need take the bus early or lately，you need apply to class department then，deparment bus system administator will logout violation.\n',
			'busRuleFineTitle' => 'Fine\n',
			'busRuleFineRule' => '• Fine Calculation，violation times below 3 times don\'t get point, From 4th violation begin recording point，every point should be pay off fine equal to bus fare.\n• Violation point recording until the end of the semester(1st Semester ended at 1/31，2nd Semester ended at 8/31)，violation point will restart recording. When you not paid off fine，next semester will stop your reservation right until you pay off fine.\n• Go to the auto payment machine or Office of General Affairs cashier pay off fine after you print violation statement by yourself, After paid off, go to Office of General Affairs General Affairs Division write off payment by receipt(Write off payment need receipt on the day.)，After write off and the next day 4A.M. will be reserve class after 9.A.M..\n• If you have any suspicion about violation point，please go to Office of General Affairs General Affairs Division check violation directly in 10 days(included holidays).\n',
			'busViolationRecordEmpty' => 'Good！No any bus violation record～',
			'schoolCloseCourseHint' => 'School close course system, we can\'t solve it temporarily.\nAny problems are recommended to the school.',
			'loginAuth' => 'Login Authentication',
			'clickShowDescription' => 'Description',
			'mobileNkustLoginHint' => 'Wait for the webpage to finish loading, the student ID and password will be filled in automatically.\nAfter completing the Google reCaptcha and clicking login, it will automatically redirected.',
			'mobileNkustLoginDescription' => 'Because the school has closed the original crawler function, this version needs to be logged in through the new version of the mobile school system. After successful login, it will be redirected automatically. Unless the certificate expires, repeated verification is rarely required. It is strongly recommended to "記住我" to check it.。',
			'leaveApplyRecord' => 'Apply Records',
			'testTitle' => 'Test Title',
			'testContent' => 'Content\nSecond lines',
			'requestPermission' => 'Request Permission',
			'showNow' => 'Show now',
			'showInFiveSeconds' => 'Show in 5 second',
			'setWeekDay' => 'Set Week Day',
			'setTimeOfDay' => 'Set Time Of Day',
			'scheduleWeeklyNotifyTitle' => 'Schedule Weekly Notify',
			'scheduleWeeklyNotifyContent' => ({required Object arg1, required Object arg2}) => 'Schedule in every ${arg1} ${arg2}',
			'getPendingNotificationList' => 'Pending Notification List(Click to cancel)',
			'cancelAll' => 'Cancel All',
			'dialogUtilTest' => 'Dialog Util Test',
			'localNotificationTest' => 'Local Notification Test',
			'newFeature' => 'New',
			'latestAnnouncements' => 'Latest Announcements',
			'postAnnouncement' => 'Submit',
			'loginCardTitle' => 'Sign In to Campus Portal',
			'loginCardSubtitle' => 'Sign in to view today\'s schedule and semester grades',
			'campusServicesSection' => 'Campus Services',
			'appSection' => 'Application',
			'schoolInfoSubtitle' => 'Campus directory & academic calendar',
			'announcementReviewSubtitle' => 'Submit or manage campus announcements',
			'accountSheetTitle' => 'Account & Settings',
			'viewProfileHint' => 'View and edit profile',
			'busRoutesSection' => 'Campus Bus Routes',
			'courseNotLoaded' => 'Timetable not loaded yet, tap to view',
			'busDemoSubtitle' => 'Sample routes and departure times',
			'tabMore' => 'Campus',
			'tabBus' => 'Bus',
			_ => null,
		};
	}
}
