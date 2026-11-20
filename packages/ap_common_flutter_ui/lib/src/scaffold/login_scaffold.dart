import 'package:ap_common_flutter_ui/src/scaffold/ap_app_shell.dart';
import 'package:ap_common_flutter_ui/src/scaffold/ap_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

export 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

enum LogoMode { text, image }

class LoginScaffold extends StatefulWidget {
  const LoginScaffold({
    super.key,
    required this.logoSource,
    required this.forms,
    this.logoMode = LogoMode.text,
    this.logoSubtitle,
    this.appBarTitle,
    this.showBackButton = true,
  });

  final LogoMode logoMode;
  final String logoSource;
  final String? logoSubtitle;
  final List<Widget> forms;

  /// Retained for source compatibility. Login headers no longer show a title.
  final String? appBarTitle;
  final bool showBackButton;

  static const String routerName = '/login';

  @override
  LoginScaffoldState createState() => LoginScaffoldState();
}

class LoginScaffoldState extends State<LoginScaffold> {
  bool get isTablet => MediaQuery.of(context).size.shortestSide >= 600;

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return ApPageScaffold(
      resizeToAvoidBottomInset: orientation == Orientation.portrait,
      title: widget.showBackButton && Navigator.of(context).canPop()
          ? const SizedBox.shrink()
          : null,
      transparentAppBar: true,
      appBarForegroundColor:
          isDark ? colorScheme.onSurface : colorScheme.onPrimary,
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isDark
                ? <Color>[
                    colorScheme.surface,
                    colorScheme.surfaceContainerLowest,
                  ]
                : <Color>[
                    colorScheme.primary,
                    colorScheme.primaryContainer,
                  ],
          ),
        ),
        child: AutofillGroup(
          child: KeyboardDismissOnTap(
            child: SafeArea(
              bottom: false,
              child: Center(
                child: SingleChildScrollView(
                  padding: ApAppShell.contentPadding(
                    context,
                    spacing: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                  ),
                  child: orientation == Orientation.portrait
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              _renderContent(orientation, colorScheme, isDark),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              _renderContent(orientation, colorScheme, isDark),
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget logo(ColorScheme colorScheme, bool isDark) {
    final Widget logoWidget = switch (widget.logoMode) {
      LogoMode.image => Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: isDark
                ? colorScheme.primaryContainer
                : colorScheme.onPrimary.withAlpha(51),
            borderRadius: BorderRadius.circular(24),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: colorScheme.shadow.withAlpha(26),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              widget.logoSource,
              fit: BoxFit.contain,
            ),
          ),
        ),
      LogoMode.text => TextLogo(
          text: widget.logoSource,
          isDark: isDark,
          colorScheme: colorScheme,
        ),
    };
    if (widget.logoSubtitle == null) return logoWidget;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        logoWidget,
        const SizedBox(height: 16),
        Text(
          widget.logoSubtitle!,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: isDark ? colorScheme.onSurface : colorScheme.onPrimary,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  List<Widget> _renderContent(
    Orientation orientation,
    ColorScheme colorScheme,
    bool isDark,
  ) {
    final Widget logoWidget = logo(colorScheme, isDark);
    final Widget formCard = Container(
      constraints: const BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: colorScheme.shadow.withAlpha(26),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.forms,
        ),
      ),
    );

    if (orientation == Orientation.portrait) {
      return <Widget>[
        Center(child: logoWidget),
        const SizedBox(height: 48),
        formCard,
      ];
    } else {
      return <Widget>[
        Expanded(
          child: Center(child: logoWidget),
        ),
        const SizedBox(width: 32),
        Expanded(
          child: Center(child: formCard),
        ),
      ];
    }
  }
}

class TextCheckBox extends StatelessWidget {
  const TextCheckBox({
    super.key,
    required this.value,
    required this.text,
    required this.onChanged,
  });

  final bool value;
  final String text;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return MergeSemantics(
      child: InkWell(
        onTap: (onChanged == null) ? null : () => onChanged?.call(!value),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: value,
                  onChanged: onChanged,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ApButton extends StatelessWidget {
  const ApButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  final String text;
  final Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              )
            : Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}

class ApFlatButton extends StatelessWidget {
  const ApFlatButton({
    super.key,
    this.onPressed,
    this.text,
  });

  final Function()? onPressed;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text ?? '',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}

class TextLogo extends StatelessWidget {
  const TextLogo({
    super.key,
    required this.text,
    this.isDark = false,
    this.colorScheme,
  });

  final String text;
  final bool isDark;
  final ColorScheme? colorScheme;

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = colorScheme ?? Theme.of(context).colorScheme;
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: isDark ? cs.onSurface : cs.onPrimary,
      ),
    );
  }
}

class ApTextField extends StatelessWidget {
  const ApTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
    this.onSubmitted,
    this.labelText = '',
    this.errorText,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLength,
    this.onChanged,
    this.autofillHints,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final TextInputAction textInputAction;
  final String labelText;
  final String? errorText;
  final Function(String text)? onSubmitted;
  final Function(String text)? onChanged;
  final bool obscureText;
  final int? maxLength;
  final TextInputType keyboardType;
  final Iterable<String>? autofillHints;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextField(
      key: key,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: TextStyle(color: colorScheme.onSurface, fontSize: 16),
      onSubmitted: (String text) {
        focusNode?.unfocus();
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        }
        onSubmitted?.call(text);
      },
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        errorText: errorText,
        counterText: '',
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: colorScheme.onSurfaceVariant)
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: colorScheme.outline.withAlpha(77),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
      ),
      autofillHints: autofillHints,
    );
  }
}
