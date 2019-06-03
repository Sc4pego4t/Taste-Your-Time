//
//  MainMenuRouter.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import UIKit
import Hero

enum MainRouteEnum {
  case closestRests, foodCountry, recent
}

class MainMenuRouter: Router {

  weak var viewController: MainVC!

  func attach(viewController: MainVC) {
    self.viewController = viewController
  }

	func go(toRoute route: MainRouteEnum, withImage image: UIImage? = nil) {
    switch route {
    case .recent:
      guard let restMenuVC = R.storyboard.restMenu().instantiateInitialViewController() as? RestMenuVC else {
        fatalError(R.string.errors.storyboard())
      }
			
			restMenuVC.heroID = R.string.iDs.heroID()
			restMenuVC.image = image
      viewController.navigationController?.pushViewController(restMenuVC, animated: true)
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
