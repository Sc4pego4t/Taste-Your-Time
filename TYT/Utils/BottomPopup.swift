//
//  BottomPopup.swift
//  TYT
//
//  Created by Андрей Глухих on 12/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class BottomPopup<DialogType: UIView> {
  let shadowView = UIView()
  let window = UIApplication.shared.keyWindow!
  let disposeBag = DisposeBag()
  let animationDuration = 0.5

  var bottomConstraint: NSLayoutConstraint!
  let dialogHeight: CGFloat
  var cornerRadius:CGFloat = 10

  let dialogView: DialogType

  init(dialogView: DialogType?, dialogHeight: CGFloat) {
    guard let dialogView = dialogView else {
      fatalError(R.string.errors.view())
    }

    self.dialogView = dialogView
    self.dialogHeight = dialogHeight
  }

  func showPopup() {
    showShadow()
    showDetails()
  }

  func showShadow() {
    shadowView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    shadowView.frame = window.frame
    window.addSubview(shadowView)

    shadowView.rx.tapGesture()
      .when(.recognized)
      .subscribe(onNext: { _ in
        self.bottomConstraint.constant = self.dialogHeight
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

  func showDetails() {

    shadowView.subviews.forEach { $0.removeFromSuperview() }
    shadowView.addSubview(dialogView)
    setDetailsContraints(dialogView: dialogView)
  }

  func setDetailsContraints(dialogView: UIView) {
    bottomConstraint = dialogView.bottomAnchor.constraint(equalTo: window.bottomAnchor, constant: dialogHeight)

    dialogView.translatesAutoresizingMaskIntoConstraints = false
    dialogView.leftAnchor.constraint(equalTo: window.leftAnchor).isActive = true
    dialogView.rightAnchor.constraint(equalTo: window.rightAnchor).isActive = true

    dialogView.heightAnchor.constraint(equalToConstant: window.frame.width).isActive = true

    bottomConstraint.isActive = true
    self.shadowView.layoutIfNeeded()
    bottomConstraint.constant = cornerRadius

    UIView.animate(withDuration: 0.5) {
      self.shadowView.layoutIfNeeded()
    }
  }
}
