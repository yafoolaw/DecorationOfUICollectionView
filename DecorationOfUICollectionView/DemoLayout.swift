//
//  DemoLayout.swift
//  DecorationOfUICollectionView
//
//  Created by 刘延峰 on 15/12/3.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

import UIKit

class DemoLayout: UICollectionViewFlowLayout {

    var cellCount    : Int?
    var sectionCount : Int?
    
    override func prepareLayout() {
        
        super.prepareLayout()
        
        self.cellCount    = self.collectionView?.numberOfItemsInSection(0)
        self.sectionCount = self.collectionView?.numberOfSections()
        self.itemSize     = CGSize(width: 100, height: 100)
        self.sectionInset = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        self.minimumInteritemSpacing = 40
        self.minimumLineSpacing      = 20
        
        self.registerClass(DecorationView.classForCoder(), forDecorationViewOfKind: decorationIdentifier)
    }
    
    override func layoutAttributesForDecorationViewOfKind(elementKind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes(forDecorationViewOfKind: elementKind, withIndexPath: indexPath)
        
        attributes.frame = CGRect(x: 0, y: indexPath.row * 120 + 12, width: Int(screenWidth), height: 120)
        attributes.zIndex = -1
        
        return attributes
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var attributesArray = [UICollectionViewLayoutAttributes]()
        
        for i : Int in 0..<cellCount! {
        
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            let attributes = self.layoutAttributesForItemAtIndexPath(indexPath)
            attributesArray.append(attributes!)
        }
        
        for i : Int in 0..<cellCount!/2 {
        
            let indexPath = NSIndexPath(forRow: i, inSection: 0)
            let attributes = self.layoutAttributesForDecorationViewOfKind(decorationIdentifier, atIndexPath: indexPath)
            attributesArray.append(attributes!)
        }
        
        return attributesArray
    }
}
