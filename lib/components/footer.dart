import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_common/x_common.dart';

class LinkItem {
  final String title;
  final String url;

  LinkItem({required this.title, required this.url});
}

final _items = <LinkItem>[
  LinkItem(title: '文档', url: ''),
  LinkItem(title: '文章', url: '')
];

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double maxWidth = adaptesPageWidth(constraints);
      return SizedBox(
        width: maxWidth,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: _items
                            .mapIndexed(
                              (item, index) => Row(
                                children: [
                                  Text.rich(TextSpan(text: item.title)),
                                  if (index < _items.length - 1)
                                    const VerticalDivider(),
                                ],
                              ),
                            )
                            .toList()),
                    const Text('Copyright © 2024 kuloud')
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/logo.svg',
                  semanticsLabel: 'Logo',
                  width: 48,
                  height: 48,
                ))
          ],
        ),
      );
    });
  }
}
