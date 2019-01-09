//
//  BrandListVC.swift
//  TblMultipleSection
//
//  Created by Hardik on 09/01/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import UIKit

class BrandListVC: UIViewController {
    
    @IBOutlet weak var collectionLogoList:UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionLogoList.register(UINib(nibName: "BrandCell", bundle: nil), forCellWithReuseIdentifier: "BrandCell")
        
    }
}

extension BrandListVC:UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "BrandCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! BrandCell
        
        return cell
    }
}



extension BrandListVC:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width:(self.collectionLogoList.frame.size.width-20)/3, height:(self.collectionLogoList.frame.size.width/3))
    }
}









