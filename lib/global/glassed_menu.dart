import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

/// @author mmunkhsuld

class MenuItem {
  String image;
  String? name;

  MenuItem({required this.image, this.name});
}

class GlassedMenu extends StatelessWidget {
  const GlassedMenu({super.key, required this.items, this.onTabSelected, required this.selectedTabIndex});

  final List<MenuItem> items;
  final Function? onTabSelected;
  final int selectedTabIndex;

  _updateIndex(int index) {
    onTabSelected!(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabItems = List.generate(items.length, (index) => _buildTab(index, context));
    return Row(
      children: [
        const Spacer(),
        Material(
          color: Colors.white.withOpacity(0.5),
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          ),
          elevation: 2,
          child: Container(
            height: 64,
            color: Colors.white.withOpacity(0.5),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: DefaultTabController(
                length: tabItems.length,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  isScrollable: true,
                  indicator: CustomTabIndicator(),
                  tabs: tabItems,
                  indicatorPadding: const EdgeInsets.all(0),
                  dividerColor: Colors.transparent,
                  padding: const EdgeInsets.all(8),
                  onTap: (index) {
                    _updateIndex(index);
                  },
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }

  Widget _buildTab(int index, BuildContext context) {
    return index == selectedTabIndex
        ? Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/icons/${items[index].image}",
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
                const SizedBox(width: 4),
                Text(
                  items[index].name!,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.white),
                )
              ],
            ),
          )
        : Tab(
            child: SvgPicture.asset(
              "assets/icons/${items[index].image}",
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(AppColors.black, BlendMode.srcIn),
            ),
          );
  }
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CustomPainter(this, onChanged!);
  }
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;

    final Paint paint = Paint();
    paint.color = AppColors.primary900;
    paint.style = PaintingStyle.fill;

    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(AppSizes.borderRadius)), paint);
  }
}
