import 'package:flutter/material.dart';
import 'package:medicine_finder/screen/home/widget/menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key, this.onItemSelected}) : super(key: key);

  final Function(int)? onItemSelected;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.75),
      constraints: const BoxConstraints(minWidth: 300),
      child: Column(
        children: [
          MenuItem(
            icon: Icons.drag_indicator,
            title: "داروها",
            isSelected: selectedIndex == 0,
            onTap: () {
              if (selectedIndex != 0) {
                setState(() {
                selectedIndex = 0;
                widget.onItemSelected?.call(0);
              });
              }
            },
          ),
          MenuItem(
            icon: Icons.store_outlined,
            title: "داروخانه‌ها",
            isSelected: selectedIndex == 1,
            onTap: () {
              if (selectedIndex != 1) {
                setState(() {
                selectedIndex = 1;
                widget.onItemSelected?.call(1);
              });
              }
            },
          ),
        ],
      ),
    );
  }
}
