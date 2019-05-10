//
//  BottomPopup.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import MapKit
import Contacts

class BottomDetailsPopup {
  let shadowView = UIView()
  let window = UIApplication.shared.keyWindow!
  let disposeBag = DisposeBag()
  let animationDuration = 0.5

  var bottomConstraint: NSLayoutConstraint!

  lazy var detailsViewHeight = window.frame.width

  func showPopup(withInfo info: RestInfo, router: ClosestRestsRouter) {
    showShadow()
    showDetails(info: info, router: router)
  }

  func showShadow() {
    shadowView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    shadowView.frame = window.frame
    window.addSubview(shadowView)

    shadowView.rx.tapGesture()
      .when(.recognized)
      .subscribe(onNext: { _ in
        self.bottomConstraint.constant = self.detailsViewHeight
        UIView.animate(withDuration: self.animationDuration) {
          self.shadowView.alpha = 0
          self.shadowView.layoutIfNeeded()
        }
      }).disposed(by: disposeBag)

    shadowView.alpha = 0
    UIView.animate(withDuration: 0.5) {
      self.shadowView.alpha = 1
    }
  }

  func showDetails(info: RestInfo, router: ClosestRestsRouter) {
    guard let restDetailsView = R.nib.restDetailsMapView(owner: nil) else {
      return
    }

    shadowView.subviews.forEach { $0.removeFromSuperview() }
    shadowView.addSubview(restDetailsView)
    setDetailsContraints(restDetailsView: restDetailsView)
    restDetailsView.info = info
    restDetailsView.router = router
  }

  func setDetailsContraints(restDetailsView: UIView) {
    bottomConstraint = restDetailsView.bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: detailsViewHeight)

    restDetailsView.translatesAutoresizingMaskIntoConstraints = false
    restDetailsView.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
    restDetailsView.rightAnchor.constraint(equalTo: window.rightAnchor).isActive = true

    restDetailsView.heightAnchor.constraint(equalToConstant: window.frame.width).isActive = true

    bottomConstraint.isActive = true
    self.shadowView.layoutIfNeeded()
    bottomConstraint.constant = 10

    UIView.animate(withDuration: 0.5) {
      self.shadowView.layoutIfNeeded()
    }
  }
}
