//
//  RestMenuTVC.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit
import RxSwift

class RestMenuTVC: UITableViewCell {

  @IBOutlet weak var collectionViewFlow: UICollectionViewFlowLayout!
  @IBOutlet weak var headerLabel: UILabel!
  @IBOutlet weak var itemsCollectionView: UICollectionView!

  let menuItems = PublishSubject<[MenuItem]>()
  let disposeBag = DisposeBag()

  var menu: Menu! {
    didSet {
      headerLabel.text = menu.menuType
      menuItems.onNext(menu.menu)
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    setupBinding()
    collectionViewFlow.itemSize = CGSize(width: 200, height: 250)
  }

  func setupBinding() {
    let cellID = R.reuseIdentifier.restMenuCVC.identifier

    itemsCollectionView.register(UINib(resource: R.nib.restMenuCVC), forCellWithReuseIdentifier: cellID)

    menuItems.bind(to: itemsCollectionView.rx.items(cellIdentifier: cellID, cellType: RestMenuCVC.self)) { _, menuItem, cell in
      cell.menuItem = menuItem
      cell.createGradientMask()
    }.disposed(by: disposeBag)
  }
  
}
