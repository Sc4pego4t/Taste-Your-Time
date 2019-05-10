//
//  MainMenuFlow.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import RxFlow

class MainMenuFlow: Flow {
  var root: Presentable {
    return self.rootViewController
  }

  private let rootViewController = UINavigationController()
  
  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AllSteps else { return .none }

    switch step {
      case .recentRest: return .none
      case .closestRests: return navigateToClosestRestsScreen()
      case .foodCountry: return .none
    }
  }

  private func navigateToClosestRestsScreen() -> FlowContributors {
    guard let viewController = R.storyboard.closestRests().instantiateInitialViewController() as? ClosestRestsVC else {
      fatalError(R.string.errors.storyboard())
    }

    self.rootViewController.pushViewController(viewController, animated: true)
    return .one(flowContributor: .contribute(withNextPresentable: viewController, withNextStepper: viewController.viewModel))
  }
}

