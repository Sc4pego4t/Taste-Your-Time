//
//  Menu.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
class Menu {
  let menu: [MenuItem]
  let menuType: String

  public init(menu: [MenuItem],
              menuType: String) {
    self.menu = menu
    self.menuType = menuType
  }
}
