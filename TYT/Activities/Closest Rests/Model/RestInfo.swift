//
//  RestInfo.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit
struct RestInfo {
  let lat: Double
  let long: Double
  let name: String
  let description: String
  let address: String
  let image: UIImage?

  public init(lat: Double,
              long: Double,
              name: String,
              description: String,
              address: String,
              image: UIImage?) {
    self.lat = lat
    self.long = long
    self.name = name
    self.description = description
    self.address = address
    self.image = image
  }

  func getCoordinate() -> CLLocationCoordinate2D {
    return CLLocationCoordinate2D(latitude: lat, longitude: long)
  }
}
