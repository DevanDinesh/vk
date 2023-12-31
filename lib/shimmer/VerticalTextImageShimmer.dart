import 'package:flutter/material.dart';
import '../main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class VerticalTextImageShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (_, __) => Shimmer.fromColors(
        highlightColor: appStore.isDarkMode ? Colors.black :Colors.white,
        baseColor: appStore.isDarkMode ? Colors.grey.shade50 : Colors.grey[300]!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: appStore.isDarkMode ? Colors.white10 : Colors.white,
                ),
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: appStore.isDarkMode ? Colors.white10 : Colors.white,
                ).paddingTop(8),
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: appStore.isDarkMode ? Colors.white10 : Colors.white,
                ).paddingTop(8),
                Container(
                  width: double.infinity,
                  height: 16.0,
                  color: appStore.isDarkMode ? Colors.white10 : Colors.white,
                ).paddingTop(8),
              ],
            ).expand(),
            8.width,
            Container(
              width: 130,
              height: 100,
              color: appStore.isDarkMode ? Colors.white10 : Colors.white,
            ).cornerRadiusWithClipRRect(16),
          ],
        ).paddingAll(8),
      ),
    );
  }
}
