import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollController = ScrollController();
  final double itemSize = 200.0;

  void onListenerController() {
    setState(() {});
  }

  @override
  void initState() {
    scrollController.addListener(onListenerController);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(onListenerController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: 20,
              controller: scrollController,
              itemBuilder: (context, index) {
                final itemOffset = index * itemSize;
                final diference = scrollController.offset - itemOffset;
                final percent = 1 - (diference / (itemSize / 2));
                double opacity = percent;
                double scale = percent;
                if (opacity > 1.0) opacity = 1.0;
                if (opacity < 0.0) opacity = 0.0;
                if (scale > 1.0) scale = 1.0;
                return Opacity(
                  opacity: opacity,
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()..scale(scale),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(4),
                      height: itemSize,
                      decoration: BoxDecoration(
                          color: const Color(0xFF08CD33),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [BoxShadow(color: Colors.black87, blurRadius: 2, spreadRadius: 2)]),
                      child: Center(
                          child: Text(
                        '$index',
                        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 100,
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.white, Colors.transparent])),
          )
        ],
      ),
    );
  }
}
