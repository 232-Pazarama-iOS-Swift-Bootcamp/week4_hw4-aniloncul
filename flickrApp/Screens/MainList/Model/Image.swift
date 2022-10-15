//
//  Image.swift
//  flickrApp
//
//  Created by Anıl Öncül on 13.10.2022.
//

import Foundation

struct ImagePhotos: Decodable{
    let page: Int
    let pages: Int
    let perpage: Int
    let photo: [ImagePhoto]
    init(page: Int,
         pages: Int,
         perpage: Int,
         photo: [ImagePhoto]) {
        self.page = page
        self.pages = pages
        self.perpage = perpage
        self.photo = photo
    }
}
    
    
        
        struct ImagePhoto: Decodable {
            
            let farm: Int
            let id: String
            let owner: String
            let secret: String
            let server: String
            let title: String
            let ispublic: Int
            let isfriend: Int
            let isfamily: Bool
            let datetaken: String
            let datetakengranularity: Int
            let datetakenunknown: String
            let ownername: String
            let url_n: String
            let height_n: Int
            let width_n: Int
            
            
            
            
        }
