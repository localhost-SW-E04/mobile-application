import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required double drawerIconSize,
    required IconData icon,
    required String text,
    VoidCallback? onPress,
  })  : _drawerIconSize = drawerIconSize,
        _icon = icon,
        _text = text,
        _onTap = onPress,
        super(key: key);

  final double _drawerIconSize;
  final IconData _icon;
  final String _text;
  final VoidCallback? _onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        _icon,
        size: _drawerIconSize,
        color: Colors.black,
      ),
      title: Text(
        _text,
        style: TextStyle(
          fontSize: 17,
          color: Colors.black54,
        ),
      ),
      onTap: _onTap,
    );
  }
}
