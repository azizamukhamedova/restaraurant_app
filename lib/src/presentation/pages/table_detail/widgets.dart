import 'package:flutter/material.dart';

class IncreaseButton extends StatelessWidget {
  const IncreaseButton({
    super.key,
    required this.add,
    required this.color,
  });

  final Function() add;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => add(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
          color: color,
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class DecreaseButton extends StatelessWidget {
  const DecreaseButton({
    super.key,
    required this.decrease,
    required this.color,
  });

  final Function() decrease;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => decrease(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(40),
          ),
          color: color,
        ),
        child: const Icon(
          Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
