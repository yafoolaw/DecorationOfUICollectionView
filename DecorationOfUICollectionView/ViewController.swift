//
//  ViewController.swift
//  DecorationOfUICollectionView
//
//  Created by 刘延峰 on 15/12/3.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var collectionView : UICollectionView!
    var dataArray      : [UIImage]?
    var demoLayout     : DemoLayout!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.buildData()
        self.buildCollectionView()

    }
    
    func buildData() {
    
        self.dataArray = [UIImage]()
        
        for imageIndex in 1...16 {
        
            let image = UIImage(named: "\(imageIndex)")
            self.dataArray?.append(image!)
        }
    }
    
    func buildCollectionView() {
    
        demoLayout = DemoLayout()
        
        self.collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: demoLayout)
        self.collectionView.registerClass(DemoCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: cellIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate   = self
        
        self.view.addSubview(self.collectionView)
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (self.dataArray?.count)!
    }


    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell =
        collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! DemoCollectionViewCell
        
        cell.imageView.image = self.dataArray![indexPath.row] 
        
        return cell
    }
}

