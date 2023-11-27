import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContextMenu extends StatefulWidget {
  const ContextMenu({super.key});

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino Context Menu'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CupertinoContextMenu.builder(
              builder: (context, animation) {
                if (animation.value < CupertinoContextMenu.animationOpensAt) {
                  return Image.network(
                    'https://picsum.photos/${index}00/300',
                    fit: BoxFit.cover,
                  );
                }
                return Container(
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.all(20),
                  child: const Card(
                    child: Center(
                      child: Text(
                        'Hello',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                );
              },
              actions: [
                CupertinoContextMenuAction(
                  onPressed: () {},
                  trailingIcon: Icons.close,
                  child: const Text('Close'),
                ),
                CupertinoContextMenuAction(
                  trailingIcon: Icons.share,
                  child: const Text('Share'),
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
