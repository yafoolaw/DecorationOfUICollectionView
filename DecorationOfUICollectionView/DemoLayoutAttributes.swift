//
//  DemoLayoutAttributes.swift
//  DecorationOfUICollectionView
//
//  Created by 刘延峰 on 15/12/3.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

import UIKit

class DemoLayoutAttributes: UICollectionViewLayoutAttributes {
    
    var image : UIImage?
    
    override init() {
        
        super.init()
        self.image = UIImage(named: "SingleBookShelf")
    }
}
