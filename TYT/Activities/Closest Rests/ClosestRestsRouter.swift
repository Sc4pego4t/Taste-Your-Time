//
//  ClosestRestsRouter.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import MapKit
import Contacts

enum ClosestRestsRouteEnum {
  case showRouteOnMap, moreInfo
}

class ClosestRestsRouter: Router {
  var viewController: ClosestRestsVC!

  func attach(viewController: ClosestRestsVC) {
    self.viewController = viewController
  }

  func go(toRoute route: ClosestRestsRouteEnum, withInfo info: RestInfo) {
    switch route {
    case .showRouteOnMap:
      showSystemMap(info: info)
    default:
      break
    }
  }

  func showSystemMap(info: RestInfo) {
    let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
    getMapItem(info: info).openInMaps(launchOptions: launchOptions)
  }

  func getMapItem(info: RestInfo) -> MKMapItem {
    let location = info.getCoordinate()

    let addressDict = [CNPostalAddressStreetKey: info.address]
    let placemark = MKPlacemark(coordinate: location, addressDictionary: addressDict)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = info.name
    return mapItem
  }
}
