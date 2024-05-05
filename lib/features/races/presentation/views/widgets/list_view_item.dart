import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:racemate/features/races/domain/entities/race_entity.dart';

import '../../../../../core/utiles/resources/color_manager.dart';
import '../../../../../core/utiles/resources/style_manager.dart';
import '../../../../../core/utiles/resources/values_manager.dart';
import '../../../../../gen/assets.gen.dart';
import 'package:intl/intl.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({Key? key, required this.race,}) : super(key: key);
  final RaceEntity race;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      child: Container(
        height: AppSize.s200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 5,
              offset: const Offset(0, 4), // changes the position of the shadow
            ),
          ],
          color: const Color(0xffF1F4FD),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2/3,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppSize.s8),bottomLeft: Radius.circular(AppSize.s8)),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset('assets/images/races_images/${race.image}',fit: BoxFit.cover,),
              ),
            ),
            Expanded(
              flex:2,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(Assets.images.rate),
                    const SizedBox(height: AppSize.s10,),
                    Text(race.name,style: FontStyles.getBoldStyle().copyWith(color: ColorManager.primary),maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: AppSize.s10,),
                    Text('Organized by',style: FontStyles.getMediumStyle().copyWith(color: ColorManager.blue3)),
                    Text('Beirut Marathon Association',style: FontStyles.getMediumStyle().copyWith(color: ColorManager.orange1),
                    ),
                    const SizedBox(height: AppSize.s10,),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Row(children: [
                                SvgPicture.asset(Assets.images.route,height: AppSize.s16,width: AppSize.s16),
                                const SizedBox(width: AppSize.s5,),
                                CustomString(data: convertDistances(race.distances),),
                              ],),
                              const SizedBox(height: AppSize.s5,),
                              Row(children: [
                                Icon(Icons.calendar_month,color: ColorManager.blue2,size: AppSize.s16),
                                const SizedBox(width: AppSize.s5,),
                                CustomString(data: convertDate(race.date),),
                              ],),
                              const SizedBox(height: AppSize.s5,),
                              Row(children: [
                                Icon(Icons.location_on,color: ColorManager.blue2,size: AppSize.s16,),
                                const SizedBox(width: AppSize.s5,),
                                CustomString(data: '${race.city}, ${race.country}',),
                              ],),
                            ],),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.share_outlined,color: ColorManager.orange2,size: AppSize.s30,),
                          ),
                        ],),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String convertDate(String dateString){
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('d MMM, yyyy').format(dateTime);
    return formattedDate;
  }

  String convertDistances(String distance){
    List<String> strings = [];
    String newDistance = '';
    strings = distance.split(',');
    for(int i = 0; i<strings.length; i++) {
      if(i != strings.length -1){
        newDistance += '${strings[i]}K, ';
      }
      else{
        newDistance += '${strings[i]}K';
      }
    }
    return newDistance;

  }
}

class CustomString extends StatelessWidget{
  const CustomString({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(data,style: FontStyles.getMediumStyle().copyWith(color: ColorManager.blue1),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}