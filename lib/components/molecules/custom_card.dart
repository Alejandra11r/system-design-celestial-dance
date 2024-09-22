part of 'index.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    required this.title,
    this.subTitle,
    this.actions,
    this.onTap,
    super.key,
  });

  final String title;
  final String? subTitle;
  final Widget? actions;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(SpacingTheme.s),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: SpacingTheme.s,
                      color: MaterialTheme.lightScheme().onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: SpacingTheme.xxs,
                  ),
                  if (subTitle != null)
                    Text(
                      subTitle!,
                      style: TextStyle(
                        fontSize: 12,
                        color: MaterialTheme.lightScheme().onSurface,
                      ),
                    ),
                ],
              ),
              if (actions != null)
                actions!
              else
                const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}
