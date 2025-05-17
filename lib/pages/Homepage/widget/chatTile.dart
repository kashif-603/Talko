import 'package:flutter/material.dart';

class Chattile extends StatelessWidget {
  final String img;
  final String title;
  final String subtitle;
  final String time;

  const Chattile({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(img),
        radius: 25,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: colorScheme.onBackground, // Dynamic color
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: colorScheme.onBackground.withOpacity(0.7),
        ),
      ),
      trailing: Text(
        time,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: colorScheme.onBackground.withOpacity(0.7),
        ),
      ),
    );
  }
}
