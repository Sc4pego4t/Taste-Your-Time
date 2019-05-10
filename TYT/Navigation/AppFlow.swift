//
//  AppFlow.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import UIKit
import RxFlow
import RxCocoa
import RxSwift

class AppFlow: Flow {
  var root: Presentable {
    return self.rootViewController
  }

  private lazy var rootViewController: UINavigationController = {
    let viewController = UINavigationController()
    viewController.setNavigationBarHidden(true, animated: false)
    return viewController
  }()

  deinit {
    print("\(type(of: self)): \(#function)")
  }

  func navigate(to step: Step) -> FlowContributors {
    guard let step = step as? AllSteps else { return .none }

    switch step {
    case .dashboardIsRequired:
      return navigationToDashboardScreen()
    case .onboardingIsRequired:
      return navigationToOnboardingScreen()
    case .onboardingIsComplete:
      return self.dismissOnboarding()
    default:
      return .none
    }
  }

  private func navigationToDashboardScreen() -> FlowContributors {

    let dashboardFlow = DashboardFlow(withServices: self.services)

    Flows.whenReady(flow1: dashboardFlow) { [unowned self] root in
      self.rootViewController.pushViewController(root, animated: false)
    }

    return .one(flowContributor: .contribute(withNextPresentable: dashboardFlow,
                                             withNextStepper: OneStepper(withSingleStep: DemoStep.dashboardIsRequired)))
  }

  private func navigationToOnboardingScreen() -> FlowContributors {

    let onboardingFlow = OnboardingFlow(withServices: self.services)

    Flows.whenReady(flow1: onboardingFlow) { [unowned self] root in
      DispatchQueue.main.async {
        self.rootViewController.present(root, animated: true)
      }
    }

    return .one(flowContributor: .contribute(withNextPresentable: onboardingFlow,
                                             withNextStepper: OneStepper(withSingleStep: DemoStep.loginIsRequired)))
  }

  private func dismissOnboarding() -> FlowContributors {
    if let onboardingViewController = self.rootViewController.presentedViewController {
      onboardingViewController.dismiss(animated: true)
    }
    return .none
  }
}

class AppStepper: Stepper {

  let steps = PublishRelay<Step>()
  private let disposeBag = DisposeBag()

  /// callback used to emit steps once the FlowCoordinator is ready to listen to them to contribute to the Flow
  func readyToEmitSteps() {
    self.appServices
      .preferencesService.rx
      .isOnboarded
      .map { $0 ? DemoStep.onboardingIsComplete : DemoStep.onboardingIsRequired }
      .bind(to: self.steps)
      .disposed(by: self.disposeBag)
  }
}
