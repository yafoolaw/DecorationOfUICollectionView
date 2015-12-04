//
//  DemoCollectionViewCell.swift
//  DecorationOfUICollectionView
//
//  Created by FrankLiu on 15/12/3.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

let cellIdentifier = "CellIdentifier"

class DemoCollectionViewCell: UICollectionViewCell {
    
    var imageView : UIImageView!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.imageView = UIImageView(frame: self.bounds)
        
        self.addSubview(self.imageView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
