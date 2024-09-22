part of 'index.dart';
class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.body,
    required this.title,
    this.showBack = true,
  });
  final Widget body;
  final bool showBack;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MaterialTheme.lightScheme().secondaryContainer,
      body: Column(
        children: [
          SpacingTheme.vs,
          CustomHeader(
            title: title,
            showBack: showBack,
          ),
          Padding(
            padding: const EdgeInsets.all(SpacingTheme.s),
            child: Column(
              children: [SpacingTheme.vxs, SingleChildScrollView(child: body)],
            ),
          ),
        ],
      ),
    );
  }
}
