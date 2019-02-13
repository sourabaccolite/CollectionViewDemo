//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Sourab on 12/02/19.
//  Copyright © 2019 Sourab. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var collectionVwRightToLeft: UICollectionView!
    @IBOutlet weak var btnRefresh: UIButton!
    
    var arrAllData = [Letters]()
    
    fileprivate let reuseIdentifierDescriptionCollectionViewCell = "DescriptionCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionVwRightToLeft.register(UINib(nibName: reuseIdentifierDescriptionCollectionViewCell, bundle:nil), forCellWithReuseIdentifier: reuseIdentifierDescriptionCollectionViewCell)

        collectionVwRightToLeft.delegate = self
        collectionVwRightToLeft.dataSource = self
        
        if Reachability.isConnectedToNetwork() {
            WebService().getDetailsWithEndPointUrl(endPointUrl: AppManager.sharedInstance.getBaseURL()!, SuccessBlock: { data in
                self.fetchDataOfLetters()
            }) { err in
                print(err)
            }
        } else {
            showAlert(withTitle: "Oops!", alertMessage: "Please check your internet connection!!", actionTitle: "Ok")
        }
    }
    
    @IBAction func btnRefreshAction(_ sender: Any) {
        if Reachability.isConnectedToNetwork() {
            WebService().getDetailsWithEndPointUrl(endPointUrl: AppManager.sharedInstance.getBaseURL()!, SuccessBlock: { data in
                self.fetchDataOfLetters()
            }) { err in
                print(err)
            }
        } else {
            showAlert(withTitle: "Oops!", alertMessage: "Please check your internet connection!!", actionTitle: "Ok")
        }
    }
    
    func fetchDataOfLetters() {
        arrAllData = DataModel().fetchAllData()
        self.collectionVwRightToLeft.reloadData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrAllData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierDescriptionCollectionViewCell, for: indexPath) as! DescriptionCollectionViewCell
        let dataLettr: Letters = arrAllData[indexPath.row]
        cell.lblTitle.text = dataLettr.name
        cell.lblDescription.text = dataLettr.nameDescription
        return cell
    }
}

