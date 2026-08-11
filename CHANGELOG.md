# Change Log

All notable changes to this project will be documented in this file.
See [Conventional Commits](https://conventionalcommits.org) for commit guidelines.

## 2026-08-12

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.14`](#ap_common---v101-dev14)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.15`](#ap_common_announcement_ui---v101-dev15)
 - [`ap_common_core` - `v1.0.1-dev.12`](#ap_common_core---v101-dev12)
 - [`ap_common_firebase` - `v1.0.1-dev.15`](#ap_common_firebase---v101-dev15)
 - [`ap_common_flutter_core` - `v1.1.0-dev.15`](#ap_common_flutter_core---v110-dev15)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.15`](#ap_common_flutter_platform---v101-dev15)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.15`](#ap_common_flutter_ui---v110-dev15)
 - [`ap_common_plugin` - `v1.0.1-dev.14`](#ap_common_plugin---v101-dev14)

---

#### `ap_common` - `v1.0.1-dev.14`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.15`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.12`

 - **REFACTOR**(core): convert static methods to factory constructors in CustomCourseData. ([9b67706e](https://github.com/abc873693/ap_common/commit/9b67706ef4e562cb765d5e7de7e8d46dbe3da096))
 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.15`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.15`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(i18n): fix imageCompressHint parameter name mismatch in Japanese locale. ([d1c9923a](https://github.com/abc873693/ap_common/commit/d1c9923a224db1cd937e6f6ee9bb8e640544bcde))
 - **FIX**(i18n): correct spelling and grammar errors in English translations. ([37822f90](https://github.com/abc873693/ap_common/commit/37822f90c207d509b48348247ced1a1696649f6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(ui): add menu icon and search button configuration to CourseScaffold. ([02f0e178](https://github.com/abc873693/ap_common/commit/02f0e178f56ac3895a90a7226f493a37dde8efcb))
 - **FEAT**(ui): add shorten names for semester-picker. ([4b67f700](https://github.com/abc873693/ap_common/commit/4b67f7006582f39c8a0a39de7fbac442b5deaa27))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(i18n): add Japanese locale and update contributor list. ([eef32e95](https://github.com/abc873693/ap_common/commit/eef32e95ba225e99e84caa88ab1894de9e284778))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.15`

 - **REFACTOR**(platform): 以 gal 取代 photo_manager 進行圖片儲存 ([#166](https://github.com/abc873693/ap_common/issues/166)). ([ecbf7072](https://github.com/abc873693/ap_common/commit/ecbf7072188ab6dcc6ce9ba60302e4fcff8f5534))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(platform): declare intl test dependency. ([0e4f9039](https://github.com/abc873693/ap_common/commit/0e4f903914886d42eedb3586261b27ec893c74ca))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.15`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(platform): 以 gal 取代 photo_manager 進行圖片儲存 ([#166](https://github.com/abc873693/ap_common/issues/166)). ([ecbf7072](https://github.com/abc873693/ap_common/commit/ecbf7072188ab6dcc6ce9ba60302e4fcff8f5534))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_ui): improve login page UX with inline loading, password toggle and logo subtitle ([#177](https://github.com/abc873693/ap_common/issues/177)). ([1f1260f9](https://github.com/abc873693/ap_common/commit/1f1260f99475e1dcba9a9a9f05692f03747cc650))
 - **REFACTOR**(ui): remove duplicate SemesterPickerBottomSheet widget. ([26ad6570](https://github.com/abc873693/ap_common/commit/26ad6570355f5c84c70b41c79b4061fb36eba7eb))
 - **REFACTOR**(flutter_ui): extract grouped picker into OptionPickerBottomSheet. ([82e3c11d](https://github.com/abc873693/ap_common/commit/82e3c11d734185ce693be033230a61cf0e1ac4f8))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(home): reorder dashboard widgets and simplify layout. ([85c04068](https://github.com/abc873693/ap_common/commit/85c04068275c9ae91a52ec7d86ecb06b92f8dd10))
 - **FIX**(course): add isDefaultSemester to onCourseLoaded callback. ([7a064477](https://github.com/abc873693/ap_common/commit/7a064477c9f8e679e88151c6e9f645510723e9a7))
 - **FIX**(ui): restore scrolling on UserInfoScaffold. ([ca12f025](https://github.com/abc873693/ap_common/commit/ca12f02573417bfbc410b0dbcc495e9fd95a8131))
 - **FIX**(ui): propagate CoursePaletteTheme into CourseEditSheet. ([0650d184](https://github.com/abc873693/ap_common/commit/0650d1848030712fabe6b8d0d7f2db79b8602d3a))
 - **FIX**(ui): streamline score entry handling in ScoreGPACard. ([cb4c1aa6](https://github.com/abc873693/ap_common/commit/cb4c1aa6e11a641a3fe4a0f291a2403d23c5c6c5))
 - **FIX**(ui): handle null scores in ScoreGPACard differently and adjust layout. ([2b89cffb](https://github.com/abc873693/ap_common/commit/2b89cffb3331e989a740876a1556a6caf9c75c5e))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**: fix comment error in home_page_scaffold. ([56535125](https://github.com/abc873693/ap_common/commit/565351255ec2934d530e34036de4e31e74323f0e))
 - **FIX**(ui): avoid F-bounded ThemeExtension inference trap in list literal. ([8e66f2c1](https://github.com/abc873693/ap_common/commit/8e66f2c1a7c51f51780513cb954959bff855b57b))
 - **FIX**(ui): correct course overlap and score calculations. ([fcf94510](https://github.com/abc873693/ap_common/commit/fcf945107cb8db45ab4c919a90974c7a2597fa91))
 - **FIX**(ui): keep _getCourseColor single-arg so existing call sites compile. ([2063c39a](https://github.com/abc873693/ap_common/commit/2063c39a948692f7acfc3a1a70bd15c1d74ebf03))
 - **FIX**(ui): remove CoursePaletteTheme const assert that blocks const evaluation. ([906af6de](https://github.com/abc873693/ap_common/commit/906af6de99ee92788f84f2e1ec01a8a3c67c98be))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(ui): fix ScoreScaffold gradePoint mode display errors. ([c10dbd5d](https://github.com/abc873693/ap_common/commit/c10dbd5d32c98372e1d2c1dbb84d21bb46477808))
 - **FIX**(color): enhance score color logic with passing score parameters. ([e6c9719a](https://github.com/abc873693/ap_common/commit/e6c9719afef679bb5e8326676ff10bfd385a0279))
 - **FIX**(ui): resolve lint exposed by Flutter 3.44. ([3b5f69ae](https://github.com/abc873693/ap_common/commit/3b5f69ae130b8d25c4100e2f4528e90b0c24d798))
 - **FIX**(theme): support Cupertino transitions on Flutter 3.44. ([5c98c943](https://github.com/abc873693/ap_common/commit/5c98c943f3751d5fe7e923075ff5e5b9e83d77f9))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**(ui): add featureTag analytics and selectedLabel fallback in OptionPickerBottomSheet. ([2d6b26aa](https://github.com/abc873693/ap_common/commit/2d6b26aa108aa8cb0860acbb1e1892defb56aea6))
 - **FIX**(semester-picker): prevent text overflow in semester selection. ([4fbe6edb](https://github.com/abc873693/ap_common/commit/4fbe6edb36a0b6671c85f8eb90f003a78cf0eb0c))
 - **FIX**(ui): pass active palette into CourseEditSheet explicitly. ([859a5f36](https://github.com/abc873693/ap_common/commit/859a5f3628af59916b8e43018fea01fba625bac7))
 - **FIX**(ui): match CourseEditSheet picker swatch opacity to card. ([4ee20728](https://github.com/abc873693/ap_common/commit/4ee20728b5be8eac552e543f8b2e5259d18e6098))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FIX**(home): responsive carousel height for small screens (iPhone SE). ([55527ab6](https://github.com/abc873693/ap_common/commit/55527ab6ff970e4f345bbbf17276845f6898b4d7))
 - **FIX**(about): apply theme-aware color to contact us icons. ([e729365d](https://github.com/abc873693/ap_common/commit/e729365d4972fd54abf5f26a3b276bea187a2221))
 - **FIX**(ui): render course card at full palette opacity. ([f4f0657f](https://github.com/abc873693/ap_common/commit/f4f0657f92884d7514420b4f47069f32b7192d2c))
 - **FIX**(course): remove add icon from empty cells in course table. ([0e5906d7](https://github.com/abc873693/ap_common/commit/0e5906d78b786fdf4319174b276d6f3c42090e2f))
 - **FIX**(course): use last consecutive slot end time and sync color across views. ([f26c3744](https://github.com/abc873693/ap_common/commit/f26c37442a13f220652bc0e550eaeec331effd6d))
 - **FIX**(ui): use local notify data for course BottomSheet state. ([5fa51d8c](https://github.com/abc873693/ap_common/commit/5fa51d8caedb3c2294e571f0f55154493ff945ea))
 - **FIX**(ui): support array format in changelog version dialog. ([9dd9631f](https://github.com/abc873693/ap_common/commit/9dd9631f7394587107618201a06cad6798c0f4af))
 - **FIX**(ui): remove listener leak in SemesterPicker BottomSheet. ([3028d348](https://github.com/abc873693/ap_common/commit/3028d3489b56b01f3533c1c126b6d756af9a81ac))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**(ui): fix dashboard and carsourel layout overflow problem and add reactive design for mobile and tablet. ([f84f782a](https://github.com/abc873693/ap_common/commit/f84f782a247f44b0d786c5edcdc7fe2d8518a80f))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add SemesterPickerController to manage loading state across picker paths. ([712781b6](https://github.com/abc873693/ap_common/commit/712781b615916b56fc41e42f20563399ad3f65d1))
 - **FEAT**(score): auto-detect letter grades and display corresponding UI. ([6d26b72b](https://github.com/abc873693/ap_common/commit/6d26b72b7a7bddc07244025a2c30c8ebaf562530))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(ui): add onCourseLoaded callback to ApCoursePage. ([924577d5](https://github.com/abc873693/ap_common/commit/924577d5defee153b9e593c034ff0517550561bc))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add EmptyScheduleCard widget and improve dashboard login state. ([56d34635](https://github.com/abc873693/ap_common/commit/56d34635f64aa85d8c60125429975f619ac66365))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(flutter_ui): add SemesterPickerBottomSheet pure picker widget. ([9b1dd1d9](https://github.com/abc873693/ap_common/commit/9b1dd1d9e98bd99021383f2a06ef814a1fc5dfed))
 - **FEAT**(flutter_ui): add generic OptionPickerBottomSheet widget. ([ee0e7649](https://github.com/abc873693/ap_common/commit/ee0e7649647cd094b21e3817b99f113864e0da33))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(ui): add optional appBarTitle to LoginScaffold. ([a3849be9](https://github.com/abc873693/ap_common/commit/a3849be9a63a990b78c308bb9ada19d4a9e80ad8))
 - **FEAT**(ui): add CoursePaletteTheme for swappable course color schemes. ([071f0c75](https://github.com/abc873693/ap_common/commit/071f0c75447ce9f03926126db87931b43259500e))
 - **FEAT**(ui): add in-CourseScaffold palette picker. ([c93fe323](https://github.com/abc873693/ap_common/commit/c93fe3237f2146682ac3880de06cf8423612bac0))
 - **FEAT**(ui): pair CoursePaletteTheme with an optional dark variant. ([6b0220eb](https://github.com/abc873693/ap_common/commit/6b0220eb67725dd345c981b2044243c929b0f737))
 - **FEAT**(ui): preview dark variant in CoursePalettePickerSheet. ([c38afbfd](https://github.com/abc873693/ap_common/commit/c38afbfd5eefbcbcdad2b0cc20092512986cb7e1))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(plugin): sync course palette to native AppWidgets. ([cf65f881](https://github.com/abc873693/ap_common/commit/cf65f88116aca1f04cd0ddd154a60c2e62a1337a))
 - **FEAT**(ui): add Material Bold, Nord, and Vibrant palettes. ([01b25375](https://github.com/abc873693/ap_common/commit/01b25375c6b2942a65f768a17e60975eadc8b6a0))
 - **FEAT**(ui): expose iOSThemeColors as a seed palette on ApTheme. ([2ca8fd18](https://github.com/abc873693/ap_common/commit/2ca8fd18d0fa1ac1e3efe10ece595cb13442ce7c))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**(home): add onTap to QuickInfoItem and adjust dashboard 1:1 layout. ([b2150ebd](https://github.com/abc873693/ap_common/commit/b2150ebd1205bc1e6dda5e65185faf4fdab93d13))
 - **FEAT**(ui): auto-sync palette to native widgets from CourseScaffold. ([159bee80](https://github.com/abc873693/ap_common/commit/159bee80d34b70b36249116e730d0df11d5a87e0))
 - **FEAT**(ui): add shorten names for semester-picker. ([4b67f700](https://github.com/abc873693/ap_common/commit/4b67f7006582f39c8a0a39de7fbac442b5deaa27))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**(ui): add CourseSettings widget for course palette selection. ([9b5762d6](https://github.com/abc873693/ap_common/commit/9b5762d6f283822de95369ca79e3f94d817042a8))
 - **FEAT**(ui): add menu icon and search button configuration to CourseScaffold. ([02f0e178](https://github.com/abc873693/ap_common/commit/02f0e178f56ac3895a90a7226f493a37dde8efcb))
 - **FEAT**(ui): add Luster color palette with light and dark variants to CoursePaletteTheme. ([ee08c741](https://github.com/abc873693/ap_common/commit/ee08c74191b4793818688ae9b8397d0f1b5feb7b))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**(ui): add showPRCard option to ScoreScaffold and rearrange semester. ([39bb2abb](https://github.com/abc873693/ap_common/commit/39bb2abbc568406de71d500ca0a9ad7709e000df))
 - **FEAT**(course): enhance course visibility management and overlap handling. ([d06d60af](https://github.com/abc873693/ap_common/commit/d06d60af1dcdaab32ed200b479f1be3456b26c36))
 - **FEAT**(score): enhance score parsing and display for grade points and numeric scores. ([4ab92665](https://github.com/abc873693/ap_common/commit/4ab92665a341711966c9f463886fbe0cddce49f2))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))

#### `ap_common_plugin` - `v1.0.1-dev.14`

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


## 2026-05-27

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.13`](#ap_common---v101-dev13)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.14`](#ap_common_announcement_ui---v101-dev14)
 - [`ap_common_core` - `v1.0.1-dev.11`](#ap_common_core---v101-dev11)
 - [`ap_common_firebase` - `v1.0.1-dev.14`](#ap_common_firebase---v101-dev14)
 - [`ap_common_flutter_core` - `v1.1.0-dev.14`](#ap_common_flutter_core---v110-dev14)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.14`](#ap_common_flutter_platform---v101-dev14)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.14`](#ap_common_flutter_ui---v110-dev14)
 - [`ap_common_plugin` - `v1.0.1-dev.13`](#ap_common_plugin---v101-dev13)

---

#### `ap_common` - `v1.0.1-dev.13`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.14`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.11`

 - **REFACTOR**(core): convert static methods to factory constructors in CustomCourseData. ([9b67706e](https://github.com/abc873693/ap_common/commit/9b67706ef4e562cb765d5e7de7e8d46dbe3da096))
 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.14`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.14`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(i18n): fix imageCompressHint parameter name mismatch in Japanese locale. ([d1c9923a](https://github.com/abc873693/ap_common/commit/d1c9923a224db1cd937e6f6ee9bb8e640544bcde))
 - **FIX**(i18n): correct spelling and grammar errors in English translations. ([37822f90](https://github.com/abc873693/ap_common/commit/37822f90c207d509b48348247ced1a1696649f6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(ui): add menu icon and search button configuration to CourseScaffold. ([02f0e178](https://github.com/abc873693/ap_common/commit/02f0e178f56ac3895a90a7226f493a37dde8efcb))
 - **FEAT**(ui): add shorten names for semester-picker. ([4b67f700](https://github.com/abc873693/ap_common/commit/4b67f7006582f39c8a0a39de7fbac442b5deaa27))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(i18n): add Japanese locale and update contributor list. ([eef32e95](https://github.com/abc873693/ap_common/commit/eef32e95ba225e99e84caa88ab1894de9e284778))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.14`

 - **REFACTOR**(platform): 以 gal 取代 photo_manager 進行圖片儲存 ([#166](https://github.com/abc873693/ap_common/issues/166)). ([ecbf7072](https://github.com/abc873693/ap_common/commit/ecbf7072188ab6dcc6ce9ba60302e4fcff8f5534))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.14`

 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): remove duplicate SemesterPickerBottomSheet widget. ([26ad6570](https://github.com/abc873693/ap_common/commit/26ad6570355f5c84c70b41c79b4061fb36eba7eb))
 - **REFACTOR**(platform): 以 gal 取代 photo_manager 進行圖片儲存 ([#166](https://github.com/abc873693/ap_common/issues/166)). ([ecbf7072](https://github.com/abc873693/ap_common/commit/ecbf7072188ab6dcc6ce9ba60302e4fcff8f5534))
 - **REFACTOR**(flutter_ui): improve login page UX with inline loading, password toggle and logo subtitle ([#177](https://github.com/abc873693/ap_common/issues/177)). ([1f1260f9](https://github.com/abc873693/ap_common/commit/1f1260f99475e1dcba9a9a9f05692f03747cc650))
 - **REFACTOR**(flutter_ui): extract grouped picker into OptionPickerBottomSheet. ([82e3c11d](https://github.com/abc873693/ap_common/commit/82e3c11d734185ce693be033230a61cf0e1ac4f8))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(home): reorder dashboard widgets and simplify layout. ([85c04068](https://github.com/abc873693/ap_common/commit/85c04068275c9ae91a52ec7d86ecb06b92f8dd10))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(ui): avoid F-bounded ThemeExtension inference trap in list literal. ([8e66f2c1](https://github.com/abc873693/ap_common/commit/8e66f2c1a7c51f51780513cb954959bff855b57b))
 - **FIX**(ui): handle null scores in ScoreGPACard differently and adjust layout. ([2b89cffb](https://github.com/abc873693/ap_common/commit/2b89cffb3331e989a740876a1556a6caf9c75c5e))
 - **FIX**(ui): remove CoursePaletteTheme const assert that blocks const evaluation. ([906af6de](https://github.com/abc873693/ap_common/commit/906af6de99ee92788f84f2e1ec01a8a3c67c98be))
 - **FIX**(ui): propagate CoursePaletteTheme into CourseEditSheet. ([0650d184](https://github.com/abc873693/ap_common/commit/0650d1848030712fabe6b8d0d7f2db79b8602d3a))
 - **FIX**(ui): fix ScoreScaffold gradePoint mode display errors. ([c10dbd5d](https://github.com/abc873693/ap_common/commit/c10dbd5d32c98372e1d2c1dbb84d21bb46477808))
 - **FIX**(course): add isDefaultSemester to onCourseLoaded callback. ([7a064477](https://github.com/abc873693/ap_common/commit/7a064477c9f8e679e88151c6e9f645510723e9a7))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**(ui): keep _getCourseColor single-arg so existing call sites compile. ([2063c39a](https://github.com/abc873693/ap_common/commit/2063c39a948692f7acfc3a1a70bd15c1d74ebf03))
 - **FIX**: fix comment error in home_page_scaffold. ([56535125](https://github.com/abc873693/ap_common/commit/565351255ec2934d530e34036de4e31e74323f0e))
 - **FIX**(ui): add featureTag analytics and selectedLabel fallback in OptionPickerBottomSheet. ([2d6b26aa](https://github.com/abc873693/ap_common/commit/2d6b26aa108aa8cb0860acbb1e1892defb56aea6))
 - **FIX**(ui): streamline score entry handling in ScoreGPACard. ([cb4c1aa6](https://github.com/abc873693/ap_common/commit/cb4c1aa6e11a641a3fe4a0f291a2403d23c5c6c5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**(ui): render course card at full palette opacity. ([f4f0657f](https://github.com/abc873693/ap_common/commit/f4f0657f92884d7514420b4f47069f32b7192d2c))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(ui): match CourseEditSheet picker swatch opacity to card. ([4ee20728](https://github.com/abc873693/ap_common/commit/4ee20728b5be8eac552e543f8b2e5259d18e6098))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**(about): apply theme-aware color to contact us icons. ([e729365d](https://github.com/abc873693/ap_common/commit/e729365d4972fd54abf5f26a3b276bea187a2221))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FIX**(course): remove add icon from empty cells in course table. ([0e5906d7](https://github.com/abc873693/ap_common/commit/0e5906d78b786fdf4319174b276d6f3c42090e2f))
 - **FIX**(course): use last consecutive slot end time and sync color across views. ([f26c3744](https://github.com/abc873693/ap_common/commit/f26c37442a13f220652bc0e550eaeec331effd6d))
 - **FIX**(ui): use local notify data for course BottomSheet state. ([5fa51d8c](https://github.com/abc873693/ap_common/commit/5fa51d8caedb3c2294e571f0f55154493ff945ea))
 - **FIX**(ui): support array format in changelog version dialog. ([9dd9631f](https://github.com/abc873693/ap_common/commit/9dd9631f7394587107618201a06cad6798c0f4af))
 - **FIX**(ui): remove listener leak in SemesterPicker BottomSheet. ([3028d348](https://github.com/abc873693/ap_common/commit/3028d3489b56b01f3533c1c126b6d756af9a81ac))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**(home): responsive carousel height for small screens (iPhone SE). ([55527ab6](https://github.com/abc873693/ap_common/commit/55527ab6ff970e4f345bbbf17276845f6898b4d7))
 - **FIX**(ui): pass active palette into CourseEditSheet explicitly. ([859a5f36](https://github.com/abc873693/ap_common/commit/859a5f3628af59916b8e43018fea01fba625bac7))
 - **FIX**(ui): fix dashboard and carsourel layout overflow problem and add reactive design for mobile and tablet. ([f84f782a](https://github.com/abc873693/ap_common/commit/f84f782a247f44b0d786c5edcdc7fe2d8518a80f))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FEAT**(score): auto-detect letter grades and display corresponding UI. ([6d26b72b](https://github.com/abc873693/ap_common/commit/6d26b72b7a7bddc07244025a2c30c8ebaf562530))
 - **FEAT**(ui): add SemesterPickerController to manage loading state across picker paths. ([712781b6](https://github.com/abc873693/ap_common/commit/712781b615916b56fc41e42f20563399ad3f65d1))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(ui): add onCourseLoaded callback to ApCoursePage. ([924577d5](https://github.com/abc873693/ap_common/commit/924577d5defee153b9e593c034ff0517550561bc))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(home): add EmptyScheduleCard widget and improve dashboard login state. ([56d34635](https://github.com/abc873693/ap_common/commit/56d34635f64aa85d8c60125429975f619ac66365))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(flutter_ui): add SemesterPickerBottomSheet pure picker widget. ([9b1dd1d9](https://github.com/abc873693/ap_common/commit/9b1dd1d9e98bd99021383f2a06ef814a1fc5dfed))
 - **FEAT**(flutter_ui): add generic OptionPickerBottomSheet widget. ([ee0e7649](https://github.com/abc873693/ap_common/commit/ee0e7649647cd094b21e3817b99f113864e0da33))
 - **FEAT**(ui): add optional appBarTitle to LoginScaffold. ([a3849be9](https://github.com/abc873693/ap_common/commit/a3849be9a63a990b78c308bb9ada19d4a9e80ad8))
 - **FEAT**(ui): add CoursePaletteTheme for swappable course color schemes. ([071f0c75](https://github.com/abc873693/ap_common/commit/071f0c75447ce9f03926126db87931b43259500e))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): add in-CourseScaffold palette picker. ([c93fe323](https://github.com/abc873693/ap_common/commit/c93fe3237f2146682ac3880de06cf8423612bac0))
 - **FEAT**(ui): pair CoursePaletteTheme with an optional dark variant. ([6b0220eb](https://github.com/abc873693/ap_common/commit/6b0220eb67725dd345c981b2044243c929b0f737))
 - **FEAT**(ui): preview dark variant in CoursePalettePickerSheet. ([c38afbfd](https://github.com/abc873693/ap_common/commit/c38afbfd5eefbcbcdad2b0cc20092512986cb7e1))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**(plugin): sync course palette to native AppWidgets. ([cf65f881](https://github.com/abc873693/ap_common/commit/cf65f88116aca1f04cd0ddd154a60c2e62a1337a))
 - **FEAT**(ui): add Material Bold, Nord, and Vibrant palettes. ([01b25375](https://github.com/abc873693/ap_common/commit/01b25375c6b2942a65f768a17e60975eadc8b6a0))
 - **FEAT**(ui): expose iOSThemeColors as a seed palette on ApTheme. ([2ca8fd18](https://github.com/abc873693/ap_common/commit/2ca8fd18d0fa1ac1e3efe10ece595cb13442ce7c))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**(ui): auto-sync palette to native widgets from CourseScaffold. ([159bee80](https://github.com/abc873693/ap_common/commit/159bee80d34b70b36249116e730d0df11d5a87e0))
 - **FEAT**(ui): add shorten names for semester-picker. ([4b67f700](https://github.com/abc873693/ap_common/commit/4b67f7006582f39c8a0a39de7fbac442b5deaa27))
 - **FEAT**(ui): add CourseSettings widget for course palette selection. ([9b5762d6](https://github.com/abc873693/ap_common/commit/9b5762d6f283822de95369ca79e3f94d817042a8))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**(ui): add menu icon and search button configuration to CourseScaffold. ([02f0e178](https://github.com/abc873693/ap_common/commit/02f0e178f56ac3895a90a7226f493a37dde8efcb))
 - **FEAT**(ui): add Luster color palette with light and dark variants to CoursePaletteTheme. ([ee08c741](https://github.com/abc873693/ap_common/commit/ee08c74191b4793818688ae9b8397d0f1b5feb7b))
 - **FEAT**(ui): add showPRCard option to ScoreScaffold and rearrange semester. ([39bb2abb](https://github.com/abc873693/ap_common/commit/39bb2abbc568406de71d500ca0a9ad7709e000df))
 - **FEAT**(home): add onTap to QuickInfoItem and adjust dashboard 1:1 layout. ([b2150ebd](https://github.com/abc873693/ap_common/commit/b2150ebd1205bc1e6dda5e65185faf4fdab93d13))

#### `ap_common_plugin` - `v1.0.1-dev.13`

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


## 2026-04-19

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.12`](#ap_common---v101-dev12)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.13`](#ap_common_announcement_ui---v101-dev13)
 - [`ap_common_core` - `v1.0.1-dev.10`](#ap_common_core---v101-dev10)
 - [`ap_common_firebase` - `v1.0.1-dev.13`](#ap_common_firebase---v101-dev13)
 - [`ap_common_flutter_core` - `v1.1.0-dev.13`](#ap_common_flutter_core---v110-dev13)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.13`](#ap_common_flutter_platform---v101-dev13)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.13`](#ap_common_flutter_ui---v110-dev13)
 - [`ap_common_plugin` - `v1.0.1-dev.12`](#ap_common_plugin---v101-dev12)

---

#### `ap_common` - `v1.0.1-dev.12`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.13`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.10`

 - **REFACTOR**(core): convert static methods to factory constructors in CustomCourseData. ([9b67706e](https://github.com/abc873693/ap_common/commit/9b67706ef4e562cb765d5e7de7e8d46dbe3da096))
 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.13`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.13`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(i18n): fix imageCompressHint parameter name mismatch in Japanese locale. ([d1c9923a](https://github.com/abc873693/ap_common/commit/d1c9923a224db1cd937e6f6ee9bb8e640544bcde))
 - **FIX**(i18n): correct spelling and grammar errors in English translations. ([37822f90](https://github.com/abc873693/ap_common/commit/37822f90c207d509b48348247ced1a1696649f6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(i18n): add Japanese locale and update contributor list. ([eef32e95](https://github.com/abc873693/ap_common/commit/eef32e95ba225e99e84caa88ab1894de9e284778))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.13`

 - **REFACTOR**(platform): 以 gal 取代 photo_manager 進行圖片儲存 ([#166](https://github.com/abc873693/ap_common/issues/166)). ([ecbf7072](https://github.com/abc873693/ap_common/commit/ecbf7072188ab6dcc6ce9ba60302e4fcff8f5534))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.13`

 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(home): reorder dashboard widgets and simplify layout. ([85c04068](https://github.com/abc873693/ap_common/commit/85c04068275c9ae91a52ec7d86ecb06b92f8dd10))
 - **REFACTOR**(platform): 以 gal 取代 photo_manager 進行圖片儲存 ([#166](https://github.com/abc873693/ap_common/issues/166)). ([ecbf7072](https://github.com/abc873693/ap_common/commit/ecbf7072188ab6dcc6ce9ba60302e4fcff8f5534))
 - **REFACTOR**(flutter_ui): improve login page UX with inline loading, password toggle and logo subtitle ([#177](https://github.com/abc873693/ap_common/issues/177)). ([1f1260f9](https://github.com/abc873693/ap_common/commit/1f1260f99475e1dcba9a9a9f05692f03747cc650))
 - **REFACTOR**(ui): remove duplicate SemesterPickerBottomSheet widget. ([26ad6570](https://github.com/abc873693/ap_common/commit/26ad6570355f5c84c70b41c79b4061fb36eba7eb))
 - **REFACTOR**(flutter_ui): extract grouped picker into OptionPickerBottomSheet. ([82e3c11d](https://github.com/abc873693/ap_common/commit/82e3c11d734185ce693be033230a61cf0e1ac4f8))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**(ui): propagate CoursePaletteTheme into CourseEditSheet. ([0650d184](https://github.com/abc873693/ap_common/commit/0650d1848030712fabe6b8d0d7f2db79b8602d3a))
 - **FIX**(ui): fix ScoreScaffold gradePoint mode display errors. ([c10dbd5d](https://github.com/abc873693/ap_common/commit/c10dbd5d32c98372e1d2c1dbb84d21bb46477808))
 - **FIX**(course): add isDefaultSemester to onCourseLoaded callback. ([7a064477](https://github.com/abc873693/ap_common/commit/7a064477c9f8e679e88151c6e9f645510723e9a7))
 - **FIX**(ui): match CourseEditSheet picker swatch opacity to card. ([4ee20728](https://github.com/abc873693/ap_common/commit/4ee20728b5be8eac552e543f8b2e5259d18e6098))
 - **FIX**(ui): render course card at full palette opacity. ([f4f0657f](https://github.com/abc873693/ap_common/commit/f4f0657f92884d7514420b4f47069f32b7192d2c))
 - **FIX**(about): apply theme-aware color to contact us icons. ([e729365d](https://github.com/abc873693/ap_common/commit/e729365d4972fd54abf5f26a3b276bea187a2221))
 - **FIX**(ui): pass active palette into CourseEditSheet explicitly. ([859a5f36](https://github.com/abc873693/ap_common/commit/859a5f3628af59916b8e43018fea01fba625bac7))
 - **FIX**(course): remove add icon from empty cells in course table. ([0e5906d7](https://github.com/abc873693/ap_common/commit/0e5906d78b786fdf4319174b276d6f3c42090e2f))
 - **FIX**(course): use last consecutive slot end time and sync color across views. ([f26c3744](https://github.com/abc873693/ap_common/commit/f26c37442a13f220652bc0e550eaeec331effd6d))
 - **FIX**(home): responsive carousel height for small screens (iPhone SE). ([55527ab6](https://github.com/abc873693/ap_common/commit/55527ab6ff970e4f345bbbf17276845f6898b4d7))
 - **FIX**(ui): support array format in changelog version dialog. ([9dd9631f](https://github.com/abc873693/ap_common/commit/9dd9631f7394587107618201a06cad6798c0f4af))
 - **FIX**(ui): remove listener leak in SemesterPicker BottomSheet. ([3028d348](https://github.com/abc873693/ap_common/commit/3028d3489b56b01f3533c1c126b6d756af9a81ac))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**(ui): avoid F-bounded ThemeExtension inference trap in list literal. ([8e66f2c1](https://github.com/abc873693/ap_common/commit/8e66f2c1a7c51f51780513cb954959bff855b57b))
 - **FIX**(ui): keep _getCourseColor single-arg so existing call sites compile. ([2063c39a](https://github.com/abc873693/ap_common/commit/2063c39a948692f7acfc3a1a70bd15c1d74ebf03))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(ui): add featureTag analytics and selectedLabel fallback in OptionPickerBottomSheet. ([2d6b26aa](https://github.com/abc873693/ap_common/commit/2d6b26aa108aa8cb0860acbb1e1892defb56aea6))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(ui): remove CoursePaletteTheme const assert that blocks const evaluation. ([906af6de](https://github.com/abc873693/ap_common/commit/906af6de99ee92788f84f2e1ec01a8a3c67c98be))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FIX**(ui): use local notify data for course BottomSheet state. ([5fa51d8c](https://github.com/abc873693/ap_common/commit/5fa51d8caedb3c2294e571f0f55154493ff945ea))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(ui): add onCourseLoaded callback to ApCoursePage. ([924577d5](https://github.com/abc873693/ap_common/commit/924577d5defee153b9e593c034ff0517550561bc))
 - **FEAT**(score): auto-detect letter grades and display corresponding UI. ([6d26b72b](https://github.com/abc873693/ap_common/commit/6d26b72b7a7bddc07244025a2c30c8ebaf562530))
 - **FEAT**(ui): add SemesterPickerController to manage loading state across picker paths. ([712781b6](https://github.com/abc873693/ap_common/commit/712781b615916b56fc41e42f20563399ad3f65d1))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): add onTap to QuickInfoItem and adjust dashboard 1:1 layout. ([b2150ebd](https://github.com/abc873693/ap_common/commit/b2150ebd1205bc1e6dda5e65185faf4fdab93d13))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(home): add EmptyScheduleCard widget and improve dashboard login state. ([56d34635](https://github.com/abc873693/ap_common/commit/56d34635f64aa85d8c60125429975f619ac66365))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(flutter_ui): add SemesterPickerBottomSheet pure picker widget. ([9b1dd1d9](https://github.com/abc873693/ap_common/commit/9b1dd1d9e98bd99021383f2a06ef814a1fc5dfed))
 - **FEAT**(flutter_ui): add generic OptionPickerBottomSheet widget. ([ee0e7649](https://github.com/abc873693/ap_common/commit/ee0e7649647cd094b21e3817b99f113864e0da33))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**(ui): add optional appBarTitle to LoginScaffold. ([a3849be9](https://github.com/abc873693/ap_common/commit/a3849be9a63a990b78c308bb9ada19d4a9e80ad8))
 - **FEAT**(ui): add CoursePaletteTheme for swappable course color schemes. ([071f0c75](https://github.com/abc873693/ap_common/commit/071f0c75447ce9f03926126db87931b43259500e))
 - **FEAT**(ui): add in-CourseScaffold palette picker. ([c93fe323](https://github.com/abc873693/ap_common/commit/c93fe3237f2146682ac3880de06cf8423612bac0))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**(ui): pair CoursePaletteTheme with an optional dark variant. ([6b0220eb](https://github.com/abc873693/ap_common/commit/6b0220eb67725dd345c981b2044243c929b0f737))
 - **FEAT**(ui): preview dark variant in CoursePalettePickerSheet. ([c38afbfd](https://github.com/abc873693/ap_common/commit/c38afbfd5eefbcbcdad2b0cc20092512986cb7e1))
 - **FEAT**(plugin): sync course palette to native AppWidgets. ([cf65f881](https://github.com/abc873693/ap_common/commit/cf65f88116aca1f04cd0ddd154a60c2e62a1337a))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**(ui): add Material Bold, Nord, and Vibrant palettes. ([01b25375](https://github.com/abc873693/ap_common/commit/01b25375c6b2942a65f768a17e60975eadc8b6a0))
 - **FEAT**(ui): expose iOSThemeColors as a seed palette on ApTheme. ([2ca8fd18](https://github.com/abc873693/ap_common/commit/2ca8fd18d0fa1ac1e3efe10ece595cb13442ce7c))
 - **FEAT**(ui): auto-sync palette to native widgets from CourseScaffold. ([159bee80](https://github.com/abc873693/ap_common/commit/159bee80d34b70b36249116e730d0df11d5a87e0))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))

#### `ap_common_plugin` - `v1.0.1-dev.12`

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


## 2026-04-11

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.11`](#ap_common---v101-dev11)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.12`](#ap_common_announcement_ui---v101-dev12)
 - [`ap_common_core` - `v1.0.1-dev.9`](#ap_common_core---v101-dev9)
 - [`ap_common_firebase` - `v1.0.1-dev.12`](#ap_common_firebase---v101-dev12)
 - [`ap_common_flutter_core` - `v1.1.0-dev.12`](#ap_common_flutter_core---v110-dev12)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.12`](#ap_common_flutter_platform---v101-dev12)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.12`](#ap_common_flutter_ui---v110-dev12)
 - [`ap_common_plugin` - `v1.0.1-dev.11`](#ap_common_plugin---v101-dev11)

---

#### `ap_common` - `v1.0.1-dev.11`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.12`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.9`

 - **REFACTOR**(core): convert static methods to factory constructors in CustomCourseData. ([9b67706e](https://github.com/abc873693/ap_common/commit/9b67706ef4e562cb765d5e7de7e8d46dbe3da096))
 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.12`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.12`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(i18n): fix imageCompressHint parameter name mismatch in Japanese locale. ([d1c9923a](https://github.com/abc873693/ap_common/commit/d1c9923a224db1cd937e6f6ee9bb8e640544bcde))
 - **FIX**(i18n): correct spelling and grammar errors in English translations. ([37822f90](https://github.com/abc873693/ap_common/commit/37822f90c207d509b48348247ced1a1696649f6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(i18n): add Japanese locale and update contributor list. ([eef32e95](https://github.com/abc873693/ap_common/commit/eef32e95ba225e99e84caa88ab1894de9e284778))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.12`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.12`

 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**(flutter_ui): improve login page UX with inline loading, password toggle and logo subtitle ([#177](https://github.com/abc873693/ap_common/issues/177)). ([1f1260f9](https://github.com/abc873693/ap_common/commit/1f1260f99475e1dcba9a9a9f05692f03747cc650))
 - **REFACTOR**(ui): remove duplicate SemesterPickerBottomSheet widget. ([26ad6570](https://github.com/abc873693/ap_common/commit/26ad6570355f5c84c70b41c79b4061fb36eba7eb))
 - **REFACTOR**(flutter_ui): extract grouped picker into OptionPickerBottomSheet. ([82e3c11d](https://github.com/abc873693/ap_common/commit/82e3c11d734185ce693be033230a61cf0e1ac4f8))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(home): reorder dashboard widgets and simplify layout. ([85c04068](https://github.com/abc873693/ap_common/commit/85c04068275c9ae91a52ec7d86ecb06b92f8dd10))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**(home): responsive carousel height for small screens (iPhone SE). ([55527ab6](https://github.com/abc873693/ap_common/commit/55527ab6ff970e4f345bbbf17276845f6898b4d7))
 - **FIX**(ui): remove listener leak in SemesterPicker BottomSheet. ([3028d348](https://github.com/abc873693/ap_common/commit/3028d3489b56b01f3533c1c126b6d756af9a81ac))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(about): apply theme-aware color to contact us icons. ([e729365d](https://github.com/abc873693/ap_common/commit/e729365d4972fd54abf5f26a3b276bea187a2221))
 - **FIX**(ui): add featureTag analytics and selectedLabel fallback in OptionPickerBottomSheet. ([2d6b26aa](https://github.com/abc873693/ap_common/commit/2d6b26aa108aa8cb0860acbb1e1892defb56aea6))
 - **FIX**(course): remove add icon from empty cells in course table. ([0e5906d7](https://github.com/abc873693/ap_common/commit/0e5906d78b786fdf4319174b276d6f3c42090e2f))
 - **FIX**(course): use last consecutive slot end time and sync color across views. ([f26c3744](https://github.com/abc873693/ap_common/commit/f26c37442a13f220652bc0e550eaeec331effd6d))
 - **FIX**(ui): use local notify data for course BottomSheet state. ([5fa51d8c](https://github.com/abc873693/ap_common/commit/5fa51d8caedb3c2294e571f0f55154493ff945ea))
 - **FIX**(ui): support array format in changelog version dialog. ([9dd9631f](https://github.com/abc873693/ap_common/commit/9dd9631f7394587107618201a06cad6798c0f4af))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(home): add EmptyScheduleCard widget and improve dashboard login state. ([56d34635](https://github.com/abc873693/ap_common/commit/56d34635f64aa85d8c60125429975f619ac66365))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(score): auto-detect letter grades and display corresponding UI. ([6d26b72b](https://github.com/abc873693/ap_common/commit/6d26b72b7a7bddc07244025a2c30c8ebaf562530))
 - **FEAT**(ui): add optional appBarTitle to LoginScaffold. ([a3849be9](https://github.com/abc873693/ap_common/commit/a3849be9a63a990b78c308bb9ada19d4a9e80ad8))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(flutter_ui): add SemesterPickerBottomSheet pure picker widget. ([9b1dd1d9](https://github.com/abc873693/ap_common/commit/9b1dd1d9e98bd99021383f2a06ef814a1fc5dfed))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**(ui): add onCourseLoaded callback to ApCoursePage. ([924577d5](https://github.com/abc873693/ap_common/commit/924577d5defee153b9e593c034ff0517550561bc))
 - **FEAT**(flutter_ui): add generic OptionPickerBottomSheet widget. ([ee0e7649](https://github.com/abc873693/ap_common/commit/ee0e7649647cd094b21e3817b99f113864e0da33))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**(home): add onTap to QuickInfoItem and adjust dashboard 1:1 layout. ([b2150ebd](https://github.com/abc873693/ap_common/commit/b2150ebd1205bc1e6dda5e65185faf4fdab93d13))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(ui): add SemesterPickerController to manage loading state across picker paths. ([712781b6](https://github.com/abc873693/ap_common/commit/712781b615916b56fc41e42f20563399ad3f65d1))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))

#### `ap_common_plugin` - `v1.0.1-dev.11`

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


## 2026-04-11

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.10`](#ap_common---v101-dev10)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.11`](#ap_common_announcement_ui---v101-dev11)
 - [`ap_common_core` - `v1.0.1-dev.8`](#ap_common_core---v101-dev8)
 - [`ap_common_firebase` - `v1.0.1-dev.11`](#ap_common_firebase---v101-dev11)
 - [`ap_common_flutter_core` - `v1.1.0-dev.11`](#ap_common_flutter_core---v110-dev11)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.11`](#ap_common_flutter_platform---v101-dev11)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.11`](#ap_common_flutter_ui---v110-dev11)
 - [`ap_common_plugin` - `v1.0.1-dev.10`](#ap_common_plugin---v101-dev10)

---

#### `ap_common` - `v1.0.1-dev.10`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.11`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.8`

 - **REFACTOR**(core): convert static methods to factory constructors in CustomCourseData. ([9b67706e](https://github.com/abc873693/ap_common/commit/9b67706ef4e562cb765d5e7de7e8d46dbe3da096))
 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.11`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.11`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(i18n): fix imageCompressHint parameter name mismatch in Japanese locale. ([d1c9923a](https://github.com/abc873693/ap_common/commit/d1c9923a224db1cd937e6f6ee9bb8e640544bcde))
 - **FIX**(i18n): correct spelling and grammar errors in English translations. ([37822f90](https://github.com/abc873693/ap_common/commit/37822f90c207d509b48348247ced1a1696649f6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(i18n): add Japanese locale and update contributor list. ([eef32e95](https://github.com/abc873693/ap_common/commit/eef32e95ba225e99e84caa88ab1894de9e284778))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.11`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.11`

 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(ui): remove duplicate SemesterPickerBottomSheet widget. ([26ad6570](https://github.com/abc873693/ap_common/commit/26ad6570355f5c84c70b41c79b4061fb36eba7eb))
 - **REFACTOR**(flutter_ui): extract grouped picker into OptionPickerBottomSheet. ([82e3c11d](https://github.com/abc873693/ap_common/commit/82e3c11d734185ce693be033230a61cf0e1ac4f8))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(flutter_ui): improve login page UX with inline loading, password toggle and logo subtitle ([#177](https://github.com/abc873693/ap_common/issues/177)). ([1f1260f9](https://github.com/abc873693/ap_common/commit/1f1260f99475e1dcba9a9a9f05692f03747cc650))
 - **REFACTOR**(home): reorder dashboard widgets and simplify layout. ([85c04068](https://github.com/abc873693/ap_common/commit/85c04068275c9ae91a52ec7d86ecb06b92f8dd10))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(course): use last consecutive slot end time and sync color across views. ([f26c3744](https://github.com/abc873693/ap_common/commit/f26c37442a13f220652bc0e550eaeec331effd6d))
 - **FIX**(ui): use local notify data for course BottomSheet state. ([5fa51d8c](https://github.com/abc873693/ap_common/commit/5fa51d8caedb3c2294e571f0f55154493ff945ea))
 - **FIX**(ui): support array format in changelog version dialog. ([9dd9631f](https://github.com/abc873693/ap_common/commit/9dd9631f7394587107618201a06cad6798c0f4af))
 - **FIX**(ui): remove listener leak in SemesterPicker BottomSheet. ([3028d348](https://github.com/abc873693/ap_common/commit/3028d3489b56b01f3533c1c126b6d756af9a81ac))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**(home): responsive carousel height for small screens (iPhone SE). ([55527ab6](https://github.com/abc873693/ap_common/commit/55527ab6ff970e4f345bbbf17276845f6898b4d7))
 - **FIX**(ui): add featureTag analytics and selectedLabel fallback in OptionPickerBottomSheet. ([2d6b26aa](https://github.com/abc873693/ap_common/commit/2d6b26aa108aa8cb0860acbb1e1892defb56aea6))
 - **FIX**(about): apply theme-aware color to contact us icons. ([e729365d](https://github.com/abc873693/ap_common/commit/e729365d4972fd54abf5f26a3b276bea187a2221))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**(course): remove add icon from empty cells in course table. ([0e5906d7](https://github.com/abc873693/ap_common/commit/0e5906d78b786fdf4319174b276d6f3c42090e2f))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): add onCourseLoaded callback to ApCoursePage. ([924577d5](https://github.com/abc873693/ap_common/commit/924577d5defee153b9e593c034ff0517550561bc))
 - **FEAT**(score): auto-detect letter grades and display corresponding UI. ([6d26b72b](https://github.com/abc873693/ap_common/commit/6d26b72b7a7bddc07244025a2c30c8ebaf562530))
 - **FEAT**(ui): add SemesterPickerController to manage loading state across picker paths. ([712781b6](https://github.com/abc873693/ap_common/commit/712781b615916b56fc41e42f20563399ad3f65d1))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): add onTap to QuickInfoItem and adjust dashboard 1:1 layout. ([b2150ebd](https://github.com/abc873693/ap_common/commit/b2150ebd1205bc1e6dda5e65185faf4fdab93d13))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(home): add EmptyScheduleCard widget and improve dashboard login state. ([56d34635](https://github.com/abc873693/ap_common/commit/56d34635f64aa85d8c60125429975f619ac66365))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**(i18n): add Japanese to language selector and example app. ([164ccfc4](https://github.com/abc873693/ap_common/commit/164ccfc40effb7f5ed217f72579f16b914206369))
 - **FEAT**(flutter_ui): add SemesterPickerBottomSheet pure picker widget. ([9b1dd1d9](https://github.com/abc873693/ap_common/commit/9b1dd1d9e98bd99021383f2a06ef814a1fc5dfed))
 - **FEAT**(flutter_ui): add generic OptionPickerBottomSheet widget. ([ee0e7649](https://github.com/abc873693/ap_common/commit/ee0e7649647cd094b21e3817b99f113864e0da33))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))

#### `ap_common_plugin` - `v1.0.1-dev.10`

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


## 2026-04-08

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.9`](#ap_common---v101-dev9)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.10`](#ap_common_announcement_ui---v101-dev10)
 - [`ap_common_core` - `v1.0.1-dev.7`](#ap_common_core---v101-dev7)
 - [`ap_common_firebase` - `v1.0.1-dev.10`](#ap_common_firebase---v101-dev10)
 - [`ap_common_flutter_core` - `v1.1.0-dev.10`](#ap_common_flutter_core---v110-dev10)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.10`](#ap_common_flutter_platform---v101-dev10)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.10`](#ap_common_flutter_ui---v110-dev10)
 - [`ap_common_plugin` - `v1.0.1-dev.9`](#ap_common_plugin---v101-dev9)

---

#### `ap_common` - `v1.0.1-dev.9`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.10`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.7`

 - **REFACTOR**(core): convert static methods to factory constructors in CustomCourseData. ([9b67706e](https://github.com/abc873693/ap_common/commit/9b67706ef4e562cb765d5e7de7e8d46dbe3da096))
 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.10`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.10`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(i18n): correct spelling and grammar errors in English translations. ([37822f90](https://github.com/abc873693/ap_common/commit/37822f90c207d509b48348247ced1a1696649f6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.10`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.10`

 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(home): reorder dashboard widgets and simplify layout. ([85c04068](https://github.com/abc873693/ap_common/commit/85c04068275c9ae91a52ec7d86ecb06b92f8dd10))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **FIX**(ui): use local notify data for course BottomSheet state. ([5fa51d8c](https://github.com/abc873693/ap_common/commit/5fa51d8caedb3c2294e571f0f55154493ff945ea))
 - **FIX**(ui): support array format in changelog version dialog. ([9dd9631f](https://github.com/abc873693/ap_common/commit/9dd9631f7394587107618201a06cad6798c0f4af))
 - **FIX**(ui): remove listener leak in SemesterPicker BottomSheet. ([3028d348](https://github.com/abc873693/ap_common/commit/3028d3489b56b01f3533c1c126b6d756af9a81ac))
 - **FIX**(about): apply theme-aware color to contact us icons. ([e729365d](https://github.com/abc873693/ap_common/commit/e729365d4972fd54abf5f26a3b276bea187a2221))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(course): remove add icon from empty cells in course table. ([0e5906d7](https://github.com/abc873693/ap_common/commit/0e5906d78b786fdf4319174b276d6f3c42090e2f))
 - **FIX**(home): responsive carousel height for small screens (iPhone SE). ([55527ab6](https://github.com/abc873693/ap_common/commit/55527ab6ff970e4f345bbbf17276845f6898b4d7))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**(course): use last consecutive slot end time and sync color across views. ([f26c3744](https://github.com/abc873693/ap_common/commit/f26c37442a13f220652bc0e550eaeec331effd6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(home): add EmptyScheduleCard widget and improve dashboard login state. ([56d34635](https://github.com/abc873693/ap_common/commit/56d34635f64aa85d8c60125429975f619ac66365))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**(ui): add onCourseLoaded callback to ApCoursePage. ([924577d5](https://github.com/abc873693/ap_common/commit/924577d5defee153b9e593c034ff0517550561bc))
 - **FEAT**(score): auto-detect letter grades and display corresponding UI. ([6d26b72b](https://github.com/abc873693/ap_common/commit/6d26b72b7a7bddc07244025a2c30c8ebaf562530))
 - **FEAT**(ui): add SemesterPickerController to manage loading state across picker paths. ([712781b6](https://github.com/abc873693/ap_common/commit/712781b615916b56fc41e42f20563399ad3f65d1))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): add onTap to QuickInfoItem and adjust dashboard 1:1 layout. ([b2150ebd](https://github.com/abc873693/ap_common/commit/b2150ebd1205bc1e6dda5e65185faf4fdab93d13))
 - **FEAT**(score): add ScoreType enum and grade point scoring support. ([8ff6efda](https://github.com/abc873693/ap_common/commit/8ff6efda61ccbe5c9b6a260d4fd35e3f82168140))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))

#### `ap_common_plugin` - `v1.0.1-dev.9`

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


## 2026-04-06

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.8`](#ap_common---v101-dev8)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.9`](#ap_common_announcement_ui---v101-dev9)
 - [`ap_common_core` - `v1.0.1-dev.6`](#ap_common_core---v101-dev6)
 - [`ap_common_firebase` - `v1.0.1-dev.9`](#ap_common_firebase---v101-dev9)
 - [`ap_common_flutter_core` - `v1.1.0-dev.9`](#ap_common_flutter_core---v110-dev9)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.9`](#ap_common_flutter_platform---v101-dev9)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.9`](#ap_common_flutter_ui---v110-dev9)
 - [`ap_common_plugin` - `v1.0.1-dev.8`](#ap_common_plugin---v101-dev8)

---

#### `ap_common` - `v1.0.1-dev.8`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.9`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.6`

 - **REFACTOR**(core): convert static methods to factory constructors in CustomCourseData. ([9b67706e](https://github.com/abc873693/ap_common/commit/9b67706ef4e562cb765d5e7de7e8d46dbe3da096))
 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.9`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.9`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(i18n): correct spelling and grammar errors in English translations. ([37822f90](https://github.com/abc873693/ap_common/commit/37822f90c207d509b48348247ced1a1696649f6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.9`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.9`

 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(home): reorder dashboard widgets and simplify layout. ([85c04068](https://github.com/abc873693/ap_common/commit/85c04068275c9ae91a52ec7d86ecb06b92f8dd10))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**(ui): support array format in changelog version dialog. ([9dd9631f](https://github.com/abc873693/ap_common/commit/9dd9631f7394587107618201a06cad6798c0f4af))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(ui): remove listener leak in SemesterPicker BottomSheet. ([3028d348](https://github.com/abc873693/ap_common/commit/3028d3489b56b01f3533c1c126b6d756af9a81ac))
 - **FIX**(home): responsive carousel height for small screens (iPhone SE). ([55527ab6](https://github.com/abc873693/ap_common/commit/55527ab6ff970e4f345bbbf17276845f6898b4d7))
 - **FIX**(course): use last consecutive slot end time and sync color across views. ([f26c3744](https://github.com/abc873693/ap_common/commit/f26c37442a13f220652bc0e550eaeec331effd6d))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**(ui): use local notify data for course BottomSheet state. ([5fa51d8c](https://github.com/abc873693/ap_common/commit/5fa51d8caedb3c2294e571f0f55154493ff945ea))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(ui): add onCourseLoaded callback to ApCoursePage. ([924577d5](https://github.com/abc873693/ap_common/commit/924577d5defee153b9e593c034ff0517550561bc))
 - **FEAT**(score): auto-detect letter grades and display corresponding UI. ([6d26b72b](https://github.com/abc873693/ap_common/commit/6d26b72b7a7bddc07244025a2c30c8ebaf562530))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): add onTap to QuickInfoItem and adjust dashboard 1:1 layout. ([b2150ebd](https://github.com/abc873693/ap_common/commit/b2150ebd1205bc1e6dda5e65185faf4fdab93d13))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(ui): add SemesterPickerController to manage loading state across picker paths. ([712781b6](https://github.com/abc873693/ap_common/commit/712781b615916b56fc41e42f20563399ad3f65d1))

#### `ap_common_plugin` - `v1.0.1-dev.8`

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


## 2026-04-06

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.7`](#ap_common---v101-dev7)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.8`](#ap_common_announcement_ui---v101-dev8)
 - [`ap_common_core` - `v1.0.1-dev.5`](#ap_common_core---v101-dev5)
 - [`ap_common_firebase` - `v1.0.1-dev.8`](#ap_common_firebase---v101-dev8)
 - [`ap_common_flutter_core` - `v1.1.0-dev.8`](#ap_common_flutter_core---v110-dev8)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.8`](#ap_common_flutter_platform---v101-dev8)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.8`](#ap_common_flutter_ui---v110-dev8)
 - [`ap_common_plugin` - `v1.0.1-dev.7`](#ap_common_plugin---v101-dev7)

---

#### `ap_common` - `v1.0.1-dev.7`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.8`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.5`

 - **REFACTOR**(core): convert static methods to factory constructors in CustomCourseData. ([9b67706e](https://github.com/abc873693/ap_common/commit/9b67706ef4e562cb765d5e7de7e8d46dbe3da096))
 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.8`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.8`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(i18n): correct spelling and grammar errors in English translations. ([37822f90](https://github.com/abc873693/ap_common/commit/37822f90c207d509b48348247ced1a1696649f6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.8`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.8`

 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(home): reorder dashboard widgets and simplify layout. ([85c04068](https://github.com/abc873693/ap_common/commit/85c04068275c9ae91a52ec7d86ecb06b92f8dd10))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**(ui): support array format in changelog version dialog. ([9dd9631f](https://github.com/abc873693/ap_common/commit/9dd9631f7394587107618201a06cad6798c0f4af))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**(ui): remove listener leak in SemesterPicker BottomSheet. ([3028d348](https://github.com/abc873693/ap_common/commit/3028d3489b56b01f3533c1c126b6d756af9a81ac))
 - **FIX**(home): responsive carousel height for small screens (iPhone SE). ([55527ab6](https://github.com/abc873693/ap_common/commit/55527ab6ff970e4f345bbbf17276845f6898b4d7))
 - **FIX**(course): use last consecutive slot end time and sync color across views. ([f26c3744](https://github.com/abc873693/ap_common/commit/f26c37442a13f220652bc0e550eaeec331effd6d))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**(ui): use local notify data for course BottomSheet state. ([5fa51d8c](https://github.com/abc873693/ap_common/commit/5fa51d8caedb3c2294e571f0f55154493ff945ea))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(ui): add onCourseLoaded callback to ApCoursePage. ([924577d5](https://github.com/abc873693/ap_common/commit/924577d5defee153b9e593c034ff0517550561bc))
 - **FEAT**(score): auto-detect letter grades and display corresponding UI. ([6d26b72b](https://github.com/abc873693/ap_common/commit/6d26b72b7a7bddc07244025a2c30c8ebaf562530))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): add onTap to QuickInfoItem and adjust dashboard 1:1 layout. ([b2150ebd](https://github.com/abc873693/ap_common/commit/b2150ebd1205bc1e6dda5e65185faf4fdab93d13))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(ui): add SemesterPickerController to manage loading state across picker paths. ([712781b6](https://github.com/abc873693/ap_common/commit/712781b615916b56fc41e42f20563399ad3f65d1))

#### `ap_common_plugin` - `v1.0.1-dev.7`

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


## 2026-04-06

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.6`](#ap_common---v101-dev6)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.7`](#ap_common_announcement_ui---v101-dev7)
 - [`ap_common_core` - `v1.0.1-dev.4`](#ap_common_core---v101-dev4)
 - [`ap_common_firebase` - `v1.0.1-dev.7`](#ap_common_firebase---v101-dev7)
 - [`ap_common_flutter_core` - `v1.1.0-dev.7`](#ap_common_flutter_core---v110-dev7)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.7`](#ap_common_flutter_platform---v101-dev7)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.7`](#ap_common_flutter_ui---v110-dev7)
 - [`ap_common_plugin` - `v1.0.1-dev.6`](#ap_common_plugin---v101-dev6)

---

#### `ap_common` - `v1.0.1-dev.6`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.7`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.4`

 - **REFACTOR**(core): convert static methods to factory constructors in CustomCourseData. ([9b67706e](https://github.com/abc873693/ap_common/commit/9b67706ef4e562cb765d5e7de7e8d46dbe3da096))
 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.7`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.7`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(i18n): correct spelling and grammar errors in English translations. ([37822f90](https://github.com/abc873693/ap_common/commit/37822f90c207d509b48348247ced1a1696649f6d))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.7`

 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.7`

 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(home): reorder dashboard widgets and simplify layout. ([85c04068](https://github.com/abc873693/ap_common/commit/85c04068275c9ae91a52ec7d86ecb06b92f8dd10))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**: fix lint warnings and replace debugPrint with log. ([67cec8cc](https://github.com/abc873693/ap_common/commit/67cec8cc05e0f5623ef510621787b077f1bf6b3e))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**(home): responsive carousel height for small screens (iPhone SE). ([55527ab6](https://github.com/abc873693/ap_common/commit/55527ab6ff970e4f345bbbf17276845f6898b4d7))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(schedule): merge consecutive course slots by timeIndex instead of time string. ([b85175c5](https://github.com/abc873693/ap_common/commit/b85175c5d605ff31e6614797f2c4457720320b89))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): comprehensive UX improvements across the project. ([afaddaea](https://github.com/abc873693/ap_common/commit/afaddaea17f033d7a72016e03276579b424f4aec))
 - **FEAT**(score): add GPA calculation based on NSYSU 4.3 grade point scale. ([4af3957f](https://github.com/abc873693/ap_common/commit/4af3957fa4c52fe31d019b6243b7ea8aa70b800a))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**(course): add custom course support for user-created schedule entries. ([6e89924c](https://github.com/abc873693/ap_common/commit/6e89924c8296e545643d201fde8ef5c2db76d466))
 - **FEAT**(home): add dashboard layout with carousel + scrollable widgets. ([b2664d31](https://github.com/abc873693/ap_common/commit/b2664d31394bc90ee7e293c0bfe96071c21cac82))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**(home): show tomorrow's schedule when today has no courses. ([d15f9e9d](https://github.com/abc873693/ap_common/commit/d15f9e9d367700e2497adab0d95592b12062af1d))
 - **FEAT**(score): auto-detect letter grades and display corresponding UI. ([6d26b72b](https://github.com/abc873693/ap_common/commit/6d26b72b7a7bddc07244025a2c30c8ebaf562530))
 - **FEAT**(ui): add SemesterPickerController to manage loading state across picker paths. ([712781b6](https://github.com/abc873693/ap_common/commit/712781b615916b56fc41e42f20563399ad3f65d1))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**(i18n): localize hardcoded strings in Flutter and iOS widgets. ([2272ebd5](https://github.com/abc873693/ap_common/commit/2272ebd5cc0918f86f7787cd1ef54c096c57b12a))
 - **FEAT**(home): add onTap to QuickInfoItem and adjust dashboard 1:1 layout. ([b2150ebd](https://github.com/abc873693/ap_common/commit/b2150ebd1205bc1e6dda5e65185faf4fdab93d13))
 - **FEAT**(course): persist custom course color and integrate in example. ([0e4395e0](https://github.com/abc873693/ap_common/commit/0e4395e08eeb08f4b62cc72f94abb9e14029d466))
 - **FEAT**(ui): add onCourseLoaded callback to ApCoursePage. ([924577d5](https://github.com/abc873693/ap_common/commit/924577d5defee153b9e593c034ff0517550561bc))

#### `ap_common_plugin` - `v1.0.1-dev.6`

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


## 2026-04-04

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.5`](#ap_common---v101-dev5)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.6`](#ap_common_announcement_ui---v101-dev6)
 - [`ap_common_core` - `v1.0.1-dev.3`](#ap_common_core---v101-dev3)
 - [`ap_common_firebase` - `v1.0.1-dev.6`](#ap_common_firebase---v101-dev6)
 - [`ap_common_flutter_core` - `v1.1.0-dev.6`](#ap_common_flutter_core---v110-dev6)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.6`](#ap_common_flutter_platform---v101-dev6)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.6`](#ap_common_flutter_ui---v110-dev6)
 - [`ap_common_plugin` - `v1.0.1-dev.5`](#ap_common_plugin---v101-dev5)

---

#### `ap_common` - `v1.0.1-dev.5`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(announcement): fix Swagger spec for ban API. ([5a7efe3c](https://github.com/abc873693/ap_common/commit/5a7efe3ca6d3181024b69286451c3b5d3ebfa137))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.6`

 - **REFACTOR**(announcement): extract AnnouncementEditForm and add widget tests. ([f8907ad0](https://github.com/abc873693/ap_common/commit/f8907ad0a43968b88f8d1eb0aa4366e7d68c2736))
 - **REFACTOR**(announcement): move thumbnail to right side of card. ([e51e4f3a](https://github.com/abc873693/ap_common/commit/e51e4f3ae7cd88b5d3f48cd8220289e5959d95d9))
 - **REFACTOR**(announcement): improve home page UX with card preview and tab navigation. ([ed4f8387](https://github.com/abc873693/ap_common/commit/ed4f8387216a3e2bc2ffb74854e04fac918e09ae))
 - **REFACTOR**(announcement): redesign UI with DataState and Material Design 3. ([4a6689d5](https://github.com/abc873693/ap_common/commit/4a6689d57265a4e4437a4da01642e3f275822b51))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**(announcement): add final to local variable. ([4eb1de84](https://github.com/abc873693/ap_common/commit/4eb1de84de740cef9d87297a4ee725557132fc1c))
 - **FIX**(announcement): correct HTTP method and path for ban API. ([f3073b1a](https://github.com/abc873693/ap_common/commit/f3073b1ac8746c0d7498845a862a74df6d416a10))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))
 - **FEAT**(announcement): add review status filter chips for applications. ([9129d115](https://github.com/abc873693/ap_common/commit/9129d115821d8b350f8cd3637b925736da201021))
 - **FEAT**(announcement): show application rules on edit page. ([2cd76010](https://github.com/abc873693/ap_common/commit/2cd7601042d16996ee16c99c754e7b2e4e630570))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(announcement): add auto re-login on 401 for all login types. ([b9aa2dea](https://github.com/abc873693/ap_common/commit/b9aa2deaf8e9b2e9666010fce43bc6d9856d7d66))
 - **FEAT**(announcement): add applicant copy and blacklist indicator. ([6cedddaf](https://github.com/abc873693/ap_common/commit/6cedddaf1a45fe684e66fc8f2cc63cdfbe7929a0))
 - **FEAT**(announcement): add full CRUD and M3 UI for black list page. ([a68d5224](https://github.com/abc873693/ap_common/commit/a68d5224d0518e7383a28813e2667d05584ea483))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.3`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**(core,announcement): address PR review comments. ([858e4a5d](https://github.com/abc873693/ap_common/commit/858e4a5dcedf35e900562aae7f2c050a5150f718))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(core): add ApiResult.toDataState() extension. ([b0c25bf2](https://github.com/abc873693/ap_common/commit/b0c25bf22c83f48c6c17ed0fbb8e3244397e129b))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.6`

 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FEAT**(firebase,announcement): wire FCM token for review push notifications. ([f3569aa7](https://github.com/abc873693/ap_common/commit/f3569aa73fa3dbfeb9a32b58906558c603a5aa79))

#### `ap_common_flutter_core` - `v1.1.0-dev.6`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(announcement): add editor management page and tag filter. ([6ebe38e8](https://github.com/abc873693/ap_common/commit/6ebe38e8ac43b6ca8d16e3e3880fbd89bae3919c))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.6`

 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.6`

 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))

#### `ap_common_plugin` - `v1.0.1-dev.5`

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


## 2026-04-04

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.4`](#ap_common---v101-dev4)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.5`](#ap_common_announcement_ui---v101-dev5)
 - [`ap_common_core` - `v1.0.1-dev.2`](#ap_common_core---v101-dev2)
 - [`ap_common_firebase` - `v1.0.1-dev.5`](#ap_common_firebase---v101-dev5)
 - [`ap_common_flutter_core` - `v1.1.0-dev.5`](#ap_common_flutter_core---v110-dev5)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.5`](#ap_common_flutter_platform---v101-dev5)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.5`](#ap_common_flutter_ui---v110-dev5)
 - [`ap_common_plugin` - `v1.0.1-dev.4`](#ap_common_plugin---v101-dev4)

---

#### `ap_common` - `v1.0.1-dev.4`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.5`

 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.2`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.5`

 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))

#### `ap_common_flutter_core` - `v1.1.0-dev.5`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.5`

 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.5`

 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))

#### `ap_common_plugin` - `v1.0.1-dev.4`

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


## 2026-04-03

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.3`](#ap_common---v101-dev3)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.4`](#ap_common_announcement_ui---v101-dev4)
 - [`ap_common_core` - `v1.0.1-dev.1`](#ap_common_core---v101-dev1)
 - [`ap_common_firebase` - `v1.0.1-dev.4`](#ap_common_firebase---v101-dev4)
 - [`ap_common_flutter_core` - `v1.1.0-dev.4`](#ap_common_flutter_core---v110-dev4)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.4`](#ap_common_flutter_platform---v101-dev4)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.4`](#ap_common_flutter_ui---v110-dev4)
 - [`ap_common_plugin` - `v1.0.1-dev.3`](#ap_common_plugin---v101-dev3)

---

#### `ap_common` - `v1.0.1-dev.3`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(deps): downgrade ap_common version and fix flutter_ui constraint. ([c3167a59](https://github.com/abc873693/ap_common/commit/c3167a590546fcac8cc858dd4c97ac5b87d4be51))
 - **DOCS**(swagger): sync announcement_api.json with current implementation. ([ce398d86](https://github.com/abc873693/ap_common/commit/ce398d865056f734652cf80454add2a2030aa101))

#### `ap_common_announcement_ui` - `v1.0.1-dev.4`

 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(announcement): migrate UI pages to async/await with ApiResult. ([31902f52](https://github.com/abc873693/ap_common/commit/31902f525e92830fd6c88fde3555e4ba58ba6d05))
 - **REFACTOR**(announcement): rewrite API helpers with ApiResult, remove GeneralCallback. ([715803a4](https://github.com/abc873693/ap_common/commit/715803a4fd1c45cda7b66c0857150cdfb79062f4))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**: reject and add to ban error. ([80734bed](https://github.com/abc873693/ap_common/commit/80734bed83acf7e9a7b334c0a5754269cd8030e5))
 - **FIX**(announcement): handle nested API errors in _announcementSubmit. ([819636e4](https://github.com/abc873693/ap_common/commit/819636e4f5aeddc2ea427bb91ebdc1d6aac0ca5e))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(announcement): display applicant email on edit application page. ([f898b3e7](https://github.com/abc873693/ap_common/commit/f898b3e7544a72bcb250fbb3e09ead662482fbf0))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.1`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(core): introduce ApiResult sealed class for typed API responses. ([8538398e](https://github.com/abc873693/ap_common/commit/8538398e9514ea653847833b5ce571ef44b89c2f))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: resolve all pre-existing lint issues across packages. ([13d260b3](https://github.com/abc873693/ap_common/commit/13d260b36a8fc21b79cd1ab94d855d0138e5d9b3))
 - **FIX**: resolve analyze-ci lint issues in changed files. ([ea86b935](https://github.com/abc873693/ap_common/commit/ea86b9350c97dac8e51fad98273c4d9f2925e3b7))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))
 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))

#### `ap_common_firebase` - `v1.0.1-dev.4`

 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))

#### `ap_common_flutter_core` - `v1.1.0-dev.4`

 - **REFACTOR**(l10n): address code review feedback. ([7c7b84e0](https://github.com/abc873693/ap_common/commit/7c7b84e08be6352a3e50d427ce792834c0435a2c))
 - **REFACTOR**(l10n): clean up intl remnants after slang migration. ([ea893e6d](https://github.com/abc873693/ap_common/commit/ea893e6d5b0e0587231cab2741e309da909d5a7b))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(flutter_core): remove GeneralCallback pattern completely. ([e463cf75](https://github.com/abc873693/ap_common/commit/e463cf75723acb18d44e974f1ff9b3e00cccc3d6))
 - **REFACTOR**(announcement): add showErrorToast extension and simplify UI error handling. ([dc46221d](https://github.com/abc873693/ap_common/commit/dc46221d222f1a68a458d6a226d82ccf7bf7049a))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.4`

 - **REFACTOR**(platform): use clock package for testable time in notification utils. ([544327a8](https://github.com/abc873693/ap_common/commit/544327a89c570f97f6d28cf234f7b99cb0c944ca))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**(test): suppress depend_on_referenced_packages for intl in notification test. ([28678c77](https://github.com/abc873693/ap_common/commit/28678c77751fdda5003ea158827b98b7f692c41e))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.4`

 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**: migrate to slang i18n and new ApTheme API after rebase on develop. ([80307353](https://github.com/abc873693/ap_common/commit/80307353da283af46cd9e61a578cfbb795b6cdb8))
 - **REFACTOR**(media): replace GeneralResponseCallback with SaveImageResult sealed class. ([2cfc5176](https://github.com/abc873693/ap_common/commit/2cfc51762e25bc361c1420e405a7c444224477e5))
 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **FIX**: resolve all pre-existing lint issues across packages. ([84db9998](https://github.com/abc873693/ap_common/commit/84db99986ccfac62b720cbf69f03bc021c154bc5))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: resolve analyze errors and lint issues in simplified UI integration. ([d0f2e45e](https://github.com/abc873693/ap_common/commit/d0f2e45eef25441b5786f3e65f4190b4e798b342))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**(test): resolve widget test failures in simplified UI pages. ([12094e48](https://github.com/abc873693/ap_common/commit/12094e48e37baf42f6168c651796a6c253d86639))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**(ui): add simplified UI integration API with DataState sealed class. ([54f566bd](https://github.com/abc873693/ap_common/commit/54f566bd0dc3fe857ef623d5ac8c24e23547f096))
 - **FEAT**(ui): add HomePageScaffold.fromDataState() and test suite. ([307a296b](https://github.com/abc873693/ap_common/commit/307a296b6fc6268e4a147faa1093d7e9e0a58221))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))

#### `ap_common_plugin` - `v1.0.1-dev.3`

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))


## 2026-03-29

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.3`](#ap_common---v101-dev3)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.3`](#ap_common_announcement_ui---v101-dev3)
 - [`ap_common_core` - `v1.0.1-dev.0`](#ap_common_core---v101-dev0)
 - [`ap_common_firebase` - `v1.0.1-dev.3`](#ap_common_firebase---v101-dev3)
 - [`ap_common_flutter_core` - `v1.1.0-dev.3`](#ap_common_flutter_core---v110-dev3)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.3`](#ap_common_flutter_platform---v101-dev3)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.3`](#ap_common_flutter_ui---v110-dev3)
 - [`ap_common_plugin` - `v1.0.1-dev.2`](#ap_common_plugin---v101-dev2)

---

#### `ap_common` - `v1.0.1-dev.3`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))

#### `ap_common_announcement_ui` - `v1.0.1-dev.3`

 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_core` - `v1.0.1-dev.0`

 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))

#### `ap_common_firebase` - `v1.0.1-dev.3`

 - **FIX**(firebase): upgrade firebase deps and adapt to new API. ([7540d9db](https://github.com/abc873693/ap_common/commit/7540d9db6474bef1e6952a72366686389087f2ad))

#### `ap_common_flutter_core` - `v1.1.0-dev.3`

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.3`

 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.3`

 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_plugin` - `v1.0.1-dev.2`

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))


## 2026-03-29

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.2`](#ap_common---v101-dev2)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.2`](#ap_common_announcement_ui---v101-dev2)
 - [`ap_common_flutter_core` - `v1.1.0-dev.2`](#ap_common_flutter_core---v110-dev2)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.2`](#ap_common_flutter_platform---v101-dev2)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.2`](#ap_common_flutter_ui---v110-dev2)
 - [`ap_common_plugin` - `v1.0.1-dev.1`](#ap_common_plugin---v101-dev1)
 - [`ap_common_firebase` - `v1.0.1-dev.2`](#ap_common_firebase---v101-dev2)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ap_common_firebase` - `v1.0.1-dev.2`

---

#### `ap_common` - `v1.0.1-dev.2`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))

#### `ap_common_announcement_ui` - `v1.0.1-dev.2`

 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_flutter_core` - `v1.1.0-dev.2`

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.2`

 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.2`

 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_plugin` - `v1.0.1-dev.1`

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))


## 2026-03-29

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.1`](#ap_common---v101-dev1)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.1`](#ap_common_announcement_ui---v101-dev1)
 - [`ap_common_flutter_core` - `v1.1.0-dev.1`](#ap_common_flutter_core---v110-dev1)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.1`](#ap_common_flutter_platform---v101-dev1)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.1`](#ap_common_flutter_ui---v110-dev1)
 - [`ap_common_plugin` - `v1.0.1-dev.0`](#ap_common_plugin---v101-dev0)
 - [`ap_common_firebase` - `v1.0.1-dev.1`](#ap_common_firebase---v101-dev1)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ap_common_firebase` - `v1.0.1-dev.1`

---

#### `ap_common` - `v1.0.1-dev.1`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))

#### `ap_common_announcement_ui` - `v1.0.1-dev.1`

 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_flutter_core` - `v1.1.0-dev.1`

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**(l10n): migrate ap_common_flutter_core from intl to slang. ([de440d23](https://github.com/abc873693/ap_common/commit/de440d23f8c8e0276e62e2728a242cb782e05ba7))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))

#### `ap_common_flutter_platform` - `v1.0.1-dev.1`

 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))
 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))

#### `ap_common_flutter_ui` - `v1.1.0-dev.1`

 - **REFACTOR**(l10n): use context-based translation access for reactive locale switching. ([e9429aa1](https://github.com/abc873693/ap_common/commit/e9429aa1bbfc2e97b72e0010d8bebf63777b050d))
 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))
 - **REFACTOR**(l10n): update UI packages to use slang translation API. ([697e1e15](https://github.com/abc873693/ap_common/commit/697e1e15b28ab194f71e322da1acf48d14fb2cd2))
 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))
 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))
 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))

#### `ap_common_plugin` - `v1.0.1-dev.0`

 - **REFACTOR**(l10n): restore original i18n variable naming conventions. ([c21ed521](https://github.com/abc873693/ap_common/commit/c21ed521369b6a3f6030da7ac9a9bae6b97d13dd))


## 2026-03-19

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.1-dev.0`](#ap_common---v101-dev0)
 - [`ap_common_flutter_core` - `v1.1.0-dev.0`](#ap_common_flutter_core---v110-dev0)
 - [`ap_common_flutter_platform` - `v1.0.1-dev.0`](#ap_common_flutter_platform---v101-dev0)
 - [`ap_common_flutter_ui` - `v1.1.0-dev.0`](#ap_common_flutter_ui---v110-dev0)
 - [`ap_common_firebase` - `v1.0.1-dev.0`](#ap_common_firebase---v101-dev0)
 - [`ap_common_announcement_ui` - `v1.0.1-dev.0`](#ap_common_announcement_ui---v101-dev0)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ap_common_firebase` - `v1.0.1-dev.0`
 - `ap_common_announcement_ui` - `v1.0.1-dev.0`

---

#### `ap_common` - `v1.0.1-dev.0`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))

#### `ap_common_flutter_core` - `v1.1.0-dev.0`

 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))

#### `ap_common_flutter_platform` - `v1.0.1-dev.0`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))

#### `ap_common_flutter_ui` - `v1.1.0-dev.0`

 - **REFACTOR**(ui): fix lint errors and improve code quality. ([36a092bd](https://github.com/abc873693/ap_common/commit/36a092bd42002835b5ea2252c15d21f78d39691d))
 - **REFACTOR**(ui): update pages and views with Material 3 components. ([fcb897f0](https://github.com/abc873693/ap_common/commit/fcb897f031ec5fa9d9342477b026aa221900b6da))
 - **REFACTOR**(ui): update scaffolds to use new widgets and Material 3. ([da1b8e0c](https://github.com/abc873693/ap_common/commit/da1b8e0c165ce1d9d9477160a9b15779dddb0855))
 - **REFACTOR**(ui): update utility classes for Material 3 compatibility. ([5fbee088](https://github.com/abc873693/ap_common/commit/5fbee0887fc9e26fdc976b82ddea3bcf5b16e8d8))
 - **REFACTOR**(ui): update scaffolds and views to use Material 3 color schemes. ([7f3e6a1c](https://github.com/abc873693/ap_common/commit/7f3e6a1cb7bbf17b5f9c70274b48577311f9f93d))
 - **REFACTOR**(ui): migrate dialog widgets to Material 3 theme and components. ([34466ce6](https://github.com/abc873693/ap_common/commit/34466ce667cc1c0f098939b9cbd75e18ad530998))
 - **REFACTOR**: optimize layout and barcode display for UserInfo Scaffold. ([933cd633](https://github.com/abc873693/ap_common/commit/933cd633d637293920186f8611784566578cc241))
 - **REFACTOR**: optimize UI design for Course and Score Scaffolds. ([b1c3e915](https://github.com/abc873693/ap_common/commit/b1c3e915206e2cc389304e4e234aeed4f97ab6fd))
 - **REFACTOR**: optimize UI design for Login and HomePage Scaffolds. ([3aa9190c](https://github.com/abc873693/ap_common/commit/3aa9190c4fc96ec1543a3bb769cf69a9e9012757))
 - **FEAT**: update float action button can invisible. ([c30380bc](https://github.com/abc873693/ap_common/commit/c30380bc2254fc1fe1ac31deea4c7c62658ae9c8))
 - **FEAT**: score scaffold responsive. ([426678f5](https://github.com/abc873693/ap_common/commit/426678f5d2559179cce9e9b0c5cfb3216147532b))
 - **FEAT**: update i18n for theme translate. ([2e7e862d](https://github.com/abc873693/ap_common/commit/2e7e862d0f8803d64403c15df67108863a74fb1f))
 - **FEAT**(ui): extract common widgets into separate components. ([fd19e957](https://github.com/abc873693/ap_common/commit/fd19e957372f6266ba8657a2a90800737e760881))
 - **FEAT**: add merged course view and optimize table layout density. ([410808a5](https://github.com/abc873693/ap_common/commit/410808a59c1d5cf68999e2deba86b78b7aaff552))
 - **FEAT**: add SemesterPicker and optimize ApUtils and ApDrawer. ([0ebafe0c](https://github.com/abc873693/ap_common/commit/0ebafe0cbe9fb35d2199f79efa633f7c811c90d0))
 - **FEAT**: implement dynamic theme color switching and color picker in settings. ([2dce7929](https://github.com/abc873693/ap_common/commit/2dce792963a6520e221e83dec2ab9081e50d3b14))


## 2026-03-16

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v1.0.0`](#ap_common---v100)
 - [`ap_common_announcement_ui` - `v1.0.0`](#ap_common_announcement_ui---v100)
 - [`ap_common_core` - `v1.0.0`](#ap_common_core---v100)
 - [`ap_common_firebase` - `v1.0.0`](#ap_common_firebase---v100)
 - [`ap_common_flutter_core` - `v1.0.0`](#ap_common_flutter_core---v100)
 - [`ap_common_flutter_platform` - `v1.0.0`](#ap_common_flutter_platform---v100)
 - [`ap_common_flutter_ui` - `v1.0.0`](#ap_common_flutter_ui---v100)
 - [`ap_common_plugin` - `v1.0.0`](#ap_common_plugin---v100)

---

#### `ap_common` - `v1.0.0`

 - Bump "ap_common" to `1.0.0`.

#### `ap_common_announcement_ui` - `v1.0.0`

 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))

#### `ap_common_core` - `v1.0.0`

 - **FIX**: model test error. ([dfaa2cc8](https://github.com/abc873693/ap_common/commit/dfaa2cc87a5667212617d63fe534334fe51fc06b))
 - **FEAT**: model unit test. ([d3d5de68](https://github.com/abc873693/ap_common/commit/d3d5de688cdba555e2f9ca7e475f031645f578d2))
 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))

#### `ap_common_firebase` - `v1.0.0`

#### `ap_common_flutter_core` - `v1.0.0`

 - Bump "ap_common_flutter_core" to `1.0.0`.

#### `ap_common_flutter_platform` - `v1.0.0`

#### `ap_common_flutter_ui` - `v1.0.0`

 - **FEAT**: improve model generate by `freezed`. ([43bef51c](https://github.com/abc873693/ap_common/commit/43bef51c42f8cf8b984074d42c16c403ee83c02c))

#### `ap_common_plugin` - `v1.0.0`


## 2025-09-30

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_announcement_ui` - `v0.0.4`](#ap_common_announcement_ui---v004)
 - [`ap_common_flutter_ui` - `v0.0.6`](#ap_common_flutter_ui---v006)
 - [`ap_common` - `v0.26.0+3`](#ap_common---v02603)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ap_common` - `v0.26.0+3`

---

#### `ap_common_announcement_ui` - `v0.0.4`

 - **FEAT**: align image upload naming. ([ab2f2492](https://github.com/abc873693/ap_common/commit/ab2f2492f05117a2474357cbd7373498b40df878))
 - **FEAT**: revert imgur implement. ([30bbf5ea](https://github.com/abc873693/ap_common/commit/30bbf5eadc1b05d08f5c269169e9bfe715c5bbb0))

#### `ap_common_flutter_ui` - `v0.0.6`

 - **FEAT**: change to material design 3. ([04a13b5d](https://github.com/abc873693/ap_common/commit/04a13b5da516b9cbbc3a56eb29ab670c34653e55))


## 2025-09-21

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_flutter_ui` - `v0.0.5`](#ap_common_flutter_ui---v005)
 - [`ap_common` - `v0.26.0+2`](#ap_common---v02602)
 - [`ap_common_announcement_ui` - `v0.0.3+2`](#ap_common_announcement_ui---v0032)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ap_common` - `v0.26.0+2`
 - `ap_common_announcement_ui` - `v0.0.3+2`

---

#### `ap_common_flutter_ui` - `v0.0.5`

 - **FEAT**(flutter_ui): `PdfView` custom error messageOB. ([0426059d](https://github.com/abc873693/ap_common/commit/0426059d16d364bd6ebf02398ffea13628119c6f))


## 2025-09-21

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_flutter_core` - `v0.0.4`](#ap_common_flutter_core---v004)
 - [`ap_common_flutter_platform` - `v0.0.5`](#ap_common_flutter_platform---v005)
 - [`ap_common_flutter_ui` - `v0.0.4`](#ap_common_flutter_ui---v004)
 - [`ap_common_plugin` - `v0.5.1`](#ap_common_plugin---v051)
 - [`ap_common_firebase` - `v0.17.0+1`](#ap_common_firebase---v01701)
 - [`ap_common_announcement_ui` - `v0.0.3+1`](#ap_common_announcement_ui---v0031)
 - [`ap_common` - `v0.26.0+1`](#ap_common---v02601)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ap_common_firebase` - `v0.17.0+1`
 - `ap_common_announcement_ui` - `v0.0.3+1`
 - `ap_common` - `v0.26.0+1`

---

#### `ap_common_flutter_core` - `v0.0.4`

 - **FEAT**(flutter_core): update `multiple_localization` to any version. ([a4114e01](https://github.com/abc873693/ap_common/commit/a4114e0182568d90603041118d59130fbdbd3aa7))
 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))

#### `ap_common_flutter_platform` - `v0.0.5`

 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))

#### `ap_common_flutter_ui` - `v0.0.4`

 - **FEAT**: update GDG on Campus NKUST x ITC information". ([b2e1c200](https://github.com/abc873693/ap_common/commit/b2e1c200374c0090c9888f6642dc1d8a197ed661))

#### `ap_common_plugin` - `v0.5.1`

 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**: upgrade package flutter 3.29 compatible. ([54ae5f08](https://github.com/abc873693/ap_common/commit/54ae5f087f95858e551b0a78008072f74faaa17b))


## 2025-02-27

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_plugin` - `v0.5.0-dev.4`](#ap_common_plugin---v050-dev4)

---

#### `ap_common_plugin` - `v0.5.0-dev.4`

 - fix(ap_common_plugin): android plugin register setting

 - **FIX**(ap_common_plugin): android plugin register setting. ([07968966](https://github.com/abc873693/ap_common/commit/07968966be3576952eb924832048e51292a877e4))
 - **FEAT**(ap_common_plugin): update iOS setting for flutter 3.27 create. ([e65572db](https://github.com/abc873693/ap_common/commit/e65572dbd5f92b22612b4e7b4295aeca6b3bf42e))
 - **FEAT**(ap_common_plugin): upgrade gradle 8 setting for android 15. ([862d08af](https://github.com/abc873693/ap_common/commit/862d08af7006fa55ad42b23f9395cf95aed07916))


## 2024-12-18

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_flutter_platform` - `v0.0.4`](#ap_common_flutter_platform---v004)
 - [`ap_common` - `v0.26.0-dev.4`](#ap_common---v0260-dev4)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ap_common` - `v0.26.0-dev.4`

---

#### `ap_common_flutter_platform` - `v0.0.4`

 - **FEAT**: upgrade package for package `web` 1.0.0. ([c0ac3e33](https://github.com/abc873693/ap_common/commit/c0ac3e331b64a436e909a8ec7ab2983974ae37a4))


## 2024-12-18

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_plugin` - `v0.5.0-dev.3`](#ap_common_plugin---v050-dev3)

---

#### `ap_common_plugin` - `v0.5.0-dev.3`

 - **FEAT**(ap_common_plugin): update iOS setting for flutter 3.27 create. ([e65572db](https://github.com/abc873693/ap_common/commit/e65572dbd5f92b22612b4e7b4295aeca6b3bf42e))
 - **FEAT**(ap_common_plugin): upgrade gradle 8 setting for android 15. ([862d08af](https://github.com/abc873693/ap_common/commit/862d08af7006fa55ad42b23f9395cf95aed07916))


## 2024-10-13

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v0.26.0-dev.3`](#ap_common---v0260-dev3)
 - [`ap_common_announcement_ui` - `v0.0.3`](#ap_common_announcement_ui---v003)
 - [`ap_common_core` - `v0.0.5`](#ap_common_core---v005)
 - [`ap_common_firebase` - `v0.17.0-dev.4`](#ap_common_firebase---v0170-dev4)
 - [`ap_common_flutter_core` - `v0.0.3`](#ap_common_flutter_core---v003)
 - [`ap_common_flutter_platform` - `v0.0.3`](#ap_common_flutter_platform---v003)
 - [`ap_common_flutter_ui` - `v0.0.3`](#ap_common_flutter_ui---v003)
 - [`ap_common_plugin` - `v0.5.0-dev.2`](#ap_common_plugin---v050-dev2)

---

#### `ap_common` - `v0.26.0-dev.3`

 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([d87dc711](https://github.com/abc873693/ap_common/commit/d87dc7117a040b31b42abd2d1122a891fd04988e))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([e91e9b4c](https://github.com/abc873693/ap_common/commit/e91e9b4cdf3cb7d4e2dde1dd8ec5f66556d38461))
 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([ac50e177](https://github.com/abc873693/ap_common/commit/ac50e177cb276937b2411397959a845f98fa297a))
 - **FEAT**: `ap_common` import `ap_common_core`. ([a6aa801f](https://github.com/abc873693/ap_common/commit/a6aa801f2165281be61afbe33f4072827e5979bc))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([90f16bc9](https://github.com/abc873693/ap_common/commit/90f16bc9e38eb10f2d8f3b633f4c46a0a9e2ff95))

#### `ap_common_announcement_ui` - `v0.0.3`

 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))

#### `ap_common_core` - `v0.0.5`

 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: `ap_common_core` separate static error. ([177a00fd](https://github.com/abc873693/ap_common/commit/177a00fd613c7d869643f8d2c7ab02bc102fc064))
 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: `ap_common_core` separate static error. ([629ba29d](https://github.com/abc873693/ap_common/commit/629ba29d7d0aa59270eec1da45e49daebe3bf8b5))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: release `ap_common_core` v0.0.2. ([7eef7658](https://github.com/abc873693/ap_common/commit/7eef76580b57b66dfd78f5692cdc2a8748f575a3))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([4326c12e](https://github.com/abc873693/ap_common/commit/4326c12e28732d86a1b5a0fff2fdd6d3a3c6e5e6))
 - **FEAT**: `ap_common` import `ap_common_core`. ([d463f7c7](https://github.com/abc873693/ap_common/commit/d463f7c7b5cd78c171b90eea0210f81649fc5626))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([3887bc05](https://github.com/abc873693/ap_common/commit/3887bc05ebf8612f2b2a1cc607ec3c3fdf3135e1))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([f633fae8](https://github.com/abc873693/ap_common/commit/f633fae8d102d32624e23acad2c00c06c27b4dde))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([e91e9b4c](https://github.com/abc873693/ap_common/commit/e91e9b4cdf3cb7d4e2dde1dd8ec5f66556d38461))
 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))
 - **FEAT**: release `ap_common_core` v0.0.2. ([630bcec0](https://github.com/abc873693/ap_common/commit/630bcec0b9158ddd91c5fab9de1f630447547490))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([ac50e177](https://github.com/abc873693/ap_common/commit/ac50e177cb276937b2411397959a845f98fa297a))
 - **FEAT**: `ap_common` import `ap_common_core`. ([a6aa801f](https://github.com/abc873693/ap_common/commit/a6aa801f2165281be61afbe33f4072827e5979bc))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([90f16bc9](https://github.com/abc873693/ap_common/commit/90f16bc9e38eb10f2d8f3b633f4c46a0a9e2ff95))

#### `ap_common_firebase` - `v0.17.0-dev.4`

 - **FIX**: remove useless implement instance. ([a7ffaeb0](https://github.com/abc873693/ap_common/commit/a7ffaeb07914c1d1fbe32919cce95c5708843230))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: `ap_common_firebase` dependency usage. ([0c0b9e51](https://github.com/abc873693/ap_common/commit/0c0b9e510345c5482f69b4ea5fdcebdf217c565c))
 - **FIX**: `ap_common_firebase` separate static error. ([65b8a273](https://github.com/abc873693/ap_common/commit/65b8a2738092e0e261cd4088c778d54784e44b05))
 - **FIX**: remove useless implement instance. ([3ec164dd](https://github.com/abc873693/ap_common/commit/3ec164dd62590e684855128da1052cae34705bbb))
 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))
 - **FIX**: `ap_common_firebase` dependency usage. ([d5098b42](https://github.com/abc873693/ap_common/commit/d5098b426c00de39c0736a8ca535a76be0722331))
 - **FIX**: `ap_common_firebase` separate static error. ([1c8da8ea](https://github.com/abc873693/ap_common/commit/1c8da8ea57c7e3e48d3e53a824e76968d56a97b5))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([0e8a9aab](https://github.com/abc873693/ap_common/commit/0e8a9aab76b2a6994dbcfdf4814e6f7104e4b312))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: improve `ap_common_firebase` package import usage. ([7d021992](https://github.com/abc873693/ap_common/commit/7d0219927e3b4a7c2a924cdce86dd471f7564e19))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([f633fae8](https://github.com/abc873693/ap_common/commit/f633fae8d102d32624e23acad2c00c06c27b4dde))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))
 - **FEAT**: improve `ap_common_firebase` package import usage. ([aa6462c4](https://github.com/abc873693/ap_common/commit/aa6462c407b074b6fa95969765e28c85dc187de5))
 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))

#### `ap_common_flutter_core` - `v0.0.3`

 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([f9abb16d](https://github.com/abc873693/ap_common/commit/f9abb16d2e525ff8d5d4a68cd7a098e8025cd772))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([be152bac](https://github.com/abc873693/ap_common/commit/be152bac1b94f8e80baba9c098a938c44246b810))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([d87dc711](https://github.com/abc873693/ap_common/commit/d87dc7117a040b31b42abd2d1122a891fd04988e))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([e91e9b4c](https://github.com/abc873693/ap_common/commit/e91e9b4cdf3cb7d4e2dde1dd8ec5f66556d38461))

#### `ap_common_flutter_platform` - `v0.0.3`

 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([55b2fa00](https://github.com/abc873693/ap_common/commit/55b2fa00ea5fa4dafb15fc19e19b33dd9d72ef92))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))

#### `ap_common_flutter_ui` - `v0.0.3`

 - **FIX**: `ApAssets` path error. ([558e5445](https://github.com/abc873693/ap_common/commit/558e54451ed7ae1d1d0a9de2e74a8c2172845b9b))
 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: `ApAssets` path error. ([c70fdd2d](https://github.com/abc873693/ap_common/commit/c70fdd2dd9b470215f3d28d79197fc1b427397ef))
 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([803b2dcb](https://github.com/abc873693/ap_common/commit/803b2dcbb37d970de803670c7a76404356c4a651))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))

#### `ap_common_plugin` - `v0.5.0-dev.2`

 - **FIX**: pub publish requirement. ([1dc81f7d](https://github.com/abc873693/ap_common/commit/1dc81f7dcf5a1445aa14b66b6d2004b7d94ad6b2))
 - **FIX**: packages version constraint. ([8231a423](https://github.com/abc873693/ap_common/commit/8231a423b237d6f38b3531ec4fc2b06e713a6c51))
 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))
 - **FEAT**: centralized package lint rule. ([c2b8ad80](https://github.com/abc873693/ap_common/commit/c2b8ad8000bb19d0d5fccdaf63f0411329e6dcfa))
 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))


## 2024-10-12

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_firebase` - `v0.17.0-dev.3`](#ap_common_firebase---v0170-dev3)

---

#### `ap_common_firebase` - `v0.17.0-dev.3`

 - **FIX**: remove useless implement instance. ([3ec164dd](https://github.com/abc873693/ap_common/commit/3ec164dd62590e684855128da1052cae34705bbb))


## 2024-10-12

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_announcement_ui` - `v0.0.2+1`](#ap_common_announcement_ui---v0021)
 - [`ap_common_core` - `v0.0.4`](#ap_common_core---v004)
 - [`ap_common_firebase` - `v0.17.0-dev.2`](#ap_common_firebase---v0170-dev2)
 - [`ap_common_flutter_core` - `v0.0.2+1`](#ap_common_flutter_core---v0021)
 - [`ap_common_flutter_platform` - `v0.0.2+1`](#ap_common_flutter_platform---v0021)
 - [`ap_common_flutter_ui` - `v0.0.2+1`](#ap_common_flutter_ui---v0021)
 - [`ap_common_plugin` - `v0.5.0-dev.1`](#ap_common_plugin---v050-dev1)
 - [`ap_common` - `v0.26.0-dev.2`](#ap_common---v0260-dev2)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ap_common` - `v0.26.0-dev.2`

---

#### `ap_common_announcement_ui` - `v0.0.2+1`

 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))

#### `ap_common_core` - `v0.0.4`

 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([f633fae8](https://github.com/abc873693/ap_common/commit/f633fae8d102d32624e23acad2c00c06c27b4dde))

#### `ap_common_firebase` - `v0.17.0-dev.2`

 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))
 - **FEAT**: `AnalyticsUtil` and `CrashlyticsUtil` migrate to injection version. ([f633fae8](https://github.com/abc873693/ap_common/commit/f633fae8d102d32624e23acad2c00c06c27b4dde))

#### `ap_common_flutter_core` - `v0.0.2+1`

 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))

#### `ap_common_flutter_platform` - `v0.0.2+1`

 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))

#### `ap_common_flutter_ui` - `v0.0.2+1`

 - **FIX**: `ApAssets` path error. ([c70fdd2d](https://github.com/abc873693/ap_common/commit/c70fdd2dd9b470215f3d28d79197fc1b427397ef))
 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))

#### `ap_common_plugin` - `v0.5.0-dev.1`

 - **FIX**: pub publish requirement. ([839ad892](https://github.com/abc873693/ap_common/commit/839ad892cb67fb04d8c1f877129faa2847c76f77))
 - **FIX**: packages version constraint. ([783781bd](https://github.com/abc873693/ap_common/commit/783781bdb314a93b89415f8de9fb6acdcd38a222))


## 2024-10-11

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common` - `v0.26.0-dev.1`](#ap_common---v0260-dev1)
 - [`ap_common_announcement_ui` - `v0.0.2`](#ap_common_announcement_ui---v002)
 - [`ap_common_core` - `v0.0.3`](#ap_common_core---v003)
 - [`ap_common_flutter_core` - `v0.0.2`](#ap_common_flutter_core---v002)
 - [`ap_common_flutter_platform` - `v0.0.2`](#ap_common_flutter_platform---v002)
 - [`ap_common_flutter_ui` - `v0.0.2`](#ap_common_flutter_ui---v002)
 - [`ap_common_firebase` - `v0.17.0-dev.1`](#ap_common_firebase---v0170-dev1)

Packages with dependency updates only:

> Packages listed below depend on other packages in this workspace that have had changes. Their versions have been incremented to bump the minimum dependency versions of the packages they depend upon in this project.

 - `ap_common_firebase` - `v0.17.0-dev.1`

---

#### `ap_common` - `v0.26.0-dev.1`

 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([d87dc711](https://github.com/abc873693/ap_common/commit/d87dc7117a040b31b42abd2d1122a891fd04988e))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([e91e9b4c](https://github.com/abc873693/ap_common/commit/e91e9b4cdf3cb7d4e2dde1dd8ec5f66556d38461))
 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([ac50e177](https://github.com/abc873693/ap_common/commit/ac50e177cb276937b2411397959a845f98fa297a))
 - **FEAT**: `ap_common` import `ap_common_core`. ([a6aa801f](https://github.com/abc873693/ap_common/commit/a6aa801f2165281be61afbe33f4072827e5979bc))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([90f16bc9](https://github.com/abc873693/ap_common/commit/90f16bc9e38eb10f2d8f3b633f4c46a0a9e2ff95))
 - **FEAT**: update example path. ([4d7390c9](https://github.com/abc873693/ap_common/commit/4d7390c9212631e1233c37c901a4454610783926))
 - **FEAT**: move main package to directory `packages` for melos prepare. ([8af51340](https://github.com/abc873693/ap_common/commit/8af51340576e8236b261a21188cc8feaa0776785))

#### `ap_common_announcement_ui` - `v0.0.2`

 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))

#### `ap_common_core` - `v0.0.3`

 - **FIX**: `ap_common_core` separate static error. ([629ba29d](https://github.com/abc873693/ap_common/commit/629ba29d7d0aa59270eec1da45e49daebe3bf8b5))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([e91e9b4c](https://github.com/abc873693/ap_common/commit/e91e9b4cdf3cb7d4e2dde1dd8ec5f66556d38461))
 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))
 - **FEAT**: release `ap_common_core` v0.0.2. ([630bcec0](https://github.com/abc873693/ap_common/commit/630bcec0b9158ddd91c5fab9de1f630447547490))
 - **FEAT**: migrate `NotificationUtil` and `Preference` to injection version. ([ac50e177](https://github.com/abc873693/ap_common/commit/ac50e177cb276937b2411397959a845f98fa297a))
 - **FEAT**: `ap_common` import `ap_common_core`. ([a6aa801f](https://github.com/abc873693/ap_common/commit/a6aa801f2165281be61afbe33f4072827e5979bc))
 - **FEAT**: migrate `model`  `util` `config` to new `ap_common_core`. ([90f16bc9](https://github.com/abc873693/ap_common/commit/90f16bc9e38eb10f2d8f3b633f4c46a0a9e2ff95))

#### `ap_common_flutter_core` - `v0.0.2`

 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))
 - **FEAT**: `AppStoreUtil` and `PlatformUtil` for `ap_common_flutter_core`. ([d87dc711](https://github.com/abc873693/ap_common/commit/d87dc7117a040b31b42abd2d1122a891fd04988e))
 - **FEAT**: migrate `util` `l10n`  to new `ap_common_flutter_core`. ([e91e9b4c](https://github.com/abc873693/ap_common/commit/e91e9b4cdf3cb7d4e2dde1dd8ec5f66556d38461))

#### `ap_common_flutter_platform` - `v0.0.2`

 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))

#### `ap_common_flutter_ui` - `v0.0.2`

 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))


## 2024-10-11

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_plugin` - `v0.5.0-dev.0`](#ap_common_plugin---v050-dev0)

---

#### `ap_common_plugin` - `v0.5.0-dev.0`

 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))
 - **FEAT**: update example path. ([4d7390c9](https://github.com/abc873693/ap_common/commit/4d7390c9212631e1233c37c901a4454610783926))
 - **FEAT**: CI setting for mono-repo. ([d22f6d15](https://github.com/abc873693/ap_common/commit/d22f6d15f64879dbf9711574aba4bba6e227f128))
 - **FEAT**: melos generation setup. ([90497edd](https://github.com/abc873693/ap_common/commit/90497edd12d449e66991d654a03175edebf1e816))
 - **FEAT**: melos basic setting. ([fa8e1946](https://github.com/abc873693/ap_common/commit/fa8e1946fd478c1a0cf1635eaeb0fb60cc264750))


## 2024-10-11

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_firebase` - `v0.17.0-dev.0`](#ap_common_firebase---v0170-dev0)

---

#### `ap_common_firebase` - `v0.17.0-dev.0`

 - **FIX**: `ap_common_firebase` dependency usage. ([d5098b42](https://github.com/abc873693/ap_common/commit/d5098b426c00de39c0736a8ca535a76be0722331))
 - **FIX**: `ap_common_firebase` separate static error. ([1c8da8ea](https://github.com/abc873693/ap_common/commit/1c8da8ea57c7e3e48d3e53a824e76968d56a97b5))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))
 - **FEAT**: improve `ap_common_firebase` package import usage. ([aa6462c4](https://github.com/abc873693/ap_common/commit/aa6462c407b074b6fa95969765e28c85dc187de5))
 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))
 - **FEAT**: update example path. ([4d7390c9](https://github.com/abc873693/ap_common/commit/4d7390c9212631e1233c37c901a4454610783926))
 - **FEAT**: melos generation setup. ([90497edd](https://github.com/abc873693/ap_common/commit/90497edd12d449e66991d654a03175edebf1e816))
 - **FEAT**: melos basic setting. ([f2d4fafd](https://github.com/abc873693/ap_common/commit/f2d4fafd48c812901f5394fb83f6f5e5ff67401c))


## 2024-10-11

### Changes

---

Packages with breaking changes:

 - There are no breaking changes in this release.

Packages with other changes:

 - [`ap_common_firebase` - `v0.17.0-dev.0`](#ap_common_firebase---v0170-dev0)

---

#### `ap_common_firebase` - `v0.17.0-dev.0`

 - test

 - **FIX**: `ap_common_firebase` dependency usage. ([d5098b42](https://github.com/abc873693/ap_common/commit/d5098b426c00de39c0736a8ca535a76be0722331))
 - **FIX**: `ap_common_firebase` separate static error. ([1c8da8ea](https://github.com/abc873693/ap_common/commit/1c8da8ea57c7e3e48d3e53a824e76968d56a97b5))
 - **FEAT**: move UI implement to `ap_common_flutter_ui`. ([304b60fa](https://github.com/abc873693/ap_common/commit/304b60fa245dbd0b1d4d3ae649b5468e9ee46f71))
 - **FEAT**: move native platform util implement to `ap_common_flutter_platform`. ([8cb047f1](https://github.com/abc873693/ap_common/commit/8cb047f167d6f10eaab063449a88646092faff10))
 - **FEAT**: improve `ap_common_firebase` package import usage. ([aa6462c4](https://github.com/abc873693/ap_common/commit/aa6462c407b074b6fa95969765e28c85dc187de5))
 - **FEAT**: centralized package lint rule. ([08db9e1f](https://github.com/abc873693/ap_common/commit/08db9e1f00118f11ef389b194585626d7c51c3ab))
 - **FEAT**: update example path. ([4d7390c9](https://github.com/abc873693/ap_common/commit/4d7390c9212631e1233c37c901a4454610783926))
 - **FEAT**: melos generation setup. ([90497edd](https://github.com/abc873693/ap_common/commit/90497edd12d449e66991d654a03175edebf1e816))
 - **FEAT**: melos basic setting. ([f2d4fafd](https://github.com/abc873693/ap_common/commit/f2d4fafd48c812901f5394fb83f6f5e5ff67401c))

