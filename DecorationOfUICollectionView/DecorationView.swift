//
//  DecorationView.swift
//  DecorationOfUICollectionView
//
//  Created by 刘延峰 on 15/12/3.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

import UIKit

class DecorationView: UICollectionReusableView {
    
    var imageView : UIImageView?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 90))
        
        self.addSubview(imageView!)
    }

    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        
        super.applyLayoutAttributes(layoutAttributes)
        
        let demoAttributes = layoutAttributes as! DemoLayoutAttributes
        
        self.imageView?.image = demoAttributes.image
    }
}
