//
//  MainMenuRouter.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation

enum MainRouteEnum {
  case closestRests, foodCountry, recent
}

class MainMenuRouter: Router {

  weak var viewController: MainVC!

  func attach(viewController: MainVC) {
    self.viewController = viewController
  }

  func go(toRoute route: MainRouteEnum) {
    switch route {
    case .closestRests:
      guard let closestRestsVC = R.storyboard.closestRests().instantiateInitialViewController() else {
        fatalError(R.string.errors.storyboard())
      }

      viewController.navigationController?.pushViewController(closestRestsVC, animated: true)
    default:
      break
    }
  }
}
