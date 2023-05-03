import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ParchApp/theme.dart';
import 'package:ParchApp/views/HomePage/state/homepageStateProvider.dart';

class TopFeaturedList extends StatefulWidget {
  @override
  _TopFeaturedListState createState() => _TopFeaturedListState();
}

class _TopFeaturedListState extends State<TopFeaturedList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: 4),
      padding: EdgeInsets.only(left: 12, right: 12, top: 8),
      height: 60,
      width: size.width,
      child: Consumer<HomePageStateProvider>(
        builder: (context, state, s) {
          return ListView.builder(
              itemCount: state.kTopListLink.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                bool isSelected = index == state.getSelectedTopListIndex();
                return TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Text(state.kTopListLink[index],
                        style: isSelected
                            ? kAppTheme.textTheme.headline4.merge(TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kAppTheme.accentColor))
                            : kAppTheme.textTheme.headline4),
                  ),
                  onPressed: () {
                    state.setSelectedTopListIndex(index);
                  },
                );

                /* return TextButton(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Text(state.kTopListLink[index],
                        style: kAppTheme.textTheme.headline4),
                  ),
                  onPressed: () {
                    
                    print("-------------------AQUI LE OPRIMISTE");
                  },
                ) */
                ;
              });
        },
      ),
    );
  }
}
