import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContextMenu extends StatefulWidget {
  const ContextMenu({super.key});

  @override
  State<ContextMenu> createState() => _ContextMenuState();
}

class _ContextMenuState extends State<ContextMenu> {
  Offset _offset = Offset.zero;
  bool isOnline = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino Context Menu'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          var DragUpdateDetails(:delta) = details;
          var dx = _offset.dx;

          if (isOnline) {
            if (details.delta.dx < 0) {
              dx -= details.delta.distance;
            } else {
              dx += details.delta.distance;
              dx = min(0, dx);
            }
          } else {
            if (delta.dx > 0) {
              dx += delta.distance;
            } else {
              dx -= details.delta.distance;
              dx = max(0, dx);
            }
          }
          setState(() {
            _offset = Offset(dx, 0);
          });
        },
        onPanEnd: (details) {
          if (!isOnline && _offset.dx > 100) {
            isOnline = true;
          } else if (isOnline && _offset.dx < -100) {
            isOnline = false;
          }

          setState(() {
            _offset = Offset.zero;
          });
          print(isOnline);
        },
        child: AnimatedContainer(
          height: 70,
          padding: const EdgeInsets.all(16),
          curve: Curves.bounceInOut,
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
              color: switch (isOnline) {
            true => Colors.green,
            _ => Colors.red.withOpacity(0.3)
          }),
          child: Transform.translate(
            offset: _offset,
            child: Row(
              children: [
                if (!isOnline) const Icon(Icons.forward),
                Text.rich(
                  TextSpan(
                    text: '${isOnline ? 'ONLINE' : 'OFFLINE'} - ',
                    style: const TextStyle(fontSize: 18, color: Colors.white),
                    children: const [
                      TextSpan(
                        text: '(SWIPE TO GO ONLINE)',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
                if (isOnline)
                  const RotatedBox(
                    quarterTurns: 2,
                    child: Icon(Icons.forward),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GridView _m() {
    return GridView.builder(
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
    );
  }
}
