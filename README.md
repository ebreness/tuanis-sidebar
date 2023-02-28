# tuanis_sidebar
Sidebar Flutter package

## Example
```dart
import 'package:flutter/material.dart';
import 'package:tuanis_sidebar/tuanis_sidebar.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Example(),
    ),
  );
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TuanisSidebar(
            selectedItemId: 'settings',
            items: [
              TuanisSidebarItem(
                id: 'dashboard',
                label: 'Dashboard',
                leadingIcon: Icons.dashboard,
                onClick: () {
                  print('dashboard');
                },
              ),
              TuanisSidebarItem(
                id: 'settings',
                label: 'Settings',
                leadingIcon: Icons.settings,
                onClick: () {
                  print('settings');
                },
              ),
              TuanisSidebarItem(
                id: 'inventory',
                label: 'Inventory',
                leadingIcon: Icons.inventory,
                onClick: () {
                  print('inventory');
                },
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(50),
              color: Colors.orange,
              child: const Text('App body here'),
            ),
          )
        ],
      ),
    );
  }
}
```

[screenshot](./doc/assets/screenshot.png)
