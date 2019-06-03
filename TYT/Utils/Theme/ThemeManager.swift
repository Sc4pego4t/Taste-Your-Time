//
//  ThemeManager.swift
//  TYT
//
//  Created by Андрей Глухих on 02/06/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import Foundation
import UIKit

class ThemeManager {
	
	// ThemeManager
	static func currentTheme() -> Theme {
		return .dark
	}
	
	static func applyTheme(theme: Theme) {
		
		// You get your current (selected) theme and apply the main color to the tintColor property of your application’s window.
		let sharedApplication = UIApplication.shared
		sharedApplication.delegate?.window??.tintColor = theme.tintColor
		
		UINavigationBar.appearance().barStyle = theme.barStyle
		UINavigationBar.appearance().tintColor = theme.tintColor
		UINavigationBar.appearance().barTintColor = theme.secondaryColor
		
		UITabBar.appearance().barStyle = theme.barStyle
		
//		UISwitch.appearance().onTintColor = theme.mainColor.withAlphaComponent(0.3)
//		UISwitch.appearance().thumbTintColor = theme.backgroundColor
		
		UITableViewCell.appearance().backgroundColor = theme.backgroundColor
		UIScrollView.appearance().backgroundColor = theme.backgroundColor
		UICollectionViewCell.appearance().backgroundColor = theme.backgroundColor
		
		DarkView.appearance().backgroundColor = theme.backgroundColor
		LightView.appearance().backgroundColor = theme.secondaryColor
	}
}
