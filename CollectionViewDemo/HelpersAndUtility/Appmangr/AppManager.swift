//
//  AppManager.swift
//  CollectionViewDemo
//
//  Created by Sourab on 12/02/19.
//  Copyright © 2019 Sourab. All rights reserved.
//

import UIKit

enum serverTypeEnum: String {
//    case serverTypeProd
    case serverTypeDev = "https://jsonblob.com/api/df17075f-2dcb-11e9-8c29-69ab7827104c"
//    case localIP
}

class AppManager: NSObject {
    static let sharedInstance = AppManager()
    //Change here if we want to change the servertype of the string
    let kServerType = serverTypeEnum.serverTypeDev
    
    func getBaseURL() -> String? {
        print(kServerType.rawValue)
        return kServerType.rawValue
    }
}
