//
//  StarViewContainer.swift
//  TYT
//
//  Created by Андрей Глухих on 26/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit

@IBDesignable class StarViewContainer: UIView {
	
	var view: UIView!
	override init(frame: CGRect) {
		super.init(frame: frame)
		commonInit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		commonInit()
	}
	
	private func commonInit() {
		view = R.nib.starViewContainer(owner: nil)
		view.frame = bounds
		view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		
		addSubview(view)
	}
}
