//
//  Image.swift
//  flickrApp
//
//  Created by Anıl Öncül on 15.10.2022.
//

import Foundation

// MARK: - Photo
struct Photo: Decodable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
    

    
}
