//
//  RestMenuVC.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class RestMenuVC: UIViewController, ViewModelBased {

  var viewModel = RestMenuVM()
  var disposeBag = DisposeBag()
  @IBOutlet weak var menuTableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    setupBinding()
    viewModel.requestData()
    menuTableView.rowHeight = 300
    menuTableView.separatorStyle = .none
  }

  func setupBinding() {
    let cellID = R.reuseIdentifier.restMenuCell.identifier

    menuTableView.register(UINib(resource: R.nib.restMenuTVC), forCellReuseIdentifier: cellID)

    viewModel.fullMenu.bind(to: menuTableView.rx.items(cellIdentifier: cellID, cellType: RestMenuTVC.self)) { _, menu, cell in
      cell.menu = menu
    }.disposed(by: disposeBag)
    
  }
}
