part of 'transactions_page.dart';

class _LoadingTransactionsList extends StatelessWidget {
  const _LoadingTransactionsList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SkeletonHeaderListTile(),
        const Divider(height: 1),
        Expanded(
          child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (_, i) => _SkeletonListTile(isFirstInList: i == 0),
          ),
        ),
      ],
    );
  }
}

class _SkeletonHeaderListTile extends StatefulWidget {
  const _SkeletonHeaderListTile();

  @override
  State<_SkeletonHeaderListTile> createState() =>
      _SkeletonHeaderListTileState();
}

class _SkeletonHeaderListTileState extends State<_SkeletonHeaderListTile>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween<double>(
      begin: 0.3,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.accentLight,
      height: 56,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Всего'),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: _animation.value,
                  child: Row(
                    children: [
                      _SkeletonBox(width: 80, height: 16),
                      SizedBox(width: 4),
                      Text('₽'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SkeletonListTile extends StatelessWidget {
  const _SkeletonListTile({required this.isFirstInList});

  final bool isFirstInList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isFirstInList ? 68 : 69,
      child: Row(
        children: [
          SizedBox(width: 16),
          _SkeletonBox(width: 24, height: 24, borderRadius: 12),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SkeletonBox(width: 120, height: 16),
                  SizedBox(height: 4),
                  _SkeletonBox(width: 80, height: 14),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          _SkeletonBox(width: 60, height: 16),
          SizedBox(width: 16),
          Icon(
            Icons.chevron_right_rounded,
            color: context.colors.inactive.withAlpha((0.3 * 255).toInt()),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

class _SkeletonBox extends StatefulWidget {
  const _SkeletonBox({
    required this.width,
    required this.height,
    this.borderRadius = 4,
  });

  final double width;
  final double height;
  final double borderRadius;

  @override
  State<_SkeletonBox> createState() => _SkeletonBoxState();
}

class _SkeletonBoxState extends State<_SkeletonBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: context.colors.inactive.withAlpha(
              (_animation.value * 255).toInt(),
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        );
      },
    );
  }
}
