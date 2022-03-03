import 'package:flutter/material.dart';

import '../utils/styles.dart';

class SubHeading extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const SubHeading({
    required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        (onTap != null)
            ? InkWell(
                onTap: onTap,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
