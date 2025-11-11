import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/app_theme.dart';

//정렬 버튼 위젯
class SortBtn extends ConsumerWidget {
  final bool btnOn;
  final String text;
  final Function(WidgetRef ref) onTap;
  const SortBtn({
    super.key,
    required this.btnOn,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onTap(ref),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.2,
            color: btnOn ? vrc(context).blackVSwhite! : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
