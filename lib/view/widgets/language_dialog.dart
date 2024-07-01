import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onyx_delivery/model/services/localization/app_language.dart';
import 'package:onyx_delivery/model/services/router/nav_service.dart';
import 'package:onyx_delivery/model/services/theme/app_colors.dart';
import 'package:onyx_delivery/view/widgets/main_button.dart';
import 'package:provider/provider.dart';

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguage>(context);
    String langName = appLanguage.getLanguageName();
    String selectedLang = langName;
    return StatefulBuilder(
      builder: (context, builderSetstate) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Choose Language",
                  style: TextStyle(fontWeight: FontWeight.w800, color: AppColors.primaryColor),
                ).localize(context),
                const SizedBox(height: 20),
                Row(
                  children: [
                    LanguageButton(
                      selectedLang: langName,
                      flag: "assets/svgs/flag_arabic.svg",
                      language1: "العَرَبِيَّة",
                      language2: "Arabic",
                      onTap: () {
                        langName = "العَرَبِيَّة";
                        selectedLang = langName;
                        builderSetstate(() {});
                      },
                    ),
                    const SizedBox(width: 10),
                    LanguageButton(
                      selectedLang: langName,
                      flag: "assets/svgs/flag_english.svg",
                      language1: "English",
                      language2: "English",
                      onTap: () {
                        langName = "English";
                        selectedLang = langName;
                        builderSetstate(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                MainButton(
                  radius: 12,
                  height: 44,
                  width: double.infinity,
                  title: "Apply",
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  onPressed: () {
                    appLanguage.changeLanguageByName(languageName: selectedLang);
                    NavService().popKey();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    required this.selectedLang,
    required this.flag,
    required this.language1,
    required this.language2,
    this.onTap,
    super.key,
  });

  final String selectedLang;
  final String flag;
  final String language1;
  final String language2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isActive = language1 == selectedLang;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color: isActive ? AppColors.greenLightColor : null,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isActive ? AppColors.greenColor : AppColors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(flag),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    language1,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    language2,
                    style: const TextStyle(fontSize: 12, height: 0),
                  ),
                ],
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
