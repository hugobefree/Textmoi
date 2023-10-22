import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:testmoi/outils/Size_Helper.dart';
import 'package:testmoi/themes/color_light.dart';
import 'package:testmoi/utils/data/providers/data_provider.dart';
import 'package:testmoi/utils/data/providers/search_provider.dart';
import 'package:testmoi/utils/Usable/Radieus_Def.dart';
import 'package:testmoi/utils/object/decoration_input.dart';
import 'package:testmoi/widgets/element_resherche.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Consumer2<DataProvider, SearchProvider>(
        builder: (context, dataProvider, searchProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: TextFormField(
                        decoration: inputDecorationGrey(
                            hint: "rechercher une personne",
                            context: context,
                            radius: AppRadius.radius50),
                        onChanged: (value) {
                          searchProvider.setParameter(value);
                          searchProvider.setResults(dataProvider.users
                              .where((user) => user
                                  .toJson()[searchProvider.filter]
                                  .toString()
                                  .toLowerCase()
                                  .contains(
                                      searchProvider.parameter.toLowerCase()))
                              .toList());
                        },
                        initialValue: searchProvider.parameter,
                      ),
                    ),
                
                  ],
                ),
                Gap(Device.getDeviceScreenHeight(context, 90)),
                SizedBox(
                  width: Device.getScreenWidth(context),
                  height: Device.getScreenHeight(context) * 0.65,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (var item in searchProvider.searchResults)
                          SearchCard(user: item)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
