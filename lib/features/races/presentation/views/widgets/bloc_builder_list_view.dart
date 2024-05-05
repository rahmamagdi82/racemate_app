import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:racemate/core/utiles/resources/color_manager.dart';
import 'package:racemate/core/utiles/resources/style_manager.dart';

import '../../controllers/get_races_cubit.dart';
import 'list_view_item.dart';

class BlocBuilderListView extends StatefulWidget {
  const BlocBuilderListView({Key? key}) : super(key: key);

  @override
  State<BlocBuilderListView> createState() => _BlocBuilderListViewState();
}

class _BlocBuilderListViewState extends State<BlocBuilderListView> {
  final ScrollController _scrollController = ScrollController();
  int page = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        page++ ;
        BlocProvider.of<GetRacesCubit>(context).getRaces(page);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRacesCubit,GetRacesState>(
      builder: (context,state){
      if(state is GetRacesSuccess){
        if(state.races.isEmpty){
          return Text('No results found',style: FontStyles.getMediumStyle().copyWith(color: ColorManager.blue3),);
        }
        else{
          return Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: state.races.length,
                itemBuilder: (context,index){return ListViewItem(race: state.races[index],);}),
          );
        }
      }
      else if(state is GetRacesFailed){
        return Text(state.message);
      }
      else{
        return const CircularProgressIndicator();
      }
    },
    );
  }
}
