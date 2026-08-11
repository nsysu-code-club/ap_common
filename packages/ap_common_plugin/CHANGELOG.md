## 1.0.1-dev.14

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(plugin): no-op ApCommonPlugin on unsupported platforms. ([2d377566](https://github.com/abc873693/ap_common/commit/2d3775660fa0349eb6d6a9fe15cb9e5af9ed026e))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(plugin): use LazyColumn to bypass Glance 10-element limit in course table widget. ([34504e41](https://github.com/abc873693/ap_common/commit/34504e41d05aff544d59595a9158d4f602a5113b))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(plugin): sync course palette to native AppWidgets. ([cf65f881](https://github.com/abc873693/ap_common/commit/cf65f88116aca1f04cd0ddd154a60c2e62a1337a))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(plugin): add per-widget preview layouts with dark theme support. ([4b6a2018](https://github.com/abc873693/ap_common/commit/4b6a2018473dc3614d83755add8e96eac451ce36))
 - **FEAT**(plugin): merge consecutive course slots and center widget titles. ([7ad0144a](https://github.com/abc873693/ap_common/commit/7ad0144a61c9c7c61aae0aa03e75b6679a21b1f5))
 - **FEAT**(plugin): add today schedule, countdown, and student ID widgets. ([361784a3](https://github.com/abc873693/ap_common/commit/361784a30fdf757ea6be76e6f8948c66c81af530))
 - **FEAT**(plugin): add iOS WidgetKit course table grid widget. ([3c85154f](https://github.com/abc873693/ap_common/commit/3c85154fb3e282b0212040962152480bbabef0f3))
 - **FEAT**(plugin): add course table grid widget for Android home screen. ([a4885ea7](https://github.com/abc873693/ap_common/commit/a4885ea7e19b9d4fce467aa9c56526dc7dbdf828))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): add guide for disabling specific Android widgets. ([cb1facc9](https://github.com/abc873693/ap_common/commit/cb1facc9265682929b95aea48b7bac3ec2c61f10))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.13

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(plugin): no-op ApCommonPlugin on unsupported platforms. ([2d377566](https://github.com/abc873693/ap_common/commit/2d3775660fa0349eb6d6a9fe15cb9e5af9ed026e))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(plugin): use LazyColumn to bypass Glance 10-element limit in course table widget. ([34504e41](https://github.com/abc873693/ap_common/commit/34504e41d05aff544d59595a9158d4f602a5113b))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(plugin): sync course palette to native AppWidgets. ([cf65f881](https://github.com/abc873693/ap_common/commit/cf65f88116aca1f04cd0ddd154a60c2e62a1337a))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(plugin): add per-widget preview layouts with dark theme support. ([4b6a2018](https://github.com/abc873693/ap_common/commit/4b6a2018473dc3614d83755add8e96eac451ce36))
 - **FEAT**(plugin): merge consecutive course slots and center widget titles. ([7ad0144a](https://github.com/abc873693/ap_common/commit/7ad0144a61c9c7c61aae0aa03e75b6679a21b1f5))
 - **FEAT**(plugin): add today schedule, countdown, and student ID widgets. ([361784a3](https://github.com/abc873693/ap_common/commit/361784a30fdf757ea6be76e6f8948c66c81af530))
 - **FEAT**(plugin): add iOS WidgetKit course table grid widget. ([3c85154f](https://github.com/abc873693/ap_common/commit/3c85154fb3e282b0212040962152480bbabef0f3))
 - **FEAT**(plugin): add course table grid widget for Android home screen. ([a4885ea7](https://github.com/abc873693/ap_common/commit/a4885ea7e19b9d4fce467aa9c56526dc7dbdf828))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): add guide for disabling specific Android widgets. ([cb1facc9](https://github.com/abc873693/ap_common/commit/cb1facc9265682929b95aea48b7bac3ec2c61f10))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.12

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(plugin): no-op ApCommonPlugin on unsupported platforms. ([2d377566](https://github.com/abc873693/ap_common/commit/2d3775660fa0349eb6d6a9fe15cb9e5af9ed026e))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(plugin): use LazyColumn to bypass Glance 10-element limit in course table widget. ([34504e41](https://github.com/abc873693/ap_common/commit/34504e41d05aff544d59595a9158d4f602a5113b))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(plugin): sync course palette to native AppWidgets. ([cf65f881](https://github.com/abc873693/ap_common/commit/cf65f88116aca1f04cd0ddd154a60c2e62a1337a))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(plugin): add per-widget preview layouts with dark theme support. ([4b6a2018](https://github.com/abc873693/ap_common/commit/4b6a2018473dc3614d83755add8e96eac451ce36))
 - **FEAT**(plugin): merge consecutive course slots and center widget titles. ([7ad0144a](https://github.com/abc873693/ap_common/commit/7ad0144a61c9c7c61aae0aa03e75b6679a21b1f5))
 - **FEAT**(plugin): add today schedule, countdown, and student ID widgets. ([361784a3](https://github.com/abc873693/ap_common/commit/361784a30fdf757ea6be76e6f8948c66c81af530))
 - **FEAT**(plugin): add iOS WidgetKit course table grid widget. ([3c85154f](https://github.com/abc873693/ap_common/commit/3c85154fb3e282b0212040962152480bbabef0f3))
 - **FEAT**(plugin): add course table grid widget for Android home screen. ([a4885ea7](https://github.com/abc873693/ap_common/commit/a4885ea7e19b9d4fce467aa9c56526dc7dbdf828))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): add guide for disabling specific Android widgets. ([cb1facc9](https://github.com/abc873693/ap_common/commit/cb1facc9265682929b95aea48b7bac3ec2c61f10))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.11

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(plugin): use LazyColumn to bypass Glance 10-element limit in course table widget. ([34504e41](https://github.com/abc873693/ap_common/commit/34504e41d05aff544d59595a9158d4f602a5113b))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(plugin): add per-widget preview layouts with dark theme support. ([4b6a2018](https://github.com/abc873693/ap_common/commit/4b6a2018473dc3614d83755add8e96eac451ce36))
 - **FEAT**(plugin): merge consecutive course slots and center widget titles. ([7ad0144a](https://github.com/abc873693/ap_common/commit/7ad0144a61c9c7c61aae0aa03e75b6679a21b1f5))
 - **FEAT**(plugin): add today schedule, countdown, and student ID widgets. ([361784a3](https://github.com/abc873693/ap_common/commit/361784a30fdf757ea6be76e6f8948c66c81af530))
 - **FEAT**(plugin): add iOS WidgetKit course table grid widget. ([3c85154f](https://github.com/abc873693/ap_common/commit/3c85154fb3e282b0212040962152480bbabef0f3))
 - **FEAT**(plugin): add course table grid widget for Android home screen. ([a4885ea7](https://github.com/abc873693/ap_common/commit/a4885ea7e19b9d4fce467aa9c56526dc7dbdf828))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): add guide for disabling specific Android widgets. ([cb1facc9](https://github.com/abc873693/ap_common/commit/cb1facc9265682929b95aea48b7bac3ec2c61f10))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.10

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(plugin): use LazyColumn to bypass Glance 10-element limit in course table widget. ([34504e41](https://github.com/abc873693/ap_common/commit/34504e41d05aff544d59595a9158d4f602a5113b))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(plugin): add per-widget preview layouts with dark theme support. ([4b6a2018](https://github.com/abc873693/ap_common/commit/4b6a2018473dc3614d83755add8e96eac451ce36))
 - **FEAT**(plugin): merge consecutive course slots and center widget titles. ([7ad0144a](https://github.com/abc873693/ap_common/commit/7ad0144a61c9c7c61aae0aa03e75b6679a21b1f5))
 - **FEAT**(plugin): add today schedule, countdown, and student ID widgets. ([361784a3](https://github.com/abc873693/ap_common/commit/361784a30fdf757ea6be76e6f8948c66c81af530))
 - **FEAT**(plugin): add iOS WidgetKit course table grid widget. ([3c85154f](https://github.com/abc873693/ap_common/commit/3c85154fb3e282b0212040962152480bbabef0f3))
 - **FEAT**(plugin): add course table grid widget for Android home screen. ([a4885ea7](https://github.com/abc873693/ap_common/commit/a4885ea7e19b9d4fce467aa9c56526dc7dbdf828))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): add guide for disabling specific Android widgets. ([cb1facc9](https://github.com/abc873693/ap_common/commit/cb1facc9265682929b95aea48b7bac3ec2c61f10))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.9

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(plugin): use LazyColumn to bypass Glance 10-element limit in course table widget. ([34504e41](https://github.com/abc873693/ap_common/commit/34504e41d05aff544d59595a9158d4f602a5113b))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(plugin): add per-widget preview layouts with dark theme support. ([4b6a2018](https://github.com/abc873693/ap_common/commit/4b6a2018473dc3614d83755add8e96eac451ce36))
 - **FEAT**(plugin): merge consecutive course slots and center widget titles. ([7ad0144a](https://github.com/abc873693/ap_common/commit/7ad0144a61c9c7c61aae0aa03e75b6679a21b1f5))
 - **FEAT**(plugin): add today schedule, countdown, and student ID widgets. ([361784a3](https://github.com/abc873693/ap_common/commit/361784a30fdf757ea6be76e6f8948c66c81af530))
 - **FEAT**(plugin): add iOS WidgetKit course table grid widget. ([3c85154f](https://github.com/abc873693/ap_common/commit/3c85154fb3e282b0212040962152480bbabef0f3))
 - **FEAT**(plugin): add course table grid widget for Android home screen. ([a4885ea7](https://github.com/abc873693/ap_common/commit/a4885ea7e19b9d4fce467aa9c56526dc7dbdf828))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): add guide for disabling specific Android widgets. ([cb1facc9](https://github.com/abc873693/ap_common/commit/cb1facc9265682929b95aea48b7bac3ec2c61f10))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.8

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(plugin): use LazyColumn to bypass Glance 10-element limit in course table widget. ([34504e41](https://github.com/abc873693/ap_common/commit/34504e41d05aff544d59595a9158d4f602a5113b))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(plugin): add per-widget preview layouts with dark theme support. ([4b6a2018](https://github.com/abc873693/ap_common/commit/4b6a2018473dc3614d83755add8e96eac451ce36))
 - **FEAT**(plugin): merge consecutive course slots and center widget titles. ([7ad0144a](https://github.com/abc873693/ap_common/commit/7ad0144a61c9c7c61aae0aa03e75b6679a21b1f5))
 - **FEAT**(plugin): add today schedule, countdown, and student ID widgets. ([361784a3](https://github.com/abc873693/ap_common/commit/361784a30fdf757ea6be76e6f8948c66c81af530))
 - **FEAT**(plugin): add iOS WidgetKit course table grid widget. ([3c85154f](https://github.com/abc873693/ap_common/commit/3c85154fb3e282b0212040962152480bbabef0f3))
 - **FEAT**(plugin): add course table grid widget for Android home screen. ([a4885ea7](https://github.com/abc873693/ap_common/commit/a4885ea7e19b9d4fce467aa9c56526dc7dbdf828))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): add guide for disabling specific Android widgets. ([cb1facc9](https://github.com/abc873693/ap_common/commit/cb1facc9265682929b95aea48b7bac3ec2c61f10))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.7

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(plugin): use LazyColumn to bypass Glance 10-element limit in course table widget. ([34504e41](https://github.com/abc873693/ap_common/commit/34504e41d05aff544d59595a9158d4f602a5113b))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(plugin): add per-widget preview layouts with dark theme support. ([4b6a2018](https://github.com/abc873693/ap_common/commit/4b6a2018473dc3614d83755add8e96eac451ce36))
 - **FEAT**(plugin): merge consecutive course slots and center widget titles. ([7ad0144a](https://github.com/abc873693/ap_common/commit/7ad0144a61c9c7c61aae0aa03e75b6679a21b1f5))
 - **FEAT**(plugin): add today schedule, countdown, and student ID widgets. ([361784a3](https://github.com/abc873693/ap_common/commit/361784a30fdf757ea6be76e6f8948c66c81af530))
 - **FEAT**(plugin): add iOS WidgetKit course table grid widget. ([3c85154f](https://github.com/abc873693/ap_common/commit/3c85154fb3e282b0212040962152480bbabef0f3))
 - **FEAT**(plugin): add course table grid widget for Android home screen. ([a4885ea7](https://github.com/abc873693/ap_common/commit/a4885ea7e19b9d4fce467aa9c56526dc7dbdf828))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): add guide for disabling specific Android widgets. ([cb1facc9](https://github.com/abc873693/ap_common/commit/cb1facc9265682929b95aea48b7bac3ec2c61f10))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.6

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(plugin): use LazyColumn to bypass Glance 10-element limit in course table widget. ([34504e41](https://github.com/abc873693/ap_common/commit/34504e41d05aff544d59595a9158d4f602a5113b))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(plugin): add per-widget preview layouts with dark theme support. ([4b6a2018](https://github.com/abc873693/ap_common/commit/4b6a2018473dc3614d83755add8e96eac451ce36))
 - **FEAT**(plugin): merge consecutive course slots and center widget titles. ([7ad0144a](https://github.com/abc873693/ap_common/commit/7ad0144a61c9c7c61aae0aa03e75b6679a21b1f5))
 - **FEAT**(plugin): add today schedule, countdown, and student ID widgets. ([361784a3](https://github.com/abc873693/ap_common/commit/361784a30fdf757ea6be76e6f8948c66c81af530))
 - **FEAT**(plugin): add iOS WidgetKit course table grid widget. ([3c85154f](https://github.com/abc873693/ap_common/commit/3c85154fb3e282b0212040962152480bbabef0f3))
 - **FEAT**(plugin): add course table grid widget for Android home screen. ([a4885ea7](https://github.com/abc873693/ap_common/commit/a4885ea7e19b9d4fce467aa9c56526dc7dbdf828))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): add guide for disabling specific Android widgets. ([cb1facc9](https://github.com/abc873693/ap_common/commit/cb1facc9265682929b95aea48b7bac3ec2c61f10))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.5

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.4

 - **REFACTOR**(plugin): migrate Android widget to kotlinx.serialization and Jetpack Glance. ([a712b2cd](https://github.com/abc873693/ap_common/commit/a712b2cd4cd9a595a138322173cfd91140f181e6))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(plugin): use FLAG_IMMUTABLE and add Android 12+ widget attributes. ([66ebe902](https://github.com/abc873693/ap_common/commit/66ebe9021171d961f285f10e69c9c26ce417daae))
 - **FIX**(plugin): sync iOS CourseData model and docs with Dart model. ([4047c945](https://github.com/abc873693/ap_common/commit/4047c9450a399eb188b6744b0d55586a3716e0b7))
 - **FIX**(ci): upgrade Gradle to 8.11.1 and address PR review feedback. ([575733e7](https://github.com/abc873693/ap_common/commit/575733e75c5b3d9f3f8924565341d3f90c54fbfe))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(plugin): add setFakeCourseWidget and update documentation. ([ac51812b](https://github.com/abc873693/ap_common/commit/ac51812b59c55f4a90f840bcc7d21c7154b44efe))
 - **FEAT**(plugin): add course widget support for Android and iOS. ([613249b1](https://github.com/abc873693/ap_common/commit/613249b15b358cc9b8add2ce4882cde809efed2f))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **DOCS**(plugin): clarify Android manifest is auto-merged from plugin. ([277e24c4](https://github.com/abc873693/ap_common/commit/277e24c4a62e73002899362952cd9fcb246d7367))

## 1.0.1-dev.3

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))

## 1.0.1-dev.2

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))

## 1.0.1-dev.1

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))

## 1.0.1-dev.0

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))

## 1.0.0

## 0.5.1

 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))

## 0.5.0-dev.4

 - fix(ap_common_plugin): android plugin register setting

 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(ap_common_plugin): update iOS setting for flutter 3.27 create. ([e65572db](https://github.com/abc873693/ap_common/commit/e65572dbd5f92b22612b4e7b4295aeca6b3bf42e))
 - **FEAT**(ap_common_plugin): upgrade gradle 8 setting for android 15. ([862d08af](https://github.com/abc873693/ap_common/commit/862d08af7006fa55ad42b23f9395cf95aed07916))

## 0.5.0-dev.3

 - **FEAT**(ap_common_plugin): update iOS setting for flutter 3.27 create. ([e65572db](https://github.com/abc873693/ap_common/commit/e65572dbd5f92b22612b4e7b4295aeca6b3bf42e))
 - **FEAT**(ap_common_plugin): upgrade gradle 8 setting for android 15. ([862d08af](https://github.com/abc873693/ap_common/commit/862d08af7006fa55ad42b23f9395cf95aed07916))

## 0.5.0-dev.2

 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))

## 0.5.0-dev.1

 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))

## 0.5.0-dev.0

 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))
 - **FEAT**: update example path. ([4d7390c9](https://github.com/abc873693/ap_common/commit/4d7390c9212631e1233c37c901a4454610783926))
 - **FEAT**: CI setting for mono-repo. ([d22f6d15](https://github.com/abc873693/ap_common/commit/d22f6d15f64879dbf9711574aba4bba6e227f128))
 - **FEAT**: melos generation setup. ([90497edd](https://github.com/abc873693/ap_common/commit/90497edd12d449e66991d654a03175edebf1e816))
 - **FEAT**: melos basic setting. ([fa8e1946](https://github.com/abc873693/ap_common/commit/fa8e1946fd478c1a0cf1635eaeb0fb60cc264750))

## [0.4.1] - 2024/03/17

* 修正相容 Android 14 gradle 版本

## [0.4.0] - 2022/03/24

* 修正小工具 Android 12 錯誤

## [0.3.1] - 2022/02/07

* 修正 Android 12 export 錯誤

## [0.3.0] - 2021/04/09

* 遷移至 Null-Safety

## [0.2.2] - 2021/02/25

* 改善教室位置空顯示

## [0.2.1] - 2021/02/25

* 改善教室位置空顯示

## [0.2.0] - 2021/02/22

* 修正 Java Calendar weekday 錯誤

## [0.1.5] - 2021/02/18

* 修正 course 空錯誤

## [0.1.4] - 2021/02/11

* 修正 plugin 格式錯誤

## [0.1.3] - 2021/02/11
[Bad Version]
* 修正 plugin 格式錯誤

## [0.1.2] - 2021/02/07

* 修正 Kotlin 錯誤

## [0.1.1] - 2021/02/02

* 修正載入舊版格式錯誤

## [0.1.0] - 2021/01/30

* 支援 `ap_common` v0.11 新版課表格式

## [0.0.6] - 2021/10/02

* 改善 Android 日期格式錯誤

## [0.0.5] - 2020/09/19

* 改善學期格式錯誤

## [0.0.4] - 2020/05/09

* 加入目前學期標前改善所取得的課程資料

## [0.0.3] - 2020/04/24

* 更改參數設定
* 加入可點擊小工具開啟App

## [0.0.2] - 2020/04/13

* 修正Android 小工具更新時間
* 更改提醒文字

## [0.0.1] - 2020/04/12

* 加入Android 上課提醒 桌面小工具