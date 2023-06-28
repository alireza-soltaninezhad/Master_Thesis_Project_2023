import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  final IconData icon;
  final Function()? onTap;

  const MenuItem({Key? key, required this.title, required this.icon, this.isSelected = false, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 300,
        color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
        child: Row(
          children: [
            Icon(icon, color: Colors.white,),
            const SizedBox(width: 16,),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
