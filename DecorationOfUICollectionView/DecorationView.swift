//
//  DecorationView.swift
//  DecorationOfUICollectionView
//
//  Created by FrankLiu on 15/12/3.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

let decorationIdentifier = "DecorationIdentifier"

class DecorationView: UICollectionReusableView {
    
    var imageView : UIImageView?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 120))
        self.imageView!.image = UIImage(named: "SingleBookShelf")
        
        self.addSubview(imageView!)
    }

    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
