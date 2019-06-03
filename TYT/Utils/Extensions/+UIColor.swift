//
//  +UIColoe.swift
//  TYT
//
//  Created by Андрей Глухих on 26/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit

extension UIColor {
	static func background() -> UIColor {
		return .init(rgb: 0x1F2022)
	}
	
	static func secondary() -> UIColor {
		return .init(rgb: 0x323335)
	}
	
	static func tint() -> UIColor {
		return .init(rgb: 0x007aff)
	}
	
	
	convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}
	
	convenience init(rgb: Int) {
		self.init(
			red: (rgb >> 16) & 0xFF,
			green: (rgb >> 8) & 0xFF,
			blue: rgb & 0xFF)
	}
	
	var isDarkColor: Bool {
		var red, green, blue, alpha: CGFloat
		(red, green, blue, alpha) = (0, 0, 0, 0)
		self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		let lum = 0.2126 * red + 0.7152 * green + 0.0722 * blue
		return  lum < 0.50 ? true : false
	}
}
