//
//  ImageMenuTVCell.swift
//  TYT
//
//  Created by Андрей Глухих on 09/05/2019.
//  Copyright © 2019 scapegoat. All rights reserved.
//

import UIKit

class ImageMenuTVCell: UITableViewCell {
  static let cellHeight: CGFloat = 200
  @IBOutlet weak var mainTextView: UILabel!
  @IBOutlet weak var secondaryTextView: UILabel!
  @IBOutlet weak var itemImageView: UIImageView!
  @IBOutlet weak var viewContainer: ShadowView!

  var menuItem: MainMenuItem! {
    didSet {
      itemImageView.image = menuItem.image
      mainTextView.text = menuItem.mainText
      secondaryTextView.text = menuItem.secondaryText
    }
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    viewContainer.setShadow(shadowRadius: 6)
  }
}
