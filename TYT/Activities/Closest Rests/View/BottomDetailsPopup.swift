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

class BottomDetailsPopup: BottomPopup<RestDetailsMapView> {

  func showPopup(with restInfo: RestInfo, router: ClosestRestsRouter) {
    self.showPopup()
    dialogView.info = restInfo
    dialogView.router = router
  }

}
