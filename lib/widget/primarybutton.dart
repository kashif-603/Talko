import 'package:flutter/material.dart';

class Primarybutton extends StatefulWidget {
  const Primarybutton(
      {super.key,
      required this.btnNmae,
      required this.icon,
      required this.onTap,
      TextStyle? style});
  final String btnNmae;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<Primarybutton> createState() => _PrimarybuttonState();
}

class _PrimarybuttonState extends State<Primarybutton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.orange),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.icon),
              SizedBox(width: 3),
              Text(
                widget.btnNmae,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
