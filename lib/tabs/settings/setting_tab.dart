import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/auth/view/login_Screen.dart';
import 'package:todo_app/comman/app_colors.dart';
import 'package:todo_app/provider/task_provider.dart';
import 'package:todo_app/provider/theme_provide.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvide>(context);
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * .2, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary),
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .12),
              child: DropdownButton<String>(
                padding: const EdgeInsets.only(right: 10, left: 10),
                isExpanded: true,
                elevation: 0,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).primaryColor),
                underline: Container(),
                value: provider.localeCode,
                items: [
                  DropdownMenuItem(
                    value: 'ar',
                    child: Text(AppLocalizations.of(context)!.arabic),
                  ),
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(AppLocalizations.of(context)!.english),
                  )
                ],
                onChanged: (value) => {
                  if (value != null) {provider.ChangeLanguage(value)}
                },
              ),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.mode,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondary),
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .12),
              child: DropdownButton(
                padding: const EdgeInsets.only(right: 10, left: 10),
                isExpanded: true,
                elevation: 0,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).primaryColor),
                underline: Container(),
                value: provider.themeMode == ThemeMode.dark ? 'dark' : 'light',
                items: [
                  DropdownMenuItem(
                      value: 'light',
                      child: Text(AppLocalizations.of(context)!.lighttheme)),
                  DropdownMenuItem(
                      value: 'dark',
                      child: Text(AppLocalizations.of(context)!.darktheme)),
                ],
                onChanged: (value) {
                  if (value != null) {
                    provider.changeTheme(value);
                  }
                },
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Provider.of<TaskProvider>(context, listen: false).tasks.clear();
              Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
            },
            title: Text(
              'Log out',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onPrimary, fontSize: 20),
            ),
            trailing: Icon(Icons.logout,size: 30,color: AppColors.primaryColor,),
          )
        ],
      ),
    );
  }
}
