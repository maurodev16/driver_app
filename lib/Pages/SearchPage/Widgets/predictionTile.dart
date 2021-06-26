import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rider_app/Controllers/googleMapsController.dart';
import 'package:rider_app/Models/PlacePrediction/placePrediction.dart';

class PredictionTile extends StatelessWidget {
  final PlacePredictionModel placePredictionModel;
  PredictionTile({Key key, this.placePredictionModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GoogleMapsController>(builder: (_searchController) {
      return TextButton(
        onPressed: () {
          _searchController
              .getPlaceAddressDetails(placePredictionModel.placeId);
        },
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.pin_drop),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${placePredictionModel.mainText}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16)),
                        SizedBox(height: 3),
                        Text("${placePredictionModel.secondaryText}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 10)
            ],
          ),
        ),
      );
    });
  }
}
