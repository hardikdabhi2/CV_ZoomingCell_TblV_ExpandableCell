//
//  ViewController.swift
//  TblMultipleSection
//
//  Created by Hardik on 07/01/19.
//  Copyright © 2019 HardikDabhi. All rights reserved.
//

import UIKit

struct cellData{
    var opend = Bool()
    var title = String()
    var cellData = [String]()
}

class ViewController: UIViewController {
    @IBOutlet weak var tableviewList:UITableView!
    @IBOutlet weak var scrollviewMain:UIScrollView!
    @IBOutlet weak var imageview:UIImageView!
    @IBOutlet weak var layoutTableHeight:NSLayoutConstraint!
    @IBOutlet weak var collectionviewBanner :UICollectionView!
    
     let imageView = UIView()
    
    
    var arryData = [cellData]()
    var arryCarKey = ["Type of Body","Mileage","Fule type","Motor size","Transmission","Drive","Exterior color","Interior Color","Registeres","Record","Stock Id","Chassis Number"]
    var arrayCarDetails = ["Sedan","N/A","Gasoline","2.0","Automatic","FWD","Red","Beige","10/7/190","NA","215",""]
    
    var arryCarFeatures = ["A/C:Front","To Create","Cruise Control","Airbags","","Adjustable Comfort","Defogger","Antilock Break System","Tuner / Radio",""]
    var note = ["asdh as asgd gd asga sdgas[gdas dag gsadg a[ sgd[asda asd[asdasdg asdg as agsda s"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.arryData = [
            cellData(opend: false, title: "Auto Details", cellData:arryCarKey),
            cellData(opend: false, title: "Features", cellData:arryCarFeatures),
            cellData(opend: false, title: "Seller's Note", cellData:note)
                        ]

        self.title = "Car Data"
        self.setScrollviewHeight()
    }
    
    
    //MARK: - User Interection Methods -
    private func setScrollviewHeight(){
        
        print("Tablview Height",self.tableviewList.contentSize.height)
        self.scrollviewMain.contentSize = CGSize(width: self.scrollviewMain.frame.size.width, height:self.tableviewList.frame.origin.y + self.tableviewList.contentSize.height+80)
        self.layoutTableHeight.constant =  self.tableviewList.frame.origin.y + self.tableviewList.contentSize.height
        
    }
    
}

extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier:"Cell", for: indexPath)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let imageInfo = GSImageInfo(image:UIImage(named: "food")!, imageMode:.aspectFit)
        let transInfo = GSTransitionInfo(fromView: collectionView)
        let imageviewr = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transInfo)
        self.present(imageviewr, animated: true, completion: nil)
    }
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds
        return CGSize(width:size.width, height:size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}




extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.arryData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(self.arryData[section].opend)==true{
                return self.arryData[section].cellData.count + 1
        }else{
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cellIdentifier = "Section1Cell"
            var cell:Section1Cell? = tableView.dequeueReusableCell(withIdentifier:cellIdentifier) as? Section1Cell
            if cell == nil{
                let nib:[Any] = Bundle.main.loadNibNamed(cellIdentifier, owner: self, options: nil)!
                cell = (nib[0] as! Section1Cell)
            }
            cell?.labelTitle.text = self.arryData[indexPath.section].title
            cell?.backgroundColor = UIColor.red
            return cell!
        }
        else{
            if(indexPath.section == 0){
            let cellIdentifier = "Section2Cell"
            var cell:Section2Cell? = tableView.dequeueReusableCell(withIdentifier:cellIdentifier) as? Section2Cell
            if cell == nil{
                let nib:[Any] = Bundle.main.loadNibNamed(cellIdentifier, owner: self, options: nil)!
                cell = (nib[0] as! Section2Cell)
            }
            cell?.labelTitle.text! = self.arryData[indexPath.section].cellData[indexPath.row - 1]
            cell?.labelValue.text = self.arrayCarDetails[indexPath.row - 1]
                cell?.selectionStyle = .none
            return cell!
            }
            else if(indexPath.section == 2){
                let cellIdentifier = "SectionCommentCell"
                var cell:SectionCommentCell? = tableView.dequeueReusableCell(withIdentifier:cellIdentifier) as? SectionCommentCell
                if cell == nil{
                    let nib:[Any] = Bundle.main.loadNibNamed(cellIdentifier, owner: self, options: nil)!
                    cell = (nib[0] as! SectionCommentCell)
                }
                cell?.labelComment.text! = self.arryData[indexPath.section].cellData[indexPath.row - 1]
                cell?.selectionStyle = .none
                return cell!
            }
            else{
                let cellIdentifier = "Section3Cell"
                var cell:Section3Cell? = tableView.dequeueReusableCell(withIdentifier:cellIdentifier) as? Section3Cell
                if cell == nil{
                    let nib:[Any] = Bundle.main.loadNibNamed(cellIdentifier, owner: self, options: nil)!
                    cell = (nib[0] as! Section3Cell)
                }
                cell?.labelValue.text! = self.arryData[indexPath.section].cellData[indexPath.row - 1]
                cell?.selectionStyle = .none
                return cell!
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 2){
            if(indexPath.row != 0){
                return self.arryData[indexPath.section].cellData[indexPath.row - 1].height(withConstrainedWidth:UIScreen.main.bounds.width - 35, font:UIFont.systemFont(ofSize:14))
            }
            else{
                return 50
            }
        }
        else{
            return 50
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row == 0){
            if(self.arryData[indexPath.section].opend){
               self.arryData[indexPath.section].opend = false
            }
            else{
                self.arryData[indexPath.section].opend = true
            }
            
            let section = IndexSet.init(integer:indexPath.section)
            self.tableviewList.reloadSections(section, with:.none)
        }
        else{
            //Watever you want to do
        }
        self.setScrollviewHeight()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 300 - (scrollView.contentOffset.y + 230)
        let height = min(max(y, 0), 300)
   //     print("Height",height)
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height)
    }
}


extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font : font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
