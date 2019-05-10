//
//  RestMapAnnotationView.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import MapKit

class RestMapAnnotationView: MKMarkerAnnotationView {

  internal override var annotation: MKAnnotation? {
    willSet {
      newValue.flatMap(configure(with:))
    }
  }
}

private extension RestMapAnnotationView {
  func configure(with annotation: MKAnnotation) {
    guard annotation is RestMapPointAnnotation else {
      fatalError("Unexpected markerTintColor = .purple")
    }
    glyphImage = R.image.food()?.imageWithInsets(insetDimen: 6)
    markerTintColor = ColorPalette.tint
    clusteringIdentifier = String(describing: RestMapAnnotationView.self)
  }
}
