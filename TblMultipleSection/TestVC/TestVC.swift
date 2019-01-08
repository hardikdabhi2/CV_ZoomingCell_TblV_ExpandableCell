//
//  TestVC.swift
//  SwiftMovingHaderView
//
//  Created by Hardik on 07/01/19.
//  Copyright © 2019 Innopad Solutions LLP. All rights reserved.
//

import UIKit

class TestVC: UIViewController {
    @IBOutlet weak var collectionview:UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionview.register(UINib(nibName: "ImgCell", bundle: nil), forCellWithReuseIdentifier: "ImgCell")
        // Do any additional setup after loading the view.
    }
}

extension TestVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImgCell", for:indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.collectionview.frame.size.width, height: self.collectionview.frame.size.height)
    }
}

