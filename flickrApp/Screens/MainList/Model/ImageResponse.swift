//
//  ImageResponse.swift
//  flickrApp
//
//  Created by Anıl Öncül on 13.10.2022.
//

import Foundation

struct ImageResponse: Decodable {
    let photos: [ImagePhotos]?
    
}
