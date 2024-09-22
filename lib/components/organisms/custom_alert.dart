part of 'index.dart';

class CustomAlert extends StatefulWidget {
  const CustomAlert({
    required this.body,
    this.customKeyboardHeight,
    this.headerFixed,
    this.imageUrl,
    this.showTopLine = true,
    this.showClose = true,
    this.hasScrollAnimation = true,
    this.paddingBottom = SpacingTheme.l,
    this.paddingLeft = SpacingTheme.s,
    this.paddingRight = SpacingTheme.s,
    this.footerWidget = const SizedBox.shrink(),
    this.onBack,
    this.imageHeight,
    this.imageWidth,
    this.useNavigatorPopInClose = true,
    this.onTapClose,
    this.scrollAnimationDuration = 800,
    this.scrollPhysics,
    super.key,
  });

  final Widget body;
  final Widget? headerFixed;
  final String? imageUrl;
  final bool showTopLine;
  final bool showClose;
  final bool hasScrollAnimation;
  final double paddingBottom;
  final double paddingLeft;
  final double paddingRight;
  final double? imageHeight;
  final double? imageWidth;
  final int scrollAnimationDuration;
  final double? customKeyboardHeight;
  final Widget footerWidget;
  final bool useNavigatorPopInClose;
  final VoidCallback? onBack;
  final VoidCallback? onTapClose;
  final ScrollPhysics? scrollPhysics;

  @override
  State<CustomAlert> createState() => CustomAlertMessageWidgetState();
}

class CustomAlertMessageWidgetState extends State<CustomAlert> {
  @visibleForTesting
  late ScrollController scrollController;
  @visibleForTesting
  double keyboardHeight = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void didChangeDependencies() {
    keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double factorKeyboardHeight = widget.customKeyboardHeight ?? 0;
    if (keyboardHeight > 0 &&
        scrollController.hasClients &&
        widget.hasScrollAnimation) {
      scrollController.animateTo(
        PlatformUtils().isAndroid || widget.customKeyboardHeight != null
            ? keyboardHeight - factorKeyboardHeight
            : scrollController.position.maxScrollExtent - 2,
        curve: Curves.easeOut,
        duration: Duration(milliseconds: widget.scrollAnimationDuration),
      );
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool value) async {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Stack(
              children: <Widget>[
                if (widget.onBack != null)
                  Padding(
                    padding: const EdgeInsets.only(left: SpacingTheme.s),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        key: const Key('widget:alert-message_btn:go-back'),
                        onTap: () {
                          Navigator.pop(context);
                          widget.onBack!();
                        },
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                if (widget.showTopLine)
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MaterialTheme.lightScheme().onSurfaceVariant,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 64,
                      height: 4,
                    ),
                  ),
                if (widget.onBack == null && widget.showClose)
                  Padding(
                    padding: const EdgeInsets.only(right: SpacingTheme.s),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        key: const Key('widget:alert-message_btn:close'),
                        onTap: () {
                          if (widget.useNavigatorPopInClose) {
                            Navigator.pop(context);
                          }
                          if (widget.onTapClose != null) {
                            widget.onTapClose!();
                          }
                        },
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (widget.headerFixed != null)
            Padding(
              padding: EdgeInsets.only(
                left: widget.paddingLeft,
                right: widget.paddingRight,
              ),
              child: widget.headerFixed,
            ),
          Flexible(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Container(
                padding: EdgeInsets.only(
                  bottom: widget.paddingBottom,
                  left: widget.paddingLeft,
                  right: widget.paddingRight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: SpacingTheme.m,
                          bottom: SpacingTheme.l,
                        ),
                        child: Image.asset(
                          widget.imageUrl!,
                          width: widget.imageWidth ?? 140,
                          height: widget.imageHeight ?? 140,
                        ),
                      ),
                    widget.body,
                    SizedBox(height: keyboardHeight),
                  ],
                ),
              ),
            ),
          ),
          widget.footerWidget,
        ],
      ),
    );
  }
}
