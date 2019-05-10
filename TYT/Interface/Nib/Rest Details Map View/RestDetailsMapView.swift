//
//  RestDetailsMapView.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class RestDetailsMapView: UIView {
  @IBOutlet weak var restImageView: UIImageView!
  let roundCornerRadius: CGFloat = 10

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!

  weak var router: ClosestRestsRouter!

  @IBAction func makeRouteClicked(_ sender: Any) {
    router.go(toRoute: .showRouteOnMap, withInfo: info)
  }

  @IBAction func moreInfoClicked(_ sender: Any) {
    router.go(toRoute: .moreInfo, withInfo: info)
  }

  var info: RestInfo! {
    didSet {
      self.nameLabel.text = info.name
      self.addressLabel.text = info.address
      self.restImageView.image = info.image
    }
  }

  override func awakeFromNib() {
    self.layer.cornerRadius = roundCornerRadius
    self.clipsToBounds = true
  }
}
