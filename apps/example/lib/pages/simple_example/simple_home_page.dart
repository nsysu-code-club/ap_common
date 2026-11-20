import 'package:ap_common/ap_common.dart';
import 'package:ap_common_example/pages/simple_example/simple_course_page.dart';
import 'package:ap_common_example/pages/simple_example/simple_login_page.dart';
import 'package:ap_common_example/pages/simple_example/simple_score_page.dart';
import 'package:flutter/material.dart';

/// Simplified home page demonstrating the convenience widgets.
class SimpleHomePage extends StatelessWidget {
  const SimpleHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ApLocalizations ap = context.ap;

    return ApPageScaffold(
      title: const Text('Simple Example'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: () {
            final ApAppState state = ApApp.of(context);
            state.setThemeMode(
              state.themeMode == ThemeMode.dark
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
        ),
      ],
      body: ListView(
        padding: ApAppShell.contentPadding(context),
        children: <Widget>[
          _buildCard(
            context,
            icon: Icons.login,
            title: ap.login,
            subtitle: 'ApLoginPage — built-in preference handling',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const SimpleLoginPage(),
              ),
            ),
          ),
          _buildCard(
            context,
            icon: Icons.calendar_today,
            title: ap.course,
            subtitle: 'ApCoursePage — auto semester & state management',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const SimpleCoursePage(),
              ),
            ),
          ),
          _buildCard(
            context,
            icon: Icons.assignment,
            title: ap.score,
            subtitle: 'ApScorePage — auto semester & state management',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => const SimpleScorePage(),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'These pages use ApCoursePage, ApScorePage, ApLoginPage '
              'convenience widgets — each replacing ~100-200 lines of '
              'boilerplate with a single widget call.',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
