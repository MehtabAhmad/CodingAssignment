//
//  RemoteAPI.swift
//  LBCodeChallenge
//
//  Created by Mehtab Ahmed on 20/04/2022.
//

import Foundation
import Alamofire
import UIKit
import SwiftyJSON

enum Errors: String {
    
    case NETWORK_ERROR, SERIALIZATION_ERROR, OTHER
    
    var description: String {
        switch self {
        case .NETWORK_ERROR:
            return "No internet connection!"
        case .SERIALIZATION_ERROR:
            return "Cannot parse data. Data is not in the correct format"
        case .OTHER:
            return "Something went wrong"
        }
    }
}


class RemoteAPI {
    
    static let shared = RemoteAPI()
    
    func getRequest<T:Decodable>(url: String, parameters: [String : AnyObject] = [:], headers: HTTPHeaders = [:], completion: @escaping (T) -> Void, failure: @escaping (String) -> Void ) {
        
        
        AF.request(url, method: .get , parameters: parameters, encoding: URLEncoding.default, headers: headers).responseData { response in
            self.handleResponse(response: response, completion: completion, failure: failure)
        }
    }
    
    
    func handleResponse<T:Decodable>(response: AFDataResponse<Data>, completion: @escaping (T) -> Void, failure: @escaping (String) -> Void) {
        
        switch response.result {
        case .success (let value):
            self.showRequestDetailForSuccess(responseObject: response)
            parseJSON(json: JSON(value), completion: completion, failure: failure)
            break
            
        case .failure (let error):
            self.showRequestDetailForFailure(responseObject: response)
            failure(error.localizedDescription)
            break
        }
    }
    
    
    func parseJSON<T:Decodable>(json:JSON, completion: @escaping (T) -> Void, failure: @escaping (String) -> Void) {
        
        do {
            let data = try json.rawData()
            let parsedData = try JSONDecoder().decode(T.self, from: data)
            completion(parsedData)
        }
        
        catch DecodingError.keyNotFound(let key, let context) {
            Swift.print("could not find key \(key) in JSON: \(context.debugDescription)")
            failure(Errors.SERIALIZATION_ERROR.rawValue)
        } catch DecodingError.valueNotFound(let type, let context) {
            Swift.print("could not find type \(type) in JSON: \(context.debugDescription)")
            failure(Errors.SERIALIZATION_ERROR.rawValue)
        } catch DecodingError.typeMismatch(let type, let context) {
            Swift.print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
            failure(Errors.SERIALIZATION_ERROR.rawValue)
        } catch DecodingError.dataCorrupted(let context) {
            Swift.print("data found to be corrupted in JSON: \(context.debugDescription)")
            failure(Errors.SERIALIZATION_ERROR.rawValue)
        } catch let error as NSError {
            NSLog("Error in read(from:ofType:) domain= \(error.domain), description= \(error.localizedDescription)")
            failure(Errors.SERIALIZATION_ERROR.rawValue)
        }
    }
    
    
    func showRequestDetailForSuccess(responseObject response : AFDataResponse<Data>) {
        
        print("\n\n\n ✅ ✅ ✅ ✅ ✅  ------- Success Response Start -------  ✅ ✅ ✅ ✅ ✅ \n")
        print(""+(response.request?.url?.absoluteString ?? ""))
        print("\n=========   allHTTPHeaderFields   ========== \n")
        print("%@",response.request!.allHTTPHeaderFields!)
        
        if let bodyData : Data = response.request?.httpBody
        {
            let bodyString = String(data: bodyData, encoding: String.Encoding.utf8)
            print("\n=========   Request httpBody   ========== \n" + bodyString!)
            
        } else {
            print("\n=========   Request httpBody   ========== \n" + "Found Request Body Nil")
        }
        
        if let responseData : Data = response.data {
            let responseString = String(data: responseData, encoding: String.Encoding.utf8)
            print("\n=========   Response Body   ========== \n" + responseString!)
            
        } else {
            print("\n=========   Response Body   ========== \n" + "Found Response Body Nil")
        }
        
        print("\n\n\n ✅ ✅ ✅  ------- Success Response End -------  ✅ ✅ ✅ \n\n\n")
    }
    
    
    func showRequestDetailForFailure(responseObject response : AFDataResponse<Data>) {
        
        print("\n\n\n ❌ ❌ ❌ ❌ ❌ ------- Failure Response Start ------- ❌ ❌ ❌ ❌ ❌ \n")
        print(""+(response.request?.url?.absoluteString ?? ""))
        print("\n=========   allHTTPHeaderFields   ========== \n")
        print("%@",response.request!.allHTTPHeaderFields!)
        
        if let bodyData : Data = response.request?.httpBody {
            let bodyString = String(data: bodyData, encoding: String.Encoding.utf8)
            print("\n=========   Request httpBody   ========== \n" + bodyString!)
            
        } else {
            print("\n=========   Request httpBody   ========== \n" + "Found Request Body Nil")
        }
        
        if let responseData : Data = response.data {
            let responseString = String(data: responseData, encoding: String.Encoding.utf8)
            print("\n=========   Response Body   ========== \n" + responseString!)
            
        } else {
            print("\n=========   Response Body   ========== \n" + "Found Response Body Nil")
        }
        
        print("\n\n\n ❌ ❌ ❌ ------- Failure Response End ------- ❌ ❌ ❌ \n")
    }
}

