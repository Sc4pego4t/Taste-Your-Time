//
//  RoundShadowButton.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import UIKit
class RoundShadowButton: UIButton {
  override func layoutSubviews() {
    super.layoutSubviews()

    let radius: CGFloat = self.bounds.size.width / 2.0
    self.layer.cornerRadius = radius

    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
    self.layer.shadowRadius = 4
    self.layer.shadowOpacity = 0.6
  }
}
