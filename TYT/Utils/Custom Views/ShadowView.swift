//
//  ShadowVie.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit

class ShadowView: LightView {

  func setShadow(shadowColor: CGColor = UIColor.black.cgColor,
                 shadowOffset: CGSize = CGSize(width: 0, height: 3.0),
                 shadowOpacity: Float = 0.4,
                 shadowRadius: CGFloat) {
    self.layer.shadowColor = shadowColor
    self.layer.shadowOffset = shadowOffset
    self.layer.shadowRadius = shadowRadius
    self.layer.shadowOpacity = shadowOpacity
  }

  /*
   once the bounds of the drop shadow view (container view) is initialized,
   the bounds variable value will be set/updated and the
   setupShadow method will run
   */
  override var bounds: CGRect {
    didSet {
      setupShadowPath()
    }
  }

  private func setupShadowPath() {
    self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.layer.cornerRadius).cgPath

    // further optimization by rasterizing the container view and its shadow into bitmap instead of dynamically rendering it every time
    // take note that the rasterized bitmap will be saved into memory and it might take quite some memory if you have many cells

     self.layer.shouldRasterize = true
     self.layer.rasterizationScale = UIScreen.main.scale
  }

}
