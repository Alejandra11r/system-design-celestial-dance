part of 'index.dart';
class CustomHeader extends StatelessWidget {
  const CustomHeader({
    required this.title,
    this.showBack = true,
    this.onBack,
    super.key,
  });
  final String title;
  final VoidCallback? onBack;
  final bool showBack;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SpacingTheme.xxs),
      child: Card(
        elevation: 3,
        child: SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.all(SpacingTheme.xs),
            child: Row(
              children: [
                if (showBack)
                  InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: MaterialTheme.lightScheme().onSurface,
                    ),
                    onTap: () {
                      if (onBack != null) {
                        onBack!();
                      } else if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: SpacingTheme.s,
                      color: MaterialTheme.lightScheme().onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
