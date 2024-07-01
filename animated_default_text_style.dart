import 'package:flutter/material.dart';

class DefaultTextStyleWidget extends StatefulWidget {
  const DefaultTextStyleWidget({super.key});

  @override
  State<DefaultTextStyleWidget> createState() =>
      _DefaultTextStyleWidgetState();
}

class _DefaultTextStyleWidgetState
    extends State<DefaultTextStyleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  final TextStyle _style1 = const TextStyle(
      fontSize: 26, color: Colors.black, fontWeight: FontWeight.normal);
  final TextStyle _style2 = const TextStyle(
      fontSize: 40, color: Colors.blue, fontWeight: FontWeight.w900);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Default TextStyle Transition Example"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DefaultTextStyleTransition(
                style: _animation
                    .drive(TextStyleTween(begin: _style1, end: _style2)),
                child: const Text("7Learn")),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    if (_controller.status == AnimationStatus.completed) {
                      _controller.reverse();
                    }
                  },
                  icon: const Icon(Icons.indeterminate_check_box, size: 35)),
              IconButton(
                  onPressed: () {
                    if (_controller.status != AnimationStatus.completed) {
                      _controller.forward();
                    }
                  },
                  icon: const Icon(Icons.add_box_rounded, size: 35)),
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
