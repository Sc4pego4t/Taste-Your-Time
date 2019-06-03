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
import Hero

class RestMenuVC: UIViewController, ViewModelBased {
  
  var viewModel = RestMenuVM()
  var disposeBag = DisposeBag()
	
	@IBOutlet weak var tableViewHeight: NSLayoutConstraint!
	@IBOutlet weak var imageViewTopOffset: NSLayoutConstraint!
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var imageViewHeight: NSLayoutConstraint!
	@IBOutlet weak var imageViewBottomOffset: NSLayoutConstraint!
	let imageViewAspectRatio: CGFloat = 1 / 2
	
	lazy var computedImageViewHeight = {
		return imageViewAspectRatio * imageView.frame.width
	} ()
	
	var heroID: String!
	var image: UIImage!
//  var addToCardPopup = AddToCartBottomPopup(
//    dialogView: R.nib.addToCartDialog(owner: nil),
//    dialogHeight: AddToCartDialog.dialogHeight)

  @IBOutlet weak var menuTableView: UITableView!
	
	let rowHeight: CGFloat = 300
	
	override func viewDidLoad() {
    super.viewDidLoad()
    setupBinding()
    viewModel.requestData()
    menuTableView.rowHeight = rowHeight
    menuTableView.separatorStyle = .none
		
		setupViews()
  }

	fileprivate func setupViews() {
		
		imageView.hero.id = heroID
		imageView.image = image
		setupNavigationBar(isBlack: false, doHide: true)
		imageViewTopOffset.constant = -UIApplication.shared.statusBarFrame.height
		imageViewHeight.constant = imageView.frame.width * imageViewAspectRatio
		
	}

	func setupBinding() {
    let cellID = R.reuseIdentifier.restMenuCell.identifier

    menuTableView.register(UINib(resource: R.nib.restMenuTVC), forCellReuseIdentifier: cellID)

    viewModel.fullMenu.bind(to: menuTableView.rx.items(cellIdentifier: cellID, cellType: RestMenuTVC.self)) { _, menu, cell in
      cell.menu = menu
    }.disposed(by: disposeBag)
		
		// resize table to fit content
		viewModel.fullMenu.bind(onNext: { menu in
			self.tableViewHeight.constant = CGFloat(menu.count) * self.rowHeight
		}).disposed(by: disposeBag)
		
		// Make view swipeable to return back
		view.rx.panGesture(configuration: { _, delegate in
			delegate.simultaneousRecognitionPolicy = .never
		})
			.when(.began, .changed, .cancelled, .ended)
			.subscribe(onNext: { recognizer in
				self.onPanGesture(recognizer)
			}).disposed(by: disposeBag)
		
		// Change imageView contraints on scroll event
		scrollView.rx.didScroll.subscribe(onNext: { _ in
			let scrolledOffset = self.scrollView.contentOffset.y

			if scrolledOffset < 0 {
				self.imageViewTopOffset.constant = scrolledOffset
				self.imageViewHeight.constant = self.computedImageViewHeight - scrolledOffset
			} else {
				self.imageViewTopOffset.constant = scrolledOffset
				self.imageViewHeight.constant = self.computedImageViewHeight - scrolledOffset
			}
		}).disposed(by: disposeBag)
  }
	
	@objc func onPanGesture(_ recognizer: UIPanGestureRecognizer) {
		let translation = recognizer.translation(in: nil)
		print(#function, recognizer.state, translation.x)
		var progress: CGFloat = 0
		var xTranslation: CGFloat = 0
		
		if translation.x > 0 {
			progress = translation.x / (imageView.bounds.width / 4 * 3)
			xTranslation = translation.x
		}
		
		switch recognizer.state {
		case .began:
			hero.dismissViewController()
		case .changed:
			print(Hero.shared.isTransitioning)
			Hero.shared.update(progress)
			Hero.shared.apply(modifiers: [.translate(x: xTranslation, y: 0, z: 0)], to: view)
		default:
			if progress + recognizer.velocity(in: nil).x / view.bounds.height > 0.3 {
				Hero.shared.finish()
			} else {
				Hero.shared.cancel()
			}
		}
	}
}
