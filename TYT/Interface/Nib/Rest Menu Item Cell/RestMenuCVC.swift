//
//  RestMenuCVC.swift
//  TYT
//
//  Created by Андрей Глухих on 10/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit

class RestMenuCVC: UICollectionViewCell {
  
  @IBOutlet weak var itemImageView: UIImageView!
  @IBOutlet weak var containerView: ShadowView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceButton: UIButton!

  var menuItem: MenuItem! {
    didSet {
      itemImageView.image = menuItem.image
      nameLabel.text = menuItem.name
      priceButton.setTitle("\(menuItem.price) р.", for: .normal) 
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    containerView.setShadow(shadowRadius: 3)
    itemImageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
  }
}
