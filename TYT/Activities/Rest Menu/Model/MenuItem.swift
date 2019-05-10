//
//  MenuItem.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import UIKit

class MenuItem {
  let name: String
  let price: Int
  let image: UIImage?

  public init(name: String,
              price: Int,
              image: UIImage?) {
    self.name = name
    self.price = price
    self.image = image
  }
}
