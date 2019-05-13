//
//  Routable.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation

protocol Routable {
  associatedtype RouterType: Router
  var router: RouterType { get set }
}
