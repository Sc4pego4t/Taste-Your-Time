//
//  MainMenuItems.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import UIKit

struct MainMenuItem {
  let image: UIImage?
  let mainText: String
  let secondaryText: String
  let type: MenuItemTypes

  public init(image: UIImage?,
              mainText: String,
              secondaryText: String = "",
              type: MenuItemTypes = .foodCountry) {
    self.image = image
    self.mainText = mainText
    self.secondaryText = secondaryText
    self.type = type
  }

}
