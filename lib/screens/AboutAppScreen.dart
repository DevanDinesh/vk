import 'package:flutter/material.dart';
import '../../../utils/Colors.dart';
import '../../../utils/Common.dart';
import '../../../utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:package_info/package_info.dart';

import '../AppLocalizations.dart';

class AboutAppScreen extends StatelessWidget {
  static String tag = '/AboutAppScreen';

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context)!;

    return SafeArea(
      top: !isIOS ? true : false,
      child: Scaffold(
        appBar: appBarWidget('About', showBack: true, color: getAppBarWidgetBackGroundColor(), textColor: getAppBarWidgetTextColor()),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(mAppName, style: primaryTextStyle(size: 30)),
              16.height,
              Container(
                decoration: BoxDecoration(color: colorPrimary, borderRadius: radius(4)),
                height: 4,
                width: 100,
              ),
              16.height,
              Text(appLocalization.translate('version'), style: secondaryTextStyle()),
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    return Text('${snap.data!.version.validate()}', style: primaryTextStyle());
                  }
                  return SizedBox();
                },
              ),
              16.height.visible(getStringAsync(LAST_UPDATE_DATE).isNotEmpty),
             ///TODO add key
              Text('Last Update', style: secondaryTextStyle()).visible(getStringAsync(LAST_UPDATE_DATE).isNotEmpty),
              Text(getStringAsync(LAST_UPDATE_DATE), style: primaryTextStyle()),
              16.height.visible(getStringAsync(LAST_UPDATE_DATE).isNotEmpty),
              ///TODO add key
              Text('News Source', style: secondaryTextStyle()),
              Text(newSource, style: primaryTextStyle(color: colorPrimary)).onTap(() {
                launchUrls(newSource, forceWebView: true);
              }),
              16.height,
              Text(aboutUsText, style: primaryTextStyle(size: 14), textAlign: TextAlign.justify),
              16.height,
              GestureDetector(
                onTap: () async {
                  await launchUrls('mailto:${getStringAsync(CONTACT_PREF)}');
                },
                child: Text('Reach us: ${getStringAsync(CONTACT_PREF)}', style: primaryTextStyle(color: colorPrimary)),
              ),
              16.height,
              GestureDetector(
                onTap: () async {
                  await launchUrls('tel:$contactUS');
                },
                child: Text('Call us: $contactUS', style: primaryTextStyle(color: colorPrimary)),
              ),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
