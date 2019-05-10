//
//  ViewController.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture

class MainVC: UIViewController, ViewModelBased, Routable {

  var viewModel = MainMenuViewModel()
  var router = MainMenuRouter()
  @IBOutlet weak var mainMenuTV: UITableView!

  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    router.attach(viewController: self)
    setupBindings()
    viewModel.requestData()
    mainMenuTV.rowHeight = ImageMenuTVCell.cellHeight
    mainMenuTV.separatorStyle = .none
  }

  func setupBindings() {
    let cellID = R.reuseIdentifier.mainMenuCell.identifier

    mainMenuTV.register(UINib(resource: R.nib.imageMenuTVCell), forCellReuseIdentifier: cellID)
    print("Cell created")

    viewModel.menuItems.bind(to: mainMenuTV.rx.items(cellIdentifier: cellID, cellType: ImageMenuTVCell.self)) { (_, item, cell) in
      cell.menuItem = item
      cell.viewContainer.rx.tapGesture()
        .when(.recognized)
        .subscribe (onNext: { _ in
          print(item)
          self.router.go(toRoute: .closestRests)
        }).disposed(by: self.disposeBag)

    }.disposed(by: disposeBag)

  }

}
