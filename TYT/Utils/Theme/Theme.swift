//
//  Theme.swift
//  TYT
//
//  Created by Андрей Глухих on 02/06/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import UIKit
enum Theme: Int {
	
	case dark, light
	
	var tintColor: UIColor {
		return .tint()
	}
	
	//Customizing the Navigation Bar
	var barStyle: UIBarStyle {
		return .black
	}
	
	var backgroundColor: UIColor {
		return .background()
	}
	
	var secondaryColor: UIColor {
		return .secondary()
	}
	
	var titleTextColor: UIColor {
		return .white
	}
	var subtitleTextColor: UIColor {
		return .white
	}
}
