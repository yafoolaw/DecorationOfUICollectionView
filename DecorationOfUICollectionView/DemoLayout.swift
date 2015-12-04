//
//  DemoLayout.swift
//  DecorationOfUICollectionView
//
//  Created by FrankLiu on 15/12/3.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

class DemoLayout: UICollectionViewFlowLayout {

    var cellCount    : Int?
    var sectionCount : Int?
    
    override func prepareLayout() {
        
        super.prepareLayout()
        
        self.cellCount               = self.collectionView?.numberOfItemsInSection(0)
        self.sectionCount            = self.collectionView?.numberOfSections()
        self.itemSize                = CGSize(width: 100, height: 100)
        self.sectionInset            = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        self.minimumInteritemSpacing = 40
        self.minimumLineSpacing      = 20
        
        self.registerClass(DecorationView.classForCoder(), forDecorationViewOfKind: decorationIdentifier)
    }
    
    override func layoutAttributesForDecorationViewOfKind(elementKind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes(forDecorationViewOfKind: elementKind, withIndexPath: indexPath)
        
        attributes.frame  = CGRect(x: 0, y: indexPath.row * 120 + 12, width: Int(screenWidth), height: 120)
        attributes.zIndex = -1
        
        return attributes
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        // 方法1: 通过主动调用 self.layoutAttributesForItemAtIndexPath(indexPath) 和 self.layoutAttributesForDecorationViewOfKind(decorationIdentifier, atIndexPath: indexPath) 生成全部 UICollectionViewLayoutAttributes
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
        
        // 方法2: 通过调用 super.layoutAttributesForElementsInRect(rect) ,获得已经拥有的 UICollectionViewLayoutAttributes,根据已经拥有的,增添你需要的UICollectionViewLayoutAttributes
//        let attributes : [UICollectionViewLayoutAttributes]? = super.layoutAttributesForElementsInRect(rect)
//        
//        var allAttibutes = attributes
//        
//        for attribute in attributes! {
//            
//            if attribute.frame.origin.x == 25 {
//                
//                print(attribute.indexPath)
//                let decorationAttributes : UICollectionViewLayoutAttributes =
//                UICollectionViewLayoutAttributes(forDecorationViewOfKind: decorationIdentifier, withIndexPath: attribute.indexPath)
//                
//                decorationAttributes.frame =
//                    CGRect(x: 0, y: attribute.frame.origin.y - 10, width: screenWidth, height: 120)
//                
//                decorationAttributes.zIndex = attribute.zIndex - 1
//                
//                allAttibutes?.append(decorationAttributes)
//            }
//        }
//
//        return allAttibutes
    }
}
