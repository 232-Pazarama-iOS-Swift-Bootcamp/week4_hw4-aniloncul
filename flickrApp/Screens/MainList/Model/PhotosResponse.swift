//
//  ImageResponse.swift
//  flickrApp
//
//  Created by Anıl Öncül on 13.10.2022.
//

import Foundation


// MARK: - Welcome
struct Welcome: Decodable {
    let photos: Photos?
    let stat: String?
}
// MARK: - Photos
struct Photos: Decodable {
    let page, pages, perpage, total: Int?
    let photo: [Photo]
}

  
