//
//  WebService.swift
//  CollectionViewDemo
//
//  Created by Sourab on 12/02/19.
//  Copyright © 2019 Sourab. All rights reserved.
//


import UIKit

class WebService: NSObject {
    
    func getDetailsWithEndPointUrl(endPointUrl: String, SuccessBlock: @escaping((AnyObject) -> Void), failureBlock: @escaping((AnyObject) -> Void)) {
        guard let baseURL = AppManager.sharedInstance.getBaseURL() else {
            return
        }
        
        var urlRequest = URLRequest(url: URL.init(string: baseURL)!)
        urlRequest.httpMethod = "Get"
        urlRequest.timeoutInterval = 60
        let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, err) in
            do {
                if let responseData : Data = data, let _ = response as? HTTPURLResponse {
                    do {
                        let dataArr: [String: Any] = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] ?? ["test": "test"]
                        print(dataArr)
                        DispatchQueue.main.async {
                            DataModel().saveDetails(withJsonData: dataArr)
                            SuccessBlock(dataArr as AnyObject)
                        }
                    } catch {
                        print("error")
                        failureBlock("Failure" as AnyObject)
                    }
                } else {
                    DispatchQueue.main.async {
                        let failure = "Failure"
                        failureBlock(failure as AnyObject)
                    }
                }
                return
            }
        }
        )
        task.resume()
    }
}
