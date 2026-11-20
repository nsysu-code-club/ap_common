///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef ApLocalizationsEn = ApLocalizations; // ignore: unused_element
class ApLocalizations with BaseTranslations<AppLocale, ApLocalizations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final ap = ApLocalizations.of(context);
	static ApLocalizations of(BuildContext context) => InheritedLocaleData.of<AppLocale, ApLocalizations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	ApLocalizations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, ApLocalizations>? meta})
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
	@override final TranslationMetadata<AppLocale, ApLocalizations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final ApLocalizations _root = this; // ignore: unused_field

	ApLocalizations $copyWith({TranslationMetadata<AppLocale, ApLocalizations>? meta}) => ApLocalizations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'What's New'
	String get updateNoteTitle => 'What\'s New';

	/// en: 'Home'
	String get home => 'Home';

	/// en: 'We did all the things Only did the school leave us.'
	String get splashContent => 'We did all the things\nOnly did the school leave us.';

	/// en: 'Share'
	String get share => 'Share';

	/// en: 'Are you a teacher?'
	String get teacherConfirmTitle => 'Are you a teacher?';

	/// en: 'This app is created for students.'
	String get teacherConfirmContent => 'This app is created for students.';

	/// en: 'Continue'
	String get continueToUse => 'Continue';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'View'
	String get clickToView => 'View';

	/// en: 'Login Successful'
	String get loginSuccess => 'Login Successful';

	/// en: 'An error has occurred.'
	String get somethingError => 'An error has occurred.';

	/// en: 'Connection timed out. Please try again later.'
	String get timeoutMessage => 'Connection timed out. Please try again later.';

	/// en: 'Please login first'
	String get loginFirst => 'Please login first';

	/// en: 'Are you sure you want to log out?'
	String get logoutCheck => 'Are you sure you want to log out?';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'AP'
	String get dotAp => 'AP';

	/// en: 'Absence record'
	String get dotLeave => 'Absence record';

	/// en: 'Campus Bus'
	String get dotBus => 'Campus Bus';

	/// en: 'Calendar'
	String get schedule => 'Calendar';

	/// en: 'Loading'
	String get loading => 'Loading';

	/// en: 'Student ID'
	String get idHint => 'Student ID';

	/// en: 'Password'
	String get passwordHint => 'Password';

	/// en: 'Remember me'
	String get rememberPassword => 'Remember me';

	/// en: 'Change Password'
	String get changePassword => 'Change Password';

	/// en: 'New Password'
	String get newPassword => 'New Password';

	/// en: 'Confirm New Password'
	String get newPasswordConfirm => 'Confirm New Password';

	/// en: 'Passwords do not match, please try again !'
	String get newPasswordNotMatchHint => 'Passwords do not match, please try again !';

	/// en: 'Passwords at least $arg1 characters.'
	String newPasswordLeastCharacter({required Object arg1}) => 'Passwords at least ${arg1} characters.';

	/// en: 'Change success, please use new password to login'
	String get changePasswordSuccessHint1 => 'Change success, please use new password to login';

	/// en: 'Change success, app will use new password to login'
	String get changePasswordSuccessHint2 => 'Change success, app will use new password to login';

	/// en: 'Auto login'
	String get autoLogin => 'Auto login';

	/// en: 'v.$arg1'
	String version({required Object arg1}) => 'v.${arg1}';

	/// en: 'Logging...'
	String get logining => 'Logging...';

	/// en: 'Calling'
	String get callPhoneTitle => 'Calling';

	/// en: 'Do you want to call $arg1?'
	String callPhoneContent({required Object arg1}) => 'Do you want to call ${arg1}?';

	/// en: 'Call'
	String get callPhone => 'Call';

	/// en: 'Yes'
	String get determine => 'Yes';

	/// en: 'No'
	String get cancel => 'No';

	/// en: 'Do you want to add $arg1 to your calendar?'
	String addCalendarContent({required Object arg1}) => 'Do you want to add ${arg1} to your calendar?';

	/// en: 'An error has occurred, click here to retry'
	String get clickToRetry => 'An error has occurred, click here to retry';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Unknown'
	String get unknown => 'Unknown';

	/// en: ' campus'
	String get campus => ' campus';

	/// en: 'Got it'
	String get iKnow => 'Got it';

	/// en: 'Oops! No buses available now~ Please choose another one.'
	String get busEmpty => 'Oops! No buses available now~\nPlease choose another one.';

	/// en: 'Oops! No classes in this semester~ Please choose another one. 😋'
	String get courseEmpty => 'Oops! No classes in this semester~\nPlease choose another one. 😋';

	/// en: 'OK'
	String get ok => 'OK';

	/// en: 'Class：$arg1 Professor：$arg2 Location：$arg3 Time：$arg4'
	String courseDialogMessages({required Object arg1, required Object arg2, required Object arg3, required Object arg4}) => 'Class：${arg1}\nProfessor：${arg2}\nLocation：${arg3}\nTime：${arg4}';

	/// en: 'Class'
	String get courseDialogName => 'Class';

	/// en: 'Professor'
	String get courseDialogProfessor => 'Professor';

	/// en: 'Location'
	String get courseDialogLocation => 'Location';

	/// en: 'Time'
	String get courseDialogTime => 'Time';

	/// en: 'Class Info'
	String get courseDialogTitle => 'Class Info';

	/// en: 'Rotate the screen to see weekend schedule $arg1'
	String courseHoliday({required Object arg1}) => 'Rotate the screen to see weekend schedule ${arg1}';

	/// en: 'Click subject to show more.'
	String get courseClickHint => 'Click subject to show more.';

	/// en: 'No internet connection'
	String get noInternet => 'No internet connection';

	/// en: 'Internet settings'
	String get settingInternet => 'Internet settings';

	/// en: 'Oops! No data for this semester~ Please choose another semester 😋'
	String get scoreEmpty => 'Oops! No data for this semester~\nPlease choose another semester 😋';

	/// en: 'Subject'
	String get subject => 'Subject';

	/// en: 'Midterm'
	String get midtermScoreTitle => 'Midterm';

	/// en: 'Final'
	String get semesterScoreTitle => 'Final';

	/// en: 'Midterm Score'
	String get midtermScore => 'Midterm Score';

	/// en: 'Final Score'
	String get finalScore => 'Final Score';

	/// en: 'General Score'
	String get generalScore => 'General Score';

	/// en: 'Semester Score'
	String get semesterScore => 'Semester Score';

	/// en: 'Conduct Score'
	String get conductScore => 'Conduct Score';

	/// en: 'Credits Taken/Earned'
	String get creditsTakenEarned => 'Credits Taken/Earned';

	/// en: 'Credits'
	String get credits => 'Credits';

	/// en: 'Average'
	String get average => 'Average';

	/// en: 'Rank'
	String get rank => 'Rank';

	/// en: 'Class Rank'
	String get classRank => 'Class Rank';

	/// en: 'Department Rank'
	String get departmentRank => 'Department Rank';

	/// en: 'Total Classmates'
	String get totalClassmates => 'Total Classmates';

	/// en: 'Top % in Class'
	String get percentage => 'Top % in Class';

	/// en: 'Rotate the screen to see night school absent records'
	String get leaveNight => 'Rotate the screen to see night school absent records';

	/// en: 'Oops! No data for this semester~ Please choose another semester 😋'
	String get leaveEmpty => 'Oops! No data for this semester~\nPlease choose another semester 😋';

	/// en: 'Re-login is required'
	String get tokenExpiredTitle => 'Re-login is required';

	/// en: 'Cookie has expired, please re-login once!'
	String get tokenExpiredContent => 'Cookie has expired, please re-login once!';

	/// en: 'An update is available for $arg1!'
	String updateContent({required Object arg1}) => 'An update is available for ${arg1}!';

	/// en: 'An update is available for $arg1!'
	String updateAndroidContent({required Object arg1}) => 'An update is available for ${arg1}!';

	/// en: 'An update is available for $arg1!'
	String updateIosContent({required Object arg1}) => 'An update is available for ${arg1}!';

	/// en: 'Updated'
	String get updateTitle => 'Updated';

	/// en: 'Update'
	String get update => 'Update';

	/// en: 'Coming Soon~ Donate us to unlock this feature now!'
	String get functionNotOpen => 'Coming Soon~\nDonate us to unlock this feature now!';

	/// en: 'This is a beta version. Please report any bugs when encountering an error!'
	String get betaFunction => 'This is a beta version. Please report any bugs when encountering an error!';

	/// en: 'Date has not been chosen. Please choose a date first $arg1'
	String busNotPick({required Object arg1}) => 'Date has not been chosen.\nPlease choose a date first ${arg1}';

	/// en: 'This is not an easter egg'
	String get easterEggJuke => 'This is not an easter egg';

	/// en: 'Skip'
	String get skip => 'Skip';

	/// en: 'Share to…'
	String get shareTo => 'Share to…';

	/// en: 'Sent from $arg1 $arg2'
	String sendFrom({required Object arg1, required Object arg2}) => 'Sent from ${arg1} ${arg2}';

	/// en: 'Donate'
	String get donateTitle => 'Donate';

	/// en: 'Support the programmer to use new features!'
	String get donateContent => 'Support the programmer\nto use new features!';

	/// en: 'This app will turn on silent mode during the class, and turn off after the class!'
	String get courseVibrateHint => 'This app will turn on silent mode during the class, and turn off after the class!';

	/// en: 'This app requires a permission to Do Not Disturb Mode to enable auto mute.'
	String get courseVibratePermission => 'This app requires a permission to Do Not Disturb Mode to enable auto mute.';

	/// en: 'The reminder will pop up 10 minutes before the class starts!'
	String get courseNotifyHint => 'The reminder will pop up 10 minutes before the class starts!';

	/// en: 'The class $arg1 will be delivered at room $arg2!'
	String courseNotifyContent({required Object arg1, required Object arg2}) => 'The class ${arg1} will be delivered at room ${arg2}!';

	/// en: 'Outerspace~'
	String get courseNotifyUnknown => 'Outerspace~';

	/// en: 'Oops! No class notification~'
	String get courseNotifyEmpty => 'Oops! No class notification~';

	/// en: 'Oops! Something went wrong~'
	String get courseNotifyError => 'Oops! Something went wrong~';

	/// en: 'Cancel successful'
	String get cancelNotifySuccess => 'Cancel successful';

	/// en: 'Can't found any calendar apps.'
	String get calendarAppNotFound => 'Can\'t found any calendar apps.';

	/// en: 'Settings'
	String get goToSettings => 'Settings';

	/// en: 'notifications'
	String get notifications => 'notifications';

	/// en: 'News'
	String get news => 'News';

	/// en: 'Tel no.'
	String get phones => 'Tel no.';

	/// en: 'Events'
	String get events => 'Events';

	/// en: 'Scheme'
	String get educationSystem => 'Scheme';

	/// en: 'Department'
	String get department => 'Department';

	/// en: 'Class'
	String get studentClass => 'Class';

	/// en: 'Student ID'
	String get studentId => 'Student ID';

	/// en: 'Name'
	String get studentNameCht => 'Name';

	/// en: 'Email Address'
	String get email => 'Email Address';

	/// en: 'Change Email'
	String get changeEmail => 'Change Email';

	/// en: 'Notification'
	String get notificationItem => 'Notification';

	/// en: 'Other Information'
	String get otherInfo => 'Other Information';

	/// en: 'Settings'
	String get otherSettings => 'Settings';

	/// en: 'Environment Configuration '
	String get environmentSettings => 'Environment Configuration ';

	/// en: 'Show Avatar '
	String get headPhotoSetting => 'Show Avatar ';

	/// en: 'Show avatar in side menu.'
	String get headPhotoSettingSubTitle => 'Show avatar in side menu.';

	/// en: 'Class Reminder'
	String get courseNotify => 'Class Reminder';

	/// en: 'The reminder will pop up 10 minutes before the class starts. Click the item to cancel it.'
	String get courseNotifySubTitle => 'The reminder will pop up 10 minutes before the class starts. Click the item to cancel it.';

	/// en: 'Silent Mode'
	String get courseVibrate => 'Silent Mode';

	/// en: 'Suggestions'
	String get feedback => 'Suggestions';

	/// en: 'Send message to Facebook Page'
	String get feedbackViaFacebook => 'Send message to Facebook Page';

	/// en: 'App Version'
	String get appVersion => 'App Version';

	/// en: 'Made by'
	String get aboutAuthorTitle => 'Made by';

	/// en: '高科校務通v1 & v2 呂紹榕(Louie Lu), 姜尚德(JohnThunder), registerAutumn, 詹濬鍵(Evans), 陳建霖(HearSilent), 陳冠蓁, 徐羽柔 高科校務通v3 房志剛(Rainvisitor),林義翔(takidog), 林鈺軒(Lin YuHsuan),周鈺禮(Gary), TreeHD 高科校務通v4 黃昱翔(Marco), YuYu1015, 梁晨恩(ryan940618), 李庭宇(yappy2000) 中山校務通 房志剛(Rainvisitor),胡智強（JohnHuCC), 張栢瑄(Ryan Chang), 蔡明軒(Yukimura), 高聖傑(JasonZzz) 中山校務通v2 陳展皝(David), 吳楷鈞（Kai) 台科校務通 房志剛(Rainvisitor),林義翔(takidog) 文藻校務通 林義翔(takidog),房志剛(Rainvisitor)'
	String get aboutAuthorContent => '高科校務通v1 & v2\n呂紹榕(Louie Lu), 姜尚德(JohnThunder), \nregisterAutumn, 詹濬鍵(Evans), \n陳建霖(HearSilent), 陳冠蓁, 徐羽柔\n高科校務通v3\n房志剛(Rainvisitor),林義翔(takidog),\n林鈺軒(Lin YuHsuan),周鈺禮(Gary),\nTreeHD\n高科校務通v4\n黃昱翔(Marco), YuYu1015, 梁晨恩(ryan940618), 李庭宇(yappy2000)\n中山校務通\n房志剛(Rainvisitor),胡智強（JohnHuCC),\n張栢瑄(Ryan Chang), 蔡明軒(Yukimura), 高聖傑(JasonZzz)\n中山校務通v2\n陳展皝(David), 吳楷鈞（Kai)\n台科校務通\n房志剛(Rainvisitor),林義翔(takidog)\n文藻校務通\n林義翔(takidog),房志剛(Rainvisitor)';

	/// en: 'Why nobody did it? Before you ask me, you are "Nobody", because… There is "Nobody" can do everything. As nobody did it, we take over it. Since KUAS Wifi Login, KUASAP to KUAS Gourmet and Course Selection Simulator, our concept is to provide a convenient campus life to everyone.'
	String get aboutUsContent => 'Why nobody did it?\nBefore you ask me, you are "Nobody", because…\nThere is "Nobody" can do everything.\n\nAs nobody did it, we take over it.\n\nSince KUAS Wifi Login, KUASAP to KUAS Gourmet and Course Selection Simulator,\nour concept is to provide a convenient campus life to everyone.';

	/// en: 'We Need You !'
	String get aboutRecruitTitle => 'We Need You !';

	/// en: 'If you're experienced in Objective-C, Swift, Java, Kotlin, Dart, or you're interested in Coding! Just send message to our Facebook page! Your code might one day run in everyone's phone~'
	String get aboutRecruitContent => 'If you\'re experienced in Objective-C, Swift, Java, Kotlin, Dart, or you\'re interested in Coding!\n\nJust send message to our Facebook page!\nYour code might one day run in everyone\'s phone~';

	/// en: 'In year 2014, we founded KUAS Information Technology Club! If you're enthusiastic or drawn to our projects, join our classes and talks or come by to chat!'
	String get aboutItcContent => 'In year 2014,\nwe founded KUAS Information Technology Club!\n\nIf you\'re enthusiastic or drawn to our projects, join our classes and talks or come by to chat!';

	/// en: 'NKUST IT Club'
	String get aboutItcTitle => 'NKUST IT Club';

	/// en: 'NSYSU GDG on Campus x Code Club'
	String get aboutNsysuCodeClubTitle => 'NSYSU GDG on Campus x Code Club';

	/// en: 'We're a community of tech-savvy individuals eager to use our skills to create a better world. If you're curious about NSYSU AP, Python, or web development, we'd love to have you join our community. Let's learn, grow, and build together. We're also open to collaborating with other groups on projects big or small. Let's connect and make something awesome!'
	String get aboutNsysuCodeClubContent => 'We\'re a community of tech-savvy individuals eager to use our skills to create a better world.\n\nIf you\'re curious about NSYSU AP, Python, or web development, we\'d love to have you join our community. Let\'s learn, grow, and build together. We\'re also open to collaborating with other groups on projects big or small. Let\'s connect and make something awesome!';

	/// en: 'Contact Us'
	String get aboutContactUsTitle => 'Contact Us';

	/// en: 'Open Source License'
	String get aboutOpenSourceTitle => 'Open Source License';

	/// en: 'Open Menu'
	String get openDrawer => 'Open Menu';

	/// en: 'Close Menu'
	String get closeDrawer => 'Close Menu';

	/// en: 'News'
	String get announcements => 'News';

	/// en: 'Oops！There is no latest news. 😋'
	String get announcementEmpty => 'Oops！There is no latest news. 😋';

	/// en: 'Offline Class Schedule'
	String get offlineCourse => 'Offline Class Schedule';

	/// en: 'Course Info'
	String get courseInfo => 'Course Info';

	/// en: 'Schedule'
	String get course => 'Schedule';

	/// en: 'Transcript'
	String get score => 'Transcript';

	/// en: 'Absence Records System'
	String get leave => 'Absence Records System';

	/// en: 'Campus Bus System'
	String get bus => 'Campus Bus';

	/// en: 'Course Selection Simulator'
	String get simcourse => 'Course Selection Simulator';

	/// en: 'School Info'
	String get schoolInfo => 'School Info';

	/// en: 'Personal Info'
	String get userInfo => 'Personal Info';

	/// en: 'About Us'
	String get about => 'About Us';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Guest'
	String get guest => 'Guest';

	/// en: 'Tap here to login'
	String get tapHereToLogin => 'Tap here to login';

	/// en: 'Choose a semester'
	String get pickSemester => 'Choose a semester';

	/// en: 'Please enter your ID.'
	String get enterUsernameHint => 'Please enter your ID.';

	/// en: 'Please enter your password.'
	String get enterPasswordHint => 'Please enter your password.';

	/// en: 'Please confirm your username and password before retrying.'
	String get checkLoginHint => 'Please confirm your username and password before retrying.';

	/// en: 'Lorem ipsum'
	String get loremTitle => 'Lorem ipsum';

	/// en: 'Lorem ipsum dolor sit amet.'
	String get loremSentence => 'Lorem ipsum dolor sit amet.';

	/// en: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
	String get loremParagraph => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';

	/// en: '123'
	String get loremNumber => '123';

	/// en: '2015&#8211;09&#8211;06'
	String get loremDate => '2015&#8211;09&#8211;06';

	/// en: '9:20'
	String get loremTime => '9:20';

	/// en: '(1 / 999)'
	String get loremBusCount => '(1 / 999)';

	/// en: '(01) 234&#8211;5678'
	String get loremPhone => '(01) 234&#8211;5678';

	/// en: '104學年度第1學期'
	String get loremSemester => '104學年度第1學期';

	/// en: 'Mon.'
	String get mon => 'Mon.';

	/// en: 'Tue.'
	String get tue => 'Tue.';

	/// en: 'Wed.'
	String get wed => 'Wed.';

	/// en: 'Thu.'
	String get thu => 'Thu.';

	/// en: 'Fri.'
	String get fri => 'Fri.';

	/// en: 'Sat.'
	String get sat => 'Sat.';

	/// en: 'Sun.'
	String get sun => 'Sun.';

	/// en: 'Mon'
	String get monday => 'Mon';

	/// en: 'Tue'
	String get tuesday => 'Tue';

	/// en: 'Wed'
	String get wednesday => 'Wed';

	/// en: 'Thu'
	String get thursday => 'Thu';

	/// en: 'Fri'
	String get friday => 'Fri';

	/// en: 'Sat'
	String get saturday => 'Sat';

	/// en: 'Sun'
	String get sunday => 'Sun';

	/// en: 'Credits'
	String get units => 'Credits';

	/// en: 'Hours'
	String get courseHours => 'Hours';

	/// en: 'Don't remain empty.'
	String get doNotEmpty => 'Don\'t remain empty.';

	/// en: 'Wrong student ID or password, or this student ID isn't available'
	String get loginFail => 'Wrong student ID or password, or this student ID isn\'t available';

	/// en: 'Bus campus system is out of service!'
	String get busFailInfinity => 'Bus campus system is out of service!';

	/// en: 'Reserving...'
	String get reserving => 'Reserving...';

	/// en: 'Canceling...'
	String get canceling => 'Canceling...';

	/// en: 'Calculating...'
	String get calculating => 'Calculating...';

	/// en: 'Credits Calculation'
	String get calculateCredits => 'Credits Calculation';

	/// en: 'Required Credits'
	String get requiredCredits => 'Required Credits';

	/// en: 'Elective Credits'
	String get electiveCredits => 'Elective Credits';

	/// en: 'Other Credits'
	String get otherCredits => 'Other Credits';

	/// en: 'Total Credits'
	String get totalCredits => 'Total Credits';

	/// en: 'Semester'
	String get semester => 'Semester';

	/// en: 'Begin Calculation'
	String get beginCalculate => 'Begin Calculation';

	/// en: 'Calculation is for reference only.'
	String get calculateUnitsContent => 'Calculation is for reference only.';

	/// en: 'General Education Courses'
	String get generalEductionCourse => 'General Education Courses';

	/// en: 'This feature is unavailable for this account, or system has encountered an error.'
	String get canNotUseFeature => 'This feature is unavailable for this account, or system has encountered an error.';

	/// en: 'Added'
	String get addSuccess => 'Added';

	/// en: 'Date'
	String get date => 'Date';

	/// en: 'Online Absence Reporting'
	String get leaveApply => 'Online Absence Reporting';

	/// en: 'Absence Record'
	String get leaveRecords => 'Absence Record';

	/// en: 'Absence Form'
	String get leaveContent => 'Absence Form';

	/// en: 'Absence Form Id'
	String get leaveSheetId => 'Absence Form Id';

	/// en: 'Comments from School Authority'
	String get instructorsComment => 'Comments from School Authority';

	/// en: 'Loading Offline Data'
	String get loadOfflineData => 'Loading Offline Data';

	/// en: 'Reservation Deadline'
	String get reserveDeadline => 'Reservation Deadline';

	/// en: 'Bus Regulation'
	String get busRule => 'Bus Regulation';

	/// en: 'PX'
	String get people => 'PX';

	/// en: 'This feature is unavailable in this platform.'
	String get platformError => 'This feature is unavailable in this platform.';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Language'
	String get choseLanguageTitle => 'Language';

	/// en: 'System Language'
	String get systemLanguage => 'System Language';

	/// en: '繁體中文'
	String get traditionalChinese => '繁體中文';

	/// en: 'English'
	String get english => 'English';

	/// en: '日本語'
	String get japanese => '日本語';

	/// en: 'Rate This APP'
	String get ratingDialogTitle => 'Rate This APP';

	/// en: 'Do you like this APP? Please write a comment and rate on the App Store or Google Play. Your comments is our motivation!'
	String get ratingDialogContent => 'Do you like this APP?\nPlease write a comment and rate on the App Store or Google Play.\nYour comments is our motivation!';

	/// en: 'LATER'
	String get later => 'LATER';

	/// en: 'RATE NOW'
	String get rateNow => 'RATE NOW';

	/// en: 'Offline Login'
	String get offlineLogin => 'Offline Login';

	/// en: 'No offline login data. Please login online first.'
	String get noOfflineLoginData => 'No offline login data. Please login online first.';

	/// en: 'Wrong username or password.'
	String get offlineLoginPasswordError => 'Wrong username or password.';

	/// en: 'Offline Mode'
	String get offlineMode => 'Offline Mode';

	/// en: 'No Offline Data'
	String get noOfflineData => 'No Offline Data';

	/// en: 'Offline Transcript'
	String get offlineScore => 'Offline Transcript';

	/// en: 'Offline Bus Reservation'
	String get offlineBusReservations => 'Offline Bus Reservation';

	/// en: 'Offline Absence Record'
	String get offlineLeaveData => 'Offline Absence Record';

	/// en: 'No Data'
	String get noData => 'No Data';

	/// en: 'Contact us'
	String get contactFansPage => 'Contact us';

	/// en: 'Post Policy'
	String get newsRuleTitle => 'Post Policy';

	/// en: 'This feature offer students and clubs a space to post information. Email($arg1) provided by school is required to use this feature. '
	String newsRuleDescription1({required Object arg1}) => 'This feature offer students and clubs a space to post information. \nEmail(${arg1}) provided by school is required to use this feature.\n';

	/// en: '1. Upload the image to imgur. Image format must be JPEG. Size less than 100KB is recommended. 2. Title is recommended to be the name of the event; however, don't make it too long. 3. Fill in your event official website. 4. Complete the description field of this event. 5. This event MUST be Non-profit. '
	String get newsRuleDescription2 => '1. Upload the image to imgur. Image format must be JPEG. Size less than 100KB is recommended.\n2. Title is recommended to be the name of the event; however, don\'t make it too long. \n3. Fill in your event official website.\n4. Complete the description field of this event. \n5. This event MUST be Non-profit.\n\n';

	/// en: 'The AP team reserves the right of final modification.'
	String get newsRuleDescription3 => 'The AP team reserves the right of final modification.';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'System Theme'
	String get systemTheme => 'System Theme';

	/// en: 'Light'
	String get light => 'Light';

	/// en: 'Dark'
	String get dark => 'Dark';

	/// en: 'Icon Style'
	String get iconStyle => 'Icon Style';

	/// en: 'Filled'
	String get filled => 'Filled';

	/// en: 'Outlined'
	String get outlined => 'Outlined';

	/// en: 'Search Student ID'
	String get searchUsername => 'Search Student ID';

	/// en: 'Search'
	String get search => 'Search';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'ID'
	String get id => 'ID';

	/// en: 'Result'
	String get searchResult => 'Result';

	/// en: 'Auto Fill'
	String get autoFill => 'Auto Fill';

	/// en: 'If this is your first time login, your default password is your ID last four digits.'
	String get firstLoginHint => 'If this is your first time login, your default password is your ID last four digits.';

	/// en: 'Name：$arg1 Student ID：$arg2 '
	String searchStudentIdFormat({required Object arg1, required Object arg2}) => 'Name：${arg1}\nStudent ID：${arg2}\n';

	/// en: 'No matching data.'
	String get searchStudentIdError => 'No matching data.';

	/// en: 'Midterm Alerts'
	String get midtermAlerts => 'Midterm Alerts';

	/// en: 'Congrats！ No Midterm alerted class in this semester. Please choose another semester. 😋'
	String get midtermAlertsEmpty => 'Congrats！ No Midterm alerted class in this semester.\nPlease choose another semester. 😋';

	/// en: 'Reason：$arg1 Remark：$arg2'
	String midtermAlertsContent({required Object arg1, required Object arg2}) => 'Reason：${arg1}\nRemark：${arg2}';

	/// en: 'Reward and Punishment'
	String get rewardAndPenalty => 'Reward and Punishment';

	/// en: 'Oops！No reward and punishment record in this semester~ Please choose another semester. 😋'
	String get rewardAndPenaltyEmpty => 'Oops！No reward and punishment record in this semester~\nPlease choose another semester. 😋';

	/// en: 'Counts：$arg1 Date：$arg2'
	String rewardAndPenaltyContent({required Object arg1, required Object arg2}) => 'Counts：${arg1}\nDate：${arg2}';

	/// en: 'This feature is unavailable in current campus.'
	String get campusNotSupport => 'This feature is unavailable in current campus.';

	/// en: 'This feature is unavailable.'
	String get userNotSupport => 'This feature is unavailable.';

	/// en: 'Please login first.'
	String get notLogin => 'Please login first.';

	/// en: 'Please check your login status.'
	String get notLoginHint => 'Please check your login status.';

	/// en: 'Add Date'
	String get addDate => 'Add Date';

	/// en: 'Tutor'
	String get tutor => 'Tutor';

	/// en: 'Leave Type'
	String get leaveType => 'Leave Type';

	/// en: 'Reason of Absence '
	String get reason => 'Reason of Absence ';

	/// en: 'Reason for Late Absence Report'
	String get delayReason => 'Reason for Late  Absence Report';

	/// en: 'Submit'
	String get submit => 'Submit';

	/// en: 'Uploading. Do not close this app before uploading finished.'
	String get leaveSubmitUploadHint => 'Uploading.\nDo not close this app before uploading finished.';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Teacher'
	String get teacher => 'Teacher';

	/// en: 'Choose your teacher'
	String get pickTeacher => 'Choose your teacher';

	/// en: 'Leave Certificate'
	String get leaveProof => 'Leave Certificate';

	/// en: 'Please pick one'
	String get pleasePick => 'Please pick one';

	/// en: 'Please pick a date and course section.'
	String get pleasePickDateAndSection => 'Please pick a date and course section.';

	/// en: 'Absence form submit successful.'
	String get leaveSubmitSuccess => 'Absence form submit successful.';

	/// en: 'Because you have exceeded the deadline, please fill in the reason for late absence report'
	String get leaveDelayHint => 'Because you have exceeded the deadline, please fill in the reason for late absence report';

	/// en: 'Please pick an image'
	String get leaveProofHint => 'Please pick an image';

	/// en: 'Because the size is bigger than $arg1MB, the system has automatically compressed it to $arg2 MB'
	String imageCompressHint({required Object arg1MB, required Object arg2}) => 'Because the size is bigger than ${arg1MB}, the system has automatically compressed it to ${arg2} MB';

	/// en: 'Image size must be lower than $arg1MB. Plese try another one.'
	String imageTooBigHint({required Object arg1MB}) => 'Image size must be lower than ${arg1MB}. Plese try another one.';

	/// en: 'Date & Course Section'
	String get leaveDateAndSection => 'Date & Course Section';

	/// en: 'None'
	String get none => 'None';

	/// en: 'Submit Absence Form'
	String get leaveSubmit => 'Submit Absence Form';

	/// en: 'Leave App'
	String get closeAppTitle => 'Leave App';

	/// en: 'Do you want to leave this App?'
	String get closeAppHint => 'Do you want to leave this App?';

	/// en: 'Oops! Failed to submit absence form.'
	String get leaveSubmitFail => 'Oops! Failed to submit absence form.';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Title'
	String get title => 'Title';

	/// en: 'Description'
	String get description => 'Description';

	/// en: 'Image Link'
	String get imageUrl => 'Image Link';

	/// en: 'Link'
	String get url => 'Link';

	/// en: 'Expiration Time'
	String get expireTime => 'Expiration Time';

	/// en: 'Weight'
	String get weight => 'Weight';

	/// en: 'Weight：$arg1 Image Link：$arg2 Link：$arg3 Expire：$arg4 Description：$arg5'
	String newsContentFormat({required Object arg1, required Object arg2, required Object arg3, required Object arg4, required Object arg5}) => 'Weight：${arg1}\nImage Link：${arg2}\nLink：${arg3}\nExpire：${arg4}\nDescription：${arg5}';

	/// en: 'Delete latest news'
	String get deleteNewsTitle => 'Delete latest news';

	/// en: 'Are you sure you want to delete it?'
	String get deleteNewsContent => 'Are you sure you want to delete it?';

	/// en: 'Delete successful'
	String get deleteSuccess => 'Delete successful';

	/// en: 'Update successful'
	String get updateSuccess => 'Update successful';

	/// en: 'Wrong format'
	String get formatError => 'Wrong format';

	/// en: 'Expiration time hasn't been set, please pick a time.'
	String get newsExpireTimeHint => 'Expiration time hasn\'t been set, please pick a time.';

	/// en: 'Set to no expiration time.'
	String get setNoExpireTime => 'Set to no expiration time.';

	/// en: 'No expiration time.'
	String get noExpiration => 'No expiration time.';

	/// en: 'Show Search Button'
	String get showSearchButton => 'Show Search Button';

	/// en: 'School Navigation'
	String get schoolNavigation => 'School Navigation';

	/// en: 'School Map'
	String get schoolMap => 'School Map';

	/// en: 'Birth Month'
	String get birthMonth => 'Birth Month';

	/// en: 'Birth Day'
	String get birthDay => 'Birth Day';

	/// en: 'ID number'
	String get idCard => 'ID number';

	/// en: 'last 4 digits of ID number'
	String get idCardLast4Code => 'last 4 digits of ID number';

	/// en: 'last 6 digits of ID number'
	String get idCardLast6Code => 'last 6 digits of ID number';

	/// en: 'Captcha'
	String get captcha => 'Captcha';

	/// en: 'Wrong username'
	String get usernameError => 'Wrong username';

	/// en: 'Wrong captcha'
	String get captchaError => 'Wrong captcha';

	/// en: 'Wrong password'
	String get passwordError => 'Wrong password';

	/// en: 'An unknown error has occured, Please report to our Facebook page.'
	String get unknownError => 'An unknown error has occured, Please report to our Facebook page.';

	/// en: 'Enrolled students only'
	String get onlySupportInSchool => 'Enrolled students only';

	/// en: 'Admission Guide'
	String get admissionGuide => 'Admission Guide';

	/// en: 'Printing'
	String get printing => 'Printing';

	/// en: 'Done'
	String get done => 'Done';

	/// en: 'Add to Calendar'
	String get addToCalendar => 'Add to Calendar';

	/// en: 'AP Server is out of service. Please report to our Facebook page.'
	String get apiServerError => 'AP Server is out of service.\nPlease report to our Facebook page.';

	/// en: 'Server is out of service. Please contact with school authority.'
	String get schoolServerError => 'Server is out of service.\nPlease contact with school authority.';

	/// en: 'Classroom List'
	String get roomList => 'Classroom List';

	/// en: 'Empty Classroom Search'
	String get emptyClassroomSearch => 'Empty Classroom Search';

	/// en: 'Classroom Course Timetable search'
	String get classroomCourseTableSearch => 'Classroom Course Timetable search';

	/// en: 'Cancel all notifications.'
	String get cancelAllNotify => 'Cancel all notifications.';

	/// en: 'Clean all notifications including unknown notification.'
	String get cancelAllNotifySubTitle => 'Clean all notifications including unknown notification.';

	/// en: 'Export the course timetable to image.'
	String get exportCourseTable => 'Export the course timetable to image.';

	/// en: 'Unable to grand permission. Please try again.'
	String get grandPermissionFail => 'Unable to grand permission. Please try again.';

	/// en: 'Export successful. Please check up files.'
	String get exportCourseTableSuccess => 'Export successful. Please check up files.';

	/// en: 'Course Timetable Settings'
	String get courseScaffoldSetting => 'Course Timetable Settings';

	/// en: 'Show Section Time'
	String get showSectionTime => 'Show Section Time';

	/// en: 'Show Instructors'
	String get showInstructors => 'Show Instructors';

	/// en: 'Show Classroom Location'
	String get showClassroomLocation => 'Show Classroom Location';

	/// en: 'Announcement Review System'
	String get announcementReviewSystem => 'Announcement Review System';

	/// en: 'Failed to login from third-party service.'
	String get thirdPartyLoginFail => 'Failed to login from third-party service.';

	/// en: 'Approved'
	String get approve => 'Approved';

	/// en: 'Rejected'
	String get reject => 'Rejected';

	/// en: 'Updated and Approved'
	String get updateAndApprove => 'Updated and Approved';

	/// en: 'Updated and Rejected'
	String get updateAndReject => 'Updated and Rejected';

	/// en: 'Review Application'
	String get reviewApplication => 'Review Application';

	/// en: 'No matching Data~'
	String get notFoundData => 'No matching Data~';

	/// en: 'Updated, Rejected and Ban'
	String get updateRejectAndBan => 'Updated, Rejected and Ban';

	/// en: 'Black List'
	String get blackList => 'Black List';

	/// en: 'Editor Management'
	String get editorList => 'Editor Management';

	/// en: 'All'
	String get all => 'All';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'All Announcements'
	String get allAnnouncements => 'All Announcements';

	/// en: 'All Applications'
	String get allApplications => 'All Applications';

	/// en: 'No permission'
	String get noPermissionHint => 'No permission';

	/// en: 'No permission to update.'
	String get noPermissionUpdateHint => 'No permission to update.';

	/// en: 'No permission to review.'
	String get noPermissionReviewHint => 'No permission to review.';

	/// en: 'No matching application_id.'
	String get noApplicationHint => 'No matching application_id.';

	/// en: 'Apply'
	String get apply => 'Apply';

	/// en: 'My Applications'
	String get myApplications => 'My Applications';

	/// en: 'Review State'
	String get reviewState => 'Review State';

	/// en: 'Waiting for review'
	String get waitingForReview => 'Waiting for review';

	/// en: 'Approved'
	String get reviewApproval => 'Approved';

	/// en: 'Rejected'
	String get reviewReject => 'Rejected';

	/// en: 'Review Description'
	String get reviewDescription => 'Review Description';

	/// en: 'Application has submited successfully.'
	String get applicationSubmitSuccess => 'Application has submited successfully.';

	/// en: 'Applicant'
	String get applicant => 'Applicant';

	/// en: 'New application'
	String get addApplication => 'New application';

	/// en: 'Not been reviewed'
	String get onlyShowNotReview => 'Not been reviewed';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'To reduce server load, image will be uploaded to Imgur.'
	String get imgurUploadDescription => 'To reduce server load,\nimage will be uploaded to Imgur.';

	/// en: 'Pick one and upload it to Imgur.'
	String get pickAndUploadToImgur => 'Pick one and upload it to Imgur.';

	/// en: 'Uploading'
	String get uploading => 'Uploading';

	/// en: 'Image Preview'
	String get imagePreview => 'Image Preview';

	/// en: 'Image format is no supported.'
	String get notSupportImageType => 'Image format is no supported.';

	/// en: 'Tag'
	String get tag => 'Tag';

	/// en: 'Add Tag'
	String get addTag => 'Add Tag';

	/// en: 'Tag Repeat'
	String get tagRepeatHint => 'Tag Repeat';

	/// en: 'Tag Name'
	String get tagName => 'Tag Name';

	/// en: 'Usage Tracking Policy '
	String get appTrackingDialogTitle => 'Usage Tracking Policy ';

	/// en: 'We only track your personal data with your consent in order to improve our service and stability. Only AP team member have permission to access to the information we collected. We have taken a lot of security measures to help protect your personal data. The following data would like permission to track.'
	String get appTrackingDialogContent => 'We only track your  personal data with your consent in order to improve our service and stability. \nOnly AP team member have permission to access to the information we collected. We have taken a lot of security measures to help protect your personal data.\n\nThe following data would like permission to track.';

	/// en: 'Activity Log: We would like to log your usage to improve user experience.'
	String get analyticsDescription => 'Activity Log: We would like to log your usage to improve user experience.';

	/// en: 'Crash Report: We would like to collect crash report to fix bugs and improve stability.'
	String get crashReportDescription => 'Crash Report: We would like to collect crash report to fix bugs and improve stability.';

	/// en: 'Theme Color'
	String get themeColor => 'Theme Color';

	/// en: 'Custom Color'
	String get customColor => 'Custom Color';

	/// en: 'Pick Theme Color'
	String get pickThemeColor => 'Pick Theme Color';

	/// en: 'Hue'
	String get hue => 'Hue';

	/// en: 'Saturation'
	String get saturation => 'Saturation';

	/// en: 'Value'
	String get value => 'Value';

	/// en: 'NKUST Blue'
	String get nkustBlue => 'NKUST Blue';

	/// en: 'Ocean Blue'
	String get oceanBlue => 'Ocean Blue';

	/// en: 'Emerald Green'
	String get emeraldGreen => 'Emerald Green';

	/// en: 'Coral Orange'
	String get coralOrange => 'Coral Orange';

	/// en: 'Elegant Purple'
	String get elegantPurple => 'Elegant Purple';

	/// en: 'Rose Red'
	String get roseRed => 'Rose Red';

	/// en: 'Cyan'
	String get cyan => 'Cyan';

	/// en: 'Amber'
	String get amber => 'Amber';

	/// en: 'Indigo'
	String get indigo => 'Indigo';

	/// en: 'Brown'
	String get brown => 'Brown';

	/// en: 'Score Statistics'
	String get scoreStatistics => 'Score Statistics';

	/// en: 'Score Distribution'
	String get scoreDistribution => 'Score Distribution';

	/// en: 'Credit Statistics'
	String get creditStatistics => 'Credit Statistics';

	/// en: 'Highest'
	String get highestScore => 'Highest';

	/// en: 'Lowest'
	String get lowestScore => 'Lowest';

	/// en: 'Std Dev'
	String get standardDeviation => 'Std Dev';

	/// en: 'Subjects'
	String get subjectCount => 'Subjects';

	/// en: 'Credits Taken'
	String get creditsTaken => 'Credits Taken';

	/// en: 'Credits Passed'
	String get creditsPassed => 'Credits Passed';

	/// en: 'Credits Failed'
	String get creditsFailed => 'Credits Failed';

	/// en: 'Top'
	String get prLevelTop => 'Top';

	/// en: 'Excellent'
	String get prLevelExcellent => 'Excellent';

	/// en: 'Average'
	String get prLevelAverage => 'Average';

	/// en: 'Below Average'
	String get prLevelBelowAverage => 'Below Average';

	/// en: 'Needs Improvement'
	String get prLevelNeedEffort => 'Needs Improvement';

	/// en: 'Estimated PR'
	String get estimatedPR => 'Estimated PR';

	/// en: '※ PR is estimated based on average score, for reference only'
	String get prDisclaimer => '※ PR is estimated based on average score, for reference only';

	/// en: '$arg1 subjects'
	String subjectCountUnit({required Object arg1}) => '${arg1} subjects';

	/// en: '90-100 (Excellent)'
	String get distributionExcellent => '90-100 (Excellent)';

	/// en: '80-89 (Good)'
	String get distributionGood => '80-89 (Good)';

	/// en: '70-79 (Average)'
	String get distributionAverage => '70-79 (Average)';

	/// en: '60-69 (Pass)'
	String get distributionPass => '60-69 (Pass)';

	/// en: '0-59 (Fail)'
	String get distributionFail => '0-59 (Fail)';

	/// en: 'Student ID Barcode'
	String get studentIdBarcode => 'Student ID Barcode';

	/// en: 'Use this barcode for library services'
	String get barcodeHint => 'Use this barcode for library services';

	/// en: 'Credits'
	String get creditCount => 'Credits';

	/// en: 'Merge Courses'
	String get mergeCourse => 'Merge Courses';

	/// en: 'Fall'
	String get firstSemester => 'Fall';

	/// en: 'Spring'
	String get secondSemester => 'Spring';

	/// en: 'Winter Session'
	String get winterSession => 'Winter Session';

	/// en: 'Summer Session'
	String get summerSession => 'Summer Session';

	/// en: 'Fall'
	String get firstSemesterShort => 'Fall';

	/// en: 'Spring'
	String get secondSemesterShort => 'Spring';

	/// en: 'Winter'
	String get winterSessionShort => 'Winter';

	/// en: 'Summer'
	String get summerSessionShort => 'Summer';

	/// en: 'Pre-course'
	String get preCourse => 'Pre-course';

	/// en: 'Summer Session I'
	String get summerSessionFirst => 'Summer Session I';

	/// en: 'Summer Session (Special)'
	String get summerSessionSpecial => 'Summer Session (Special)';

	/// en: 'Current'
	String get currentSemester => 'Current';

	/// en: 'Loading'
	String get semesterLoading => 'Loading';

	/// en: 'No Data'
	String get semesterNoData => 'No Data';

	/// en: 'GPA'
	String get gpa => 'GPA';

	/// en: 'GPA (4.3 Scale)'
	String get gpaTitle => 'GPA (4.3 Scale)';

	/// en: '※ GPA is calculated using the 4.3 grade point scale, for reference only'
	String get gpaDisclaimer => '※ GPA is calculated using the 4.3 grade point scale, for reference only';

	/// en: 'Grade Point'
	String get gradePoint => 'Grade Point';

	/// en: 'Grade'
	String get gradeLetter => 'Grade';

	/// en: 'Grade Distribution'
	String get gradeDistribution => 'Grade Distribution';

	/// en: 'Add Course'
	String get addCourse => 'Add Course';

	/// en: 'Edit Course'
	String get editCourse => 'Edit Course';

	/// en: 'Delete Course'
	String get deleteCourse => 'Delete Course';

	/// en: 'Are you sure you want to delete this custom course?'
	String get deleteCourseConfirm => 'Are you sure you want to delete this custom course?';

	/// en: 'Course Name'
	String get courseName => 'Course Name';

	/// en: 'e.g. Study Group, Tutoring'
	String get courseNameHint => 'e.g. Study Group, Tutoring';

	/// en: 'Instructor'
	String get instructor => 'Instructor';

	/// en: 'Classroom'
	String get classroom => 'Classroom';

	/// en: 'Color'
	String get courseColor => 'Color';

	/// en: 'Time Slots'
	String get timeslotSelection => 'Time Slots';

	/// en: 'Tap cells to select time slots'
	String get timeslotSelectionHint => 'Tap cells to select time slots';

	/// en: 'Course added'
	String get addCourseSuccess => 'Course added';

	/// en: 'Course updated'
	String get updateCourseSuccess => 'Course updated';

	/// en: 'Course deleted'
	String get deleteCourseSuccess => 'Course deleted';

	/// en: 'Please enter a course name'
	String get courseNameRequired => 'Please enter a course name';

	/// en: 'Please select at least one time slot'
	String get timeslotRequired => 'Please select at least one time slot';

	/// en: 'This time slot conflicts with: $arg1'
	String timeslotConflict({required Object arg1}) => 'This time slot conflicts with: ${arg1}';

	/// en: 'Custom'
	String get customCourse => 'Custom';

	/// en: 'Today's Schedule'
	String get todayScheduleTitle => 'Today\'s Schedule';

	/// en: 'until next class'
	String get untilNextClass => 'until next class';

	/// en: 'classes today'
	String get classesToday => 'classes today';

	/// en: 'No class today'
	String get noClassToday => 'No class today';

	/// en: 'Tomorrow's Schedule'
	String get tomorrowScheduleTitle => 'Tomorrow\'s Schedule';

	/// en: '$arg1 Academic Year'
	String schoolYearFormat({required Object arg1}) => '${arg1} Academic Year';

	/// en: '$arg1 Credits'
	String unitCountFormat({required Object arg1}) => '${arg1} Credits';

	/// en: 'Midterm: $arg1'
	String midtermPrefix({required Object arg1}) => 'Midterm: ${arg1}';

	/// en: 'No more classes today'
	String get noClassAlready => 'No more classes today';

	/// en: 'Homepage Carousel Submissions'
	String get announcementSubmissionSystem => 'Homepage Carousel Submissions';

	/// en: 'Carousel cover'
	String get carouselCover => 'Carousel cover';

	/// en: 'Choose cover image'
	String get carouselPick => 'Choose cover image';

	/// en: 'Replace image'
	String get carouselReplace => 'Replace image';

	/// en: 'Upload a cover image to continue'
	String get carouselImageRequired => 'Upload a cover image to continue';

	/// en: 'Upload failed. Choose the image again.'
	String get carouselUploadFailed => 'Upload failed. Choose the image again.';

	/// en: 'Event details'
	String get carouselDetails => 'Event details';

	/// en: 'Event link (optional)'
	String get carouselLink => 'Event link (optional)';

	/// en: 'Enter a full https or http URL'
	String get carouselLinkError => 'Enter a full https or http URL';

	/// en: 'Set expiration'
	String get carouselSetExpiry => 'Set expiration';

	/// en: 'No expiration'
	String get carouselNoExpiry => 'No expiration';

	/// en: 'Choose a future expiration time'
	String get carouselExpired => 'Choose a future expiration time';

	/// en: 'Event description'
	String get carouselBody => 'Event description';

	/// en: 'Enter an event description…'
	String get carouselBodyHint => 'Enter an event description…';

	/// en: 'Review'
	String get carouselCheck => 'Review';

	/// en: 'Your submission could not be sent. Please try again.'
	String get carouselSubmitFailed => 'Your submission could not be sent. Please try again.';

	/// en: 'Review submission'
	String get carouselPreview => 'Review submission';

	/// en: 'Bold'
	String get carouselBold => 'Bold';

	/// en: 'Italic'
	String get carouselItalic => 'Italic';

	/// en: 'Font size'
	String get carouselSize => 'Font size';

	/// en: 'Small'
	String get carouselSmall => 'Small';

	/// en: 'Standard'
	String get carouselNormal => 'Standard';

	/// en: 'Large'
	String get carouselLarge => 'Large';

	/// en: 'Bulleted list'
	String get carouselBullet => 'Bulleted list';

	/// en: 'Numbered list'
	String get carouselOrdered => 'Numbered list';

	/// en: 'Increase indent'
	String get carouselIndent => 'Increase indent';

	/// en: 'Decrease indent'
	String get carouselOutdent => 'Decrease indent';

	/// en: 'Open event link'
	String get carouselOpenLink => 'Open event link';

	/// en: 'Enlarge cover image'
	String get carouselZoom => 'Enlarge cover image';

	/// en: 'Pending announcements: ${count}'
	String pendingAnnouncementCount({required Object count}) => 'Pending announcements: ${count}';

	/// en: 'Sign in with Google'
	String get announcementGoogleSignIn => 'Sign in with Google';

	/// en: 'Sign in with Apple'
	String get announcementAppleSignIn => 'Sign in with Apple';

	/// en: 'New announcement'
	String get addPublishedAnnouncement => 'New announcement';

	/// en: 'Submissions'
	String get announcementReviewQueue => 'Submissions';

	/// en: 'Published'
	String get publishedAnnouncements => 'Published';

	/// en: 'Approve'
	String get approveAnnouncement => 'Approve';

	/// en: 'Reject'
	String get rejectAnnouncement => 'Reject';

	/// en: 'Applicant account copied'
	String get announcementApplicantCopied => 'Applicant account copied';

	/// en: 'Deadline ${date}'
	String announcementDeadline({required Object date}) => 'Deadline ${date}';

	/// en: 'More actions for ${title}'
	String announcementItemActions({required Object title}) => 'More actions for ${title}';

	/// en: 'Delete submission'
	String get deleteReviewApplication => 'Delete submission';

	/// en: 'Delete “${title}”?'
	String confirmAnnouncementDeletion({required Object title}) => 'Delete “${title}”?';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on ApLocalizations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'updateNoteTitle' => 'What\'s New',
			'home' => 'Home',
			'splashContent' => 'We did all the things\nOnly did the school leave us.',
			'share' => 'Share',
			'teacherConfirmTitle' => 'Are you a teacher?',
			'teacherConfirmContent' => 'This app is created for students.',
			'continueToUse' => 'Continue',
			'logout' => 'Logout',
			'clickToView' => 'View',
			'loginSuccess' => 'Login Successful',
			'somethingError' => 'An error has occurred.',
			'timeoutMessage' => 'Connection timed out. Please try again later.',
			'loginFirst' => 'Please login first',
			'logoutCheck' => 'Are you sure you want to log out?',
			'login' => 'Login',
			'dotAp' => 'AP',
			'dotLeave' => 'Absence record',
			'dotBus' => 'Campus Bus',
			'schedule' => 'Calendar',
			'loading' => 'Loading',
			'idHint' => 'Student ID',
			'passwordHint' => 'Password',
			'rememberPassword' => 'Remember me',
			'changePassword' => 'Change Password',
			'newPassword' => 'New Password',
			'newPasswordConfirm' => 'Confirm New Password',
			'newPasswordNotMatchHint' => 'Passwords do not match, please try again !',
			'newPasswordLeastCharacter' => ({required Object arg1}) => 'Passwords at least ${arg1} characters.',
			'changePasswordSuccessHint1' => 'Change success, please use new password to login',
			'changePasswordSuccessHint2' => 'Change success, app will use new password to login',
			'autoLogin' => 'Auto login',
			'version' => ({required Object arg1}) => 'v.${arg1}',
			'logining' => 'Logging...',
			'callPhoneTitle' => 'Calling',
			'callPhoneContent' => ({required Object arg1}) => 'Do you want to call ${arg1}?',
			'callPhone' => 'Call',
			'determine' => 'Yes',
			'cancel' => 'No',
			'addCalendarContent' => ({required Object arg1}) => 'Do you want to add ${arg1} to your calendar?',
			'clickToRetry' => 'An error has occurred, click here to retry',
			'back' => 'Back',
			'unknown' => 'Unknown',
			'campus' => ' campus',
			'iKnow' => 'Got it',
			'busEmpty' => 'Oops! No buses available now~\nPlease choose another one.',
			'courseEmpty' => 'Oops! No classes in this semester~\nPlease choose another one. 😋',
			'ok' => 'OK',
			'courseDialogMessages' => ({required Object arg1, required Object arg2, required Object arg3, required Object arg4}) => 'Class：${arg1}\nProfessor：${arg2}\nLocation：${arg3}\nTime：${arg4}',
			'courseDialogName' => 'Class',
			'courseDialogProfessor' => 'Professor',
			'courseDialogLocation' => 'Location',
			'courseDialogTime' => 'Time',
			'courseDialogTitle' => 'Class Info',
			'courseHoliday' => ({required Object arg1}) => 'Rotate the screen to see weekend schedule ${arg1}',
			'courseClickHint' => 'Click subject to show more.',
			'noInternet' => 'No internet connection',
			'settingInternet' => 'Internet settings',
			'scoreEmpty' => 'Oops! No data for this semester~\nPlease choose another semester 😋',
			'subject' => 'Subject',
			'midtermScoreTitle' => 'Midterm',
			'semesterScoreTitle' => 'Final',
			'midtermScore' => 'Midterm Score',
			'finalScore' => 'Final Score',
			'generalScore' => 'General Score',
			'semesterScore' => 'Semester Score',
			'conductScore' => 'Conduct Score',
			'creditsTakenEarned' => 'Credits Taken/Earned',
			'credits' => 'Credits',
			'average' => 'Average',
			'rank' => 'Rank',
			'classRank' => 'Class Rank',
			'departmentRank' => 'Department Rank',
			'totalClassmates' => 'Total Classmates',
			'percentage' => 'Top % in Class',
			'leaveNight' => 'Rotate the screen to see night school absent records',
			'leaveEmpty' => 'Oops! No data for this semester~\nPlease choose another semester 😋',
			'tokenExpiredTitle' => 'Re-login is required',
			'tokenExpiredContent' => 'Cookie has expired, please re-login once!',
			'updateContent' => ({required Object arg1}) => 'An update is available for ${arg1}!',
			'updateAndroidContent' => ({required Object arg1}) => 'An update is available for ${arg1}!',
			'updateIosContent' => ({required Object arg1}) => 'An update is available for ${arg1}!',
			'updateTitle' => 'Updated',
			'update' => 'Update',
			'functionNotOpen' => 'Coming Soon~\nDonate us to unlock this feature now!',
			'betaFunction' => 'This is a beta version. Please report any bugs when encountering an error!',
			'busNotPick' => ({required Object arg1}) => 'Date has not been chosen.\nPlease choose a date first ${arg1}',
			'easterEggJuke' => 'This is not an easter egg',
			'skip' => 'Skip',
			'shareTo' => 'Share to…',
			'sendFrom' => ({required Object arg1, required Object arg2}) => 'Sent from ${arg1} ${arg2}',
			'donateTitle' => 'Donate',
			'donateContent' => 'Support the programmer\nto use new features!',
			'courseVibrateHint' => 'This app will turn on silent mode during the class, and turn off after the class!',
			'courseVibratePermission' => 'This app requires a permission to Do Not Disturb Mode to enable auto mute.',
			'courseNotifyHint' => 'The reminder will pop up 10 minutes before the class starts!',
			'courseNotifyContent' => ({required Object arg1, required Object arg2}) => 'The class ${arg1} will be delivered at room ${arg2}!',
			'courseNotifyUnknown' => 'Outerspace~',
			'courseNotifyEmpty' => 'Oops! No class notification~',
			'courseNotifyError' => 'Oops! Something went wrong~',
			'cancelNotifySuccess' => 'Cancel successful',
			'calendarAppNotFound' => 'Can\'t found any calendar apps.',
			'goToSettings' => 'Settings',
			'notifications' => 'notifications',
			'news' => 'News',
			'phones' => 'Tel no.',
			'events' => 'Events',
			'educationSystem' => 'Scheme',
			'department' => 'Department',
			'studentClass' => 'Class',
			'studentId' => 'Student ID',
			'studentNameCht' => 'Name',
			'email' => 'Email Address',
			'changeEmail' => 'Change Email',
			'notificationItem' => 'Notification',
			'otherInfo' => 'Other Information',
			'otherSettings' => 'Settings',
			'environmentSettings' => 'Environment Configuration ',
			'headPhotoSetting' => 'Show Avatar ',
			'headPhotoSettingSubTitle' => 'Show avatar in side menu.',
			'courseNotify' => 'Class Reminder',
			'courseNotifySubTitle' => 'The reminder will pop up 10 minutes before the class starts. Click the item to cancel it.',
			'courseVibrate' => 'Silent Mode',
			'feedback' => 'Suggestions',
			'feedbackViaFacebook' => 'Send message to Facebook Page',
			'appVersion' => 'App Version',
			'aboutAuthorTitle' => 'Made by',
			'aboutAuthorContent' => '高科校務通v1 & v2\n呂紹榕(Louie Lu), 姜尚德(JohnThunder), \nregisterAutumn, 詹濬鍵(Evans), \n陳建霖(HearSilent), 陳冠蓁, 徐羽柔\n高科校務通v3\n房志剛(Rainvisitor),林義翔(takidog),\n林鈺軒(Lin YuHsuan),周鈺禮(Gary),\nTreeHD\n高科校務通v4\n黃昱翔(Marco), YuYu1015, 梁晨恩(ryan940618), 李庭宇(yappy2000)\n中山校務通\n房志剛(Rainvisitor),胡智強（JohnHuCC),\n張栢瑄(Ryan Chang), 蔡明軒(Yukimura), 高聖傑(JasonZzz)\n中山校務通v2\n陳展皝(David), 吳楷鈞（Kai)\n台科校務通\n房志剛(Rainvisitor),林義翔(takidog)\n文藻校務通\n林義翔(takidog),房志剛(Rainvisitor)',
			'aboutUsContent' => 'Why nobody did it?\nBefore you ask me, you are "Nobody", because…\nThere is "Nobody" can do everything.\n\nAs nobody did it, we take over it.\n\nSince KUAS Wifi Login, KUASAP to KUAS Gourmet and Course Selection Simulator,\nour concept is to provide a convenient campus life to everyone.',
			'aboutRecruitTitle' => 'We Need You !',
			'aboutRecruitContent' => 'If you\'re experienced in Objective-C, Swift, Java, Kotlin, Dart, or you\'re interested in Coding!\n\nJust send message to our Facebook page!\nYour code might one day run in everyone\'s phone~',
			'aboutItcContent' => 'In year 2014,\nwe founded KUAS Information Technology Club!\n\nIf you\'re enthusiastic or drawn to our projects, join our classes and talks or come by to chat!',
			'aboutItcTitle' => 'NKUST IT Club',
			'aboutNsysuCodeClubTitle' => 'NSYSU GDG on Campus x Code Club',
			'aboutNsysuCodeClubContent' => 'We\'re a community of tech-savvy individuals eager to use our skills to create a better world.\n\nIf you\'re curious about NSYSU AP, Python, or web development, we\'d love to have you join our community. Let\'s learn, grow, and build together. We\'re also open to collaborating with other groups on projects big or small. Let\'s connect and make something awesome!',
			'aboutContactUsTitle' => 'Contact Us',
			'aboutOpenSourceTitle' => 'Open Source License',
			'openDrawer' => 'Open Menu',
			'closeDrawer' => 'Close Menu',
			'announcements' => 'News',
			'announcementEmpty' => 'Oops！There is no latest news. 😋',
			'offlineCourse' => 'Offline Class Schedule',
			'courseInfo' => 'Course Info',
			'course' => 'Schedule',
			'score' => 'Transcript',
			'leave' => 'Absence Records System',
			'bus' => 'Campus Bus',
			'simcourse' => 'Course Selection Simulator',
			'schoolInfo' => 'School Info',
			'userInfo' => 'Personal Info',
			'about' => 'About Us',
			'settings' => 'Settings',
			'guest' => 'Guest',
			'tapHereToLogin' => 'Tap here to login',
			'pickSemester' => 'Choose a semester',
			'enterUsernameHint' => 'Please enter your ID.',
			'enterPasswordHint' => 'Please enter your password.',
			'checkLoginHint' => 'Please confirm your username and password before retrying.',
			'loremTitle' => 'Lorem ipsum',
			'loremSentence' => 'Lorem ipsum dolor sit amet.',
			'loremParagraph' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
			'loremNumber' => '123',
			'loremDate' => '2015&#8211;09&#8211;06',
			'loremTime' => '9:20',
			'loremBusCount' => '(1 / 999)',
			'loremPhone' => '(01) 234&#8211;5678',
			'loremSemester' => '104學年度第1學期',
			'mon' => 'Mon.',
			'tue' => 'Tue.',
			'wed' => 'Wed.',
			'thu' => 'Thu.',
			'fri' => 'Fri.',
			'sat' => 'Sat.',
			'sun' => 'Sun.',
			'monday' => 'Mon',
			'tuesday' => 'Tue',
			'wednesday' => 'Wed',
			'thursday' => 'Thu',
			'friday' => 'Fri',
			'saturday' => 'Sat',
			'sunday' => 'Sun',
			'units' => 'Credits',
			'courseHours' => 'Hours',
			'doNotEmpty' => 'Don\'t remain empty.',
			'loginFail' => 'Wrong student ID or password, or this student ID isn\'t available',
			'busFailInfinity' => 'Bus campus system is out of service!',
			'reserving' => 'Reserving...',
			'canceling' => 'Canceling...',
			'calculating' => 'Calculating...',
			'calculateCredits' => 'Credits Calculation',
			'requiredCredits' => 'Required Credits',
			'electiveCredits' => 'Elective Credits',
			'otherCredits' => 'Other Credits',
			'totalCredits' => 'Total Credits',
			'semester' => 'Semester',
			'beginCalculate' => 'Begin Calculation',
			'calculateUnitsContent' => 'Calculation is for reference only.',
			'generalEductionCourse' => 'General Education Courses',
			'canNotUseFeature' => 'This feature is unavailable for this account, or system has encountered an error.',
			'addSuccess' => 'Added',
			'date' => 'Date',
			'leaveApply' => 'Online Absence Reporting',
			'leaveRecords' => 'Absence Record',
			'leaveContent' => 'Absence Form',
			'leaveSheetId' => 'Absence Form Id',
			'instructorsComment' => 'Comments from School Authority',
			'loadOfflineData' => 'Loading Offline Data',
			'reserveDeadline' => 'Reservation Deadline',
			'busRule' => 'Bus Regulation',
			'people' => 'PX',
			'platformError' => 'This feature is unavailable in this platform.',
			'language' => 'Language',
			'choseLanguageTitle' => 'Language',
			'systemLanguage' => 'System Language',
			'traditionalChinese' => '繁體中文',
			'english' => 'English',
			'japanese' => '日本語',
			'ratingDialogTitle' => 'Rate This APP',
			'ratingDialogContent' => 'Do you like this APP?\nPlease write a comment and rate on the App Store or Google Play.\nYour comments is our motivation!',
			'later' => 'LATER',
			'rateNow' => 'RATE NOW',
			'offlineLogin' => 'Offline Login',
			'noOfflineLoginData' => 'No offline login data. Please login online first.',
			'offlineLoginPasswordError' => 'Wrong username or password.',
			'offlineMode' => 'Offline Mode',
			'noOfflineData' => 'No Offline Data',
			'offlineScore' => 'Offline Transcript',
			'offlineBusReservations' => 'Offline Bus Reservation',
			'offlineLeaveData' => 'Offline Absence Record',
			'noData' => 'No Data',
			'contactFansPage' => 'Contact us',
			'newsRuleTitle' => 'Post Policy',
			'newsRuleDescription1' => ({required Object arg1}) => 'This feature offer students and clubs a space to post information. \nEmail(${arg1}) provided by school is required to use this feature.\n',
			'newsRuleDescription2' => '1. Upload the image to imgur. Image format must be JPEG. Size less than 100KB is recommended.\n2. Title is recommended to be the name of the event; however, don\'t make it too long. \n3. Fill in your event official website.\n4. Complete the description field of this event. \n5. This event MUST be Non-profit.\n\n',
			'newsRuleDescription3' => 'The AP team reserves the right of final modification.',
			'theme' => 'Theme',
			'systemTheme' => 'System Theme',
			'light' => 'Light',
			'dark' => 'Dark',
			'iconStyle' => 'Icon Style',
			'filled' => 'Filled',
			'outlined' => 'Outlined',
			'searchUsername' => 'Search Student ID',
			'search' => 'Search',
			'name' => 'Name',
			'id' => 'ID',
			'searchResult' => 'Result',
			'autoFill' => 'Auto Fill',
			'firstLoginHint' => 'If this is your first time login, your default password is your ID last four digits.',
			'searchStudentIdFormat' => ({required Object arg1, required Object arg2}) => 'Name：${arg1}\nStudent ID：${arg2}\n',
			'searchStudentIdError' => 'No matching data.',
			'midtermAlerts' => 'Midterm Alerts',
			'midtermAlertsEmpty' => 'Congrats！ No Midterm alerted class in this semester.\nPlease choose another semester. 😋',
			'midtermAlertsContent' => ({required Object arg1, required Object arg2}) => 'Reason：${arg1}\nRemark：${arg2}',
			'rewardAndPenalty' => 'Reward and Punishment',
			'rewardAndPenaltyEmpty' => 'Oops！No reward and punishment record in this semester~\nPlease choose another semester. 😋',
			'rewardAndPenaltyContent' => ({required Object arg1, required Object arg2}) => 'Counts：${arg1}\nDate：${arg2}',
			'campusNotSupport' => 'This feature is unavailable in current campus.',
			'userNotSupport' => 'This feature is unavailable.',
			'notLogin' => 'Please login first.',
			'notLoginHint' => 'Please check your login status.',
			'addDate' => 'Add Date',
			'tutor' => 'Tutor',
			'leaveType' => 'Leave Type',
			'reason' => 'Reason of Absence ',
			'delayReason' => 'Reason for Late  Absence Report',
			'submit' => 'Submit',
			'leaveSubmitUploadHint' => 'Uploading.\nDo not close this app before uploading finished.',
			'confirm' => 'Confirm',
			'teacher' => 'Teacher',
			'pickTeacher' => 'Choose your teacher',
			'leaveProof' => 'Leave Certificate',
			'pleasePick' => 'Please pick one',
			'pleasePickDateAndSection' => 'Please pick a date and course section.',
			'leaveSubmitSuccess' => 'Absence form submit successful.',
			'leaveDelayHint' => 'Because you have exceeded the deadline, please fill in the reason for late absence report',
			'leaveProofHint' => 'Please pick an image',
			'imageCompressHint' => ({required Object arg1MB, required Object arg2}) => 'Because the size is bigger than ${arg1MB}, the system has automatically compressed it to ${arg2} MB',
			'imageTooBigHint' => ({required Object arg1MB}) => 'Image size must be lower than ${arg1MB}. Plese try another one.',
			'leaveDateAndSection' => 'Date & Course Section',
			'none' => 'None',
			'leaveSubmit' => 'Submit Absence Form',
			'closeAppTitle' => 'Leave App',
			'closeAppHint' => 'Do you want to leave this App?',
			'leaveSubmitFail' => 'Oops! Failed to submit absence form.',
			'retry' => 'Retry',
			'title' => 'Title',
			'description' => 'Description',
			'imageUrl' => 'Image Link',
			'url' => 'Link',
			'expireTime' => 'Expiration Time',
			'weight' => 'Weight',
			'newsContentFormat' => ({required Object arg1, required Object arg2, required Object arg3, required Object arg4, required Object arg5}) => 'Weight：${arg1}\nImage Link：${arg2}\nLink：${arg3}\nExpire：${arg4}\nDescription：${arg5}',
			'deleteNewsTitle' => 'Delete latest news',
			'deleteNewsContent' => 'Are you sure you want to delete it?',
			'deleteSuccess' => 'Delete successful',
			'updateSuccess' => 'Update successful',
			'formatError' => 'Wrong format',
			'newsExpireTimeHint' => 'Expiration time hasn\'t been set, please pick a time.',
			'setNoExpireTime' => 'Set to no expiration time.',
			'noExpiration' => 'No expiration time.',
			'showSearchButton' => 'Show Search Button',
			'schoolNavigation' => 'School Navigation',
			'schoolMap' => 'School Map',
			'birthMonth' => 'Birth Month',
			'birthDay' => 'Birth Day',
			'idCard' => 'ID number',
			'idCardLast4Code' => 'last 4 digits of ID number',
			'idCardLast6Code' => 'last 6 digits of ID number',
			'captcha' => 'Captcha',
			'usernameError' => 'Wrong username',
			'captchaError' => 'Wrong captcha',
			'passwordError' => 'Wrong password',
			'unknownError' => 'An unknown error has occured, Please report to our Facebook page.',
			'onlySupportInSchool' => 'Enrolled students only',
			'admissionGuide' => 'Admission Guide',
			'printing' => 'Printing',
			'done' => 'Done',
			'addToCalendar' => 'Add to Calendar',
			'apiServerError' => 'AP Server is out of service.\nPlease report to our Facebook page.',
			'schoolServerError' => 'Server is out of service.\nPlease contact with school authority.',
			'roomList' => 'Classroom List',
			'emptyClassroomSearch' => 'Empty Classroom Search',
			'classroomCourseTableSearch' => 'Classroom Course Timetable search',
			'cancelAllNotify' => 'Cancel all notifications.',
			'cancelAllNotifySubTitle' => 'Clean all notifications including unknown notification.',
			'exportCourseTable' => 'Export the course timetable to image.',
			'grandPermissionFail' => 'Unable to grand permission. Please try again.',
			'exportCourseTableSuccess' => 'Export successful. Please check up files.',
			'courseScaffoldSetting' => 'Course Timetable Settings',
			'showSectionTime' => 'Show Section Time',
			'showInstructors' => 'Show Instructors',
			'showClassroomLocation' => 'Show Classroom Location',
			'announcementReviewSystem' => 'Announcement Review System',
			'thirdPartyLoginFail' => 'Failed to login from third-party service.',
			'approve' => 'Approved',
			'reject' => 'Rejected',
			'updateAndApprove' => 'Updated and Approved',
			'updateAndReject' => 'Updated and Rejected',
			'reviewApplication' => 'Review Application',
			'notFoundData' => 'No matching Data~',
			'updateRejectAndBan' => 'Updated, Rejected and Ban',
			'blackList' => 'Black List',
			'editorList' => 'Editor Management',
			'all' => 'All',
			'delete' => 'Delete',
			'allAnnouncements' => 'All Announcements',
			'allApplications' => 'All Applications',
			'noPermissionHint' => 'No permission',
			'noPermissionUpdateHint' => 'No permission to update.',
			'noPermissionReviewHint' => 'No permission to review.',
			'noApplicationHint' => 'No matching application_id.',
			'apply' => 'Apply',
			'myApplications' => 'My Applications',
			'reviewState' => 'Review State',
			'waitingForReview' => 'Waiting for review',
			'reviewApproval' => 'Approved',
			'reviewReject' => 'Rejected',
			'reviewDescription' => 'Review Description',
			'applicationSubmitSuccess' => 'Application has submited successfully.',
			'applicant' => 'Applicant',
			'addApplication' => 'New application',
			'onlyShowNotReview' => 'Not been reviewed',
			'account' => 'Account',
			'password' => 'Password',
			'imgurUploadDescription' => 'To reduce server load,\nimage will be uploaded to Imgur.',
			'pickAndUploadToImgur' => 'Pick one and upload it to Imgur.',
			'uploading' => 'Uploading',
			'imagePreview' => 'Image Preview',
			'notSupportImageType' => 'Image format is no supported.',
			'tag' => 'Tag',
			'addTag' => 'Add Tag',
			'tagRepeatHint' => 'Tag Repeat',
			'tagName' => 'Tag Name',
			'appTrackingDialogTitle' => 'Usage Tracking Policy ',
			'appTrackingDialogContent' => 'We only track your  personal data with your consent in order to improve our service and stability. \nOnly AP team member have permission to access to the information we collected. We have taken a lot of security measures to help protect your personal data.\n\nThe following data would like permission to track.',
			'analyticsDescription' => 'Activity Log: We would like to log your usage to improve user experience.',
			'crashReportDescription' => 'Crash Report: We would like to collect crash report to fix bugs and improve stability.',
			'themeColor' => 'Theme Color',
			'customColor' => 'Custom Color',
			'pickThemeColor' => 'Pick Theme Color',
			'hue' => 'Hue',
			'saturation' => 'Saturation',
			'value' => 'Value',
			'nkustBlue' => 'NKUST Blue',
			'oceanBlue' => 'Ocean Blue',
			'emeraldGreen' => 'Emerald Green',
			'coralOrange' => 'Coral Orange',
			'elegantPurple' => 'Elegant Purple',
			'roseRed' => 'Rose Red',
			'cyan' => 'Cyan',
			'amber' => 'Amber',
			'indigo' => 'Indigo',
			'brown' => 'Brown',
			'scoreStatistics' => 'Score Statistics',
			'scoreDistribution' => 'Score Distribution',
			'creditStatistics' => 'Credit Statistics',
			'highestScore' => 'Highest',
			'lowestScore' => 'Lowest',
			'standardDeviation' => 'Std Dev',
			'subjectCount' => 'Subjects',
			'creditsTaken' => 'Credits Taken',
			'creditsPassed' => 'Credits Passed',
			'creditsFailed' => 'Credits Failed',
			'prLevelTop' => 'Top',
			'prLevelExcellent' => 'Excellent',
			'prLevelAverage' => 'Average',
			'prLevelBelowAverage' => 'Below Average',
			'prLevelNeedEffort' => 'Needs Improvement',
			'estimatedPR' => 'Estimated PR',
			'prDisclaimer' => '※ PR is estimated based on average score, for reference only',
			'subjectCountUnit' => ({required Object arg1}) => '${arg1} subjects',
			'distributionExcellent' => '90-100 (Excellent)',
			'distributionGood' => '80-89 (Good)',
			'distributionAverage' => '70-79 (Average)',
			'distributionPass' => '60-69 (Pass)',
			'distributionFail' => '0-59 (Fail)',
			'studentIdBarcode' => 'Student ID Barcode',
			'barcodeHint' => 'Use this barcode for library services',
			'creditCount' => 'Credits',
			'mergeCourse' => 'Merge Courses',
			'firstSemester' => 'Fall',
			'secondSemester' => 'Spring',
			'winterSession' => 'Winter Session',
			'summerSession' => 'Summer Session',
			'firstSemesterShort' => 'Fall',
			'secondSemesterShort' => 'Spring',
			'winterSessionShort' => 'Winter',
			'summerSessionShort' => 'Summer',
			'preCourse' => 'Pre-course',
			'summerSessionFirst' => 'Summer Session I',
			'summerSessionSpecial' => 'Summer Session (Special)',
			'currentSemester' => 'Current',
			'semesterLoading' => 'Loading',
			'semesterNoData' => 'No Data',
			'gpa' => 'GPA',
			'gpaTitle' => 'GPA (4.3 Scale)',
			'gpaDisclaimer' => '※ GPA is calculated using the 4.3 grade point scale, for reference only',
			'gradePoint' => 'Grade Point',
			'gradeLetter' => 'Grade',
			'gradeDistribution' => 'Grade Distribution',
			'addCourse' => 'Add Course',
			'editCourse' => 'Edit Course',
			'deleteCourse' => 'Delete Course',
			'deleteCourseConfirm' => 'Are you sure you want to delete this custom course?',
			'courseName' => 'Course Name',
			'courseNameHint' => 'e.g. Study Group, Tutoring',
			'instructor' => 'Instructor',
			'classroom' => 'Classroom',
			'courseColor' => 'Color',
			'timeslotSelection' => 'Time Slots',
			'timeslotSelectionHint' => 'Tap cells to select time slots',
			'addCourseSuccess' => 'Course added',
			'updateCourseSuccess' => 'Course updated',
			'deleteCourseSuccess' => 'Course deleted',
			'courseNameRequired' => 'Please enter a course name',
			'timeslotRequired' => 'Please select at least one time slot',
			'timeslotConflict' => ({required Object arg1}) => 'This time slot conflicts with: ${arg1}',
			'customCourse' => 'Custom',
			'todayScheduleTitle' => 'Today\'s Schedule',
			'untilNextClass' => 'until next class',
			'classesToday' => 'classes today',
			'noClassToday' => 'No class today',
			'tomorrowScheduleTitle' => 'Tomorrow\'s Schedule',
			'schoolYearFormat' => ({required Object arg1}) => '${arg1} Academic Year',
			'unitCountFormat' => ({required Object arg1}) => '${arg1} Credits',
			'midtermPrefix' => ({required Object arg1}) => 'Midterm: ${arg1}',
			'noClassAlready' => 'No more classes today',
			'announcementSubmissionSystem' => 'Homepage Carousel Submissions',
			'carouselCover' => 'Carousel cover',
			'carouselPick' => 'Choose cover image',
			'carouselReplace' => 'Replace image',
			'carouselImageRequired' => 'Upload a cover image to continue',
			'carouselUploadFailed' => 'Upload failed. Choose the image again.',
			'carouselDetails' => 'Event details',
			'carouselLink' => 'Event link (optional)',
			'carouselLinkError' => 'Enter a full https or http URL',
			'carouselSetExpiry' => 'Set expiration',
			'carouselNoExpiry' => 'No expiration',
			'carouselExpired' => 'Choose a future expiration time',
			'carouselBody' => 'Event description',
			'carouselBodyHint' => 'Enter an event description…',
			'carouselCheck' => 'Review',
			'carouselSubmitFailed' => 'Your submission could not be sent. Please try again.',
			'carouselPreview' => 'Review submission',
			'carouselBold' => 'Bold',
			'carouselItalic' => 'Italic',
			'carouselSize' => 'Font size',
			'carouselSmall' => 'Small',
			'carouselNormal' => 'Standard',
			'carouselLarge' => 'Large',
			'carouselBullet' => 'Bulleted list',
			'carouselOrdered' => 'Numbered list',
			'carouselIndent' => 'Increase indent',
			'carouselOutdent' => 'Decrease indent',
			'carouselOpenLink' => 'Open event link',
			'carouselZoom' => 'Enlarge cover image',
			'pendingAnnouncementCount' => ({required Object count}) => 'Pending announcements: ${count}',
			'announcementGoogleSignIn' => 'Sign in with Google',
			'announcementAppleSignIn' => 'Sign in with Apple',
			'addPublishedAnnouncement' => 'New announcement',
			'announcementReviewQueue' => 'Submissions',
			'publishedAnnouncements' => 'Published',
			'approveAnnouncement' => 'Approve',
			'rejectAnnouncement' => 'Reject',
			'announcementApplicantCopied' => 'Applicant account copied',
			'announcementDeadline' => ({required Object date}) => 'Deadline ${date}',
			'announcementItemActions' => ({required Object title}) => 'More actions for ${title}',
			'deleteReviewApplication' => 'Delete submission',
			'confirmAnnouncementDeletion' => ({required Object title}) => 'Delete “${title}”?',
			_ => null,
		};
	}
}
