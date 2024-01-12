
import 'package:flutter/material.dart';

import '../../config/function_utils.dart';

class PaginationBody extends StatefulWidget {
  const PaginationBody({
    super.key,
    this.child,
    this.offsetPage = 0,
    required this.onEndPage,
  }) : assert(child != null);

  final Widget? child;
  final int offsetPage;
  final Future Function() onEndPage;

  @override
  State<PaginationBody> createState() => _PaginationBodyState();
}

class _PaginationBodyState extends State<PaginationBody> {
  late ScrollController scrollController;
  // final myController = Get.find<FeedController>();

  bool isCalled = false;
  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    // myController.shouldScrollToTop.value = false;
  }

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(
        () {
          var offset = scrollController.position.maxScrollExtent - widget.offsetPage;
          if (scrollController.position.pixels >= offset) {
            if (!isCalled) {
              logKey('body position masuk', true);
              isCalled = true;
              setState(() {});
              widget.onEndPage().then((_) {
                isCalled = false;
                setState(() {});
              });
            }
          }
          // if (myController.shouldScrollToTop.value) {
          //   log('masukk suruh scroll ga?');
          //   scrollToTop();
          //   // Setel kembali kondisi di MyController setelah dijalankan
          //   // myController.shouldScrollToTop.value = false;
          // }
        },
      );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: widget.child,
    );
  }
}
