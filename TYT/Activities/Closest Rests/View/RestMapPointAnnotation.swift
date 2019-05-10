//
//  RestMapPointAnnotation.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import MapKit
class RestMapPointAnnotation: MKPointAnnotation {
  var pinImage: UIImage? = R.image.pin()

  var restInfo: RestInfo! {
    didSet {
      self.coordinate = restInfo.getCoordinate()
      self.title = restInfo.name
    }
  }
}
