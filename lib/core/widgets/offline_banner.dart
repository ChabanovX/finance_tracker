import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yndx_homework/shared/providers/network_provider.dart';

class OfflineBanner extends ConsumerWidget {
  final Widget child;
  final String message;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsets padding;
  final bool showAboveTabBar;
  
  const OfflineBanner({
    Key? key,
    required this.child,
    this.message = 'Режим офлайн',
    this.backgroundColor = Colors.red,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.showAboveTabBar = true,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final networkState = ref.watch(networkStateProvider);
    
    return networkState.when(
      data: (isConnected) {
        if (isConnected) {
          return child;
        }
        
        return Column(
          children: [
            Container(
              width: double.infinity,
              color: backgroundColor,
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off,
                    color: Colors.white,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    message,
                    style: textStyle ??
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(child: child),
          ],
        );
      },
      loading: () => child,
      error: (_, __) => Column(
        children: [
          Container(
            width: double.infinity,
            color: backgroundColor,
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.white,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  'Проблемы с сетью',
                  style: textStyle ??
                      const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class AnimatedOfflineBanner extends ConsumerStatefulWidget {
  final Widget child;
  final String message;
  final Color backgroundColor;
  final Duration animationDuration;
  
  const AnimatedOfflineBanner({
    Key? key,
    required this.child,
    this.message = 'Режим офлайн',
    this.backgroundColor = Colors.red,
    this.animationDuration = const Duration(milliseconds: 300),
  }) : super(key: key);
  
  @override
  ConsumerState<AnimatedOfflineBanner> createState() => _AnimatedOfflineBannerState();
}

class _AnimatedOfflineBannerState extends ConsumerState<AnimatedOfflineBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final networkState = ref.watch(networkStateProvider);
    
    return networkState.when(
      data: (isConnected) {
        if (isConnected) {
          _controller.reverse();
        } else {
          _controller.forward();
        }
        
        return Column(
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SizeTransition(
                  sizeFactor: _animation,
                  child: Container(
                    width: double.infinity,
                    color: widget.backgroundColor,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wifi_off,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Expanded(child: widget.child),
          ],
        );
      },
      loading: () => widget.child,
      error: (_, __) => widget.child,
    );
  }
}
