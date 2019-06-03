//
//  RestMenuVM.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import RxSwift
class RestMenuVM: ViewModel {

  var fullMenu = PublishSubject<[Menu]>()

  func requestData() {
    let fullMenu  = [
      Menu(
        menu: [
          MenuItem(name: "Стэйк Денвер", price: 1700, image: R.image.steikdenver()),
          MenuItem(name: "Фуагра", price: 1250, image: R.image.fuagra()),
          MenuItem(name: "Борщ", price: 600, image: R.image.borsh()),
          MenuItem(name: "Ризотто", price: 840, image: R.image.rezoto()),
          MenuItem(name: "Спагетти", price: 770, image: R.image.spagetti())
        ], menuType: "Горячие Блюда"),
      Menu(
        menu: [
          MenuItem(name: "Греческий Салат", price: 720, image: R.image.greek()),
          MenuItem(name: "Цезарь", price: 760, image: R.image.zezar()),
          MenuItem(name: "Салат с Лососем", price: 860, image: R.image.losos())
        ], menuType: "Холодные блюда"),
			Menu(
				menu: [
					MenuItem(name: "Греческий Салат", price: 720, image: R.image.greek()),
					MenuItem(name: "Цезарь", price: 760, image: R.image.zezar()),
					MenuItem(name: "Салат с Лососем", price: 860, image: R.image.losos())
				], menuType: "Холодные блюда")
    ]
    self.fullMenu.onNext(fullMenu)
  }

}
