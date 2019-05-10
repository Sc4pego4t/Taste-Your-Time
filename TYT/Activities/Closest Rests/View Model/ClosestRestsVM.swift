//
//  ClosestRestsVM.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import MapKit

class ClosestRestsVM: ViewModel {
  let restInfoList = PublishSubject<[RestInfo]>()
  let pins = PublishSubject<[MKPointAnnotation]>()

  func requestData() {

    let restInfoList = [RestInfo(lat: 59.93, long: 30.33,
                                 name: "Палкин",
                                 description: "Ресторан",
                                 address: "Невский пр., 47, Санкт-Петербург, 191025",
                                 image: R.image.palkin()),
                        RestInfo(lat: 59.73, long: 30.43,
                                 name: "Ель",
                                 description: "Ресторан",
                                 address: "Приморское ш., 640А, лит. А, Санкт-Петербург, 197720",
                                 image: R.image.elrest()),
                        RestInfo(lat: 59.53, long: 30.13,
                                 name: "Максим",
                                 description: "Ресторан",
                                 address: "440-А, Приморское ш., Репино, Санкт-Петербург, 197738",
                                 image: R.image.maxim())]
    self.restInfoList.onNext(restInfoList)

  }
}
