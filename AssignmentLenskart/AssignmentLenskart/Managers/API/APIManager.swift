//
//  APIManager.swift
//  AssignmentLenskart
//
//  Created by SHAILENDRA KUSHWAHA on 26/02/22.
//


import Foundation

import Foundation
import UIKit


class APIHandler: NSObject {
        
    static let sharedInstance = APIHandler()

    func RequestManager(url: String!, method: String!) -> URLRequest  {
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringCacheData
        return request
    }
    
  
    
    func postAPI(params: Dictionary <String, String>, stringURL: String!, onSuccess: @escaping(Dictionary<String, Any>) -> Void, onFailure: @escaping(Error) -> Void) {
        
//        guard let url = URL(string: stringURL) else {
//            let error = NSError(domain: "URL", code: 12, userInfo: ["localizeDescription":"URL is not valid"])
//            onFailure(error)
//            return
//        }
        
        var request = self.RequestManager(url: stringURL, method: "POST")
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])

        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
          
            do {
                
                if (data == nil) {
                    onFailure(error!)
                }
                else{
                    let result = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
                    onSuccess(result)
                }
            } catch
            {
                onFailure(error)
            }
        })
        
        task.resume()
    }
    
    func getAPI(params: Dictionary <String, String>, stringURL: String!, onSuccess: @escaping(Dictionary<String, Any>) -> Void, onFailure: @escaping(Error) -> Void) {
        
        print(stringURL)
        guard let url = URL(string: stringURL) else {
            let error = NSError(domain: "URL", code: 12, userInfo: ["localizeDescription":"URL is not valid"])
            onFailure(error)
            return
        }

        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        let queryItems = params.map{
            return URLQueryItem(name: "\($0)", value: "\($1)")
        }
        
        urlComponents?.queryItems = queryItems
        
        let request = self.RequestManager(url: urlComponents?.url?.description, method: "GET")
    
 
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in

            do {
                
                
                if (data == nil){
                    onFailure(error!)
                }
                else {
                    let result = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
                    onSuccess(result)
//                    if let error = result["error"] as? String {
//
//                        if error == "Unauthorized!"{
//                            print("You Should Logout now")
//                            TFTAppProcess.shared.logOut(launchLogin: true)
////                            logout()
//                        }
//                        onSuccess(Dictionary())
//                    }
//                    else {
//
//                    }
                }
            } catch {
                onFailure(error)
            }
        })
        
        task.resume()
    }
    

    
   
}

