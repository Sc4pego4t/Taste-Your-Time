//
//  MainMenuVM.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainMenuViewModel: ViewModel {

  public let menuItems = PublishSubject<[MainMenuItem]>()

  public func requestData() {
    let menuItems = [
      MainMenuItem(image: R.image.elrest(),
                   mainText: R.string.localizable.recent(),
                   secondaryText: R.string.localizable.seeMenu(),
                   type: .recent),
      MainMenuItem(image: R.image.near(),
                   mainText: R.string.localizable.closestRests(),
                   secondaryText: R.string.localizable.seeOnMap(),
                   type: .closestRests),
      MainMenuItem(image: R.image.ital(),
                   mainText: R.string.localizable.italyFood()),
      MainMenuItem(image: R.image.fran(),
                   mainText: R.string.localizable.franceFood()),
      MainMenuItem(image: R.image.ital(),
                   mainText: R.string.localizable.japanFood())
    ]
    
    self.menuItems.onNext(menuItems)
  }

}
