//
//  FlickrAPI.swift
//  flickrApp
//
//  Created by Anıl Öncül on 11.10.2022.
//

import Foundation
import Moya

let plugin: PluginType = NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
let provider = MoyaProvider<FlickrAPI>(plugins: [plugin])

enum FlickrAPI{
    case getRecent
    
}

// MARK: - TargeType
extension FlickrAPI: TargetType {
    var headers: [String : String]? {
        nil
    }
    
    var baseURL: URL {
        guard let url = URL(string: "https://www.flickr.com/rest") else {
        fatalError("Base URL is not in correct format or found.")
        }
        return url
    }
    
    var path: String {
        return "/"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        
        let parameters :   [String: Any] = ["method" : "flickr.photos.getRecent",
                                             "api_key" : "bd22827f865f91809f563c04557356cd",
                                             "extras" : ["url_n","owner_name","date_taken"],
                                             "format" : "json",
                                             "nojsoncallback" : "1"]
            
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
            


        }
    }
    
      
    
    

  
