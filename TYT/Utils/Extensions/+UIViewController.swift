//
//  +UIViewController.swift
//  TYT
//
//  Created by Андрей Глухих on 26/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit
extension UIViewController {
	func setupNavigationBar(isBlack: Bool = false,
													doHide: Bool = false) {
		
		guard let navBar = navigationController?.navigationBar else { return }
		navBar.barStyle = isBlack ? .default : .black
		
		if navBar.isHidden != doHide {
			navBar.isHidden = doHide
			let oldAlpha = navBar.alpha
			navBar.alpha = doHide == false ? 0 : 1
			
			UIView.animate(withDuration: 0.5) {
				navBar.alpha = oldAlpha
			}
		}
	}
}
