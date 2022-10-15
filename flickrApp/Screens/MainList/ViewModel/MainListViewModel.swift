 //
//  MainListController.swift
//  flickrApp
//
//  Created by Anıl Öncül on 13.10.2022.
//

import Moya

enum  MainListChanges {
    case didErrorOccurred(_ error: Error)
    case didFetchImages
}

final class MainListViewModel {
    private var imageResponse: ImageResponse? {
        didSet {
            self.changeHandler?(.didFetchImages)
        }
    }
    
    var changeHandler: ((MainListChanges) -> Void)?
    
    var numberOfRows: Int {
        imageResponse?.photos?.count ?? .zero
    }
    

    
    func fetchImage() {
        provider.request(.getRecent) {result in
            switch result {
            case.failure(let error):
                self.changeHandler?(.didErrorOccurred(error))
            case.success(let response):
                do {
                    let imageResponse = try
                    JSONDecoder().decode(ImageResponse.self, from: response.data)
                    self.imageResponse = imageResponse
                    print(imageResponse)
                    } catch {
                    self.changeHandler?(.didErrorOccurred(error))
                }               
            }
        }
    }
   /* func imageForIndexPath(_ indexPath: IndexPath) -> Image? {
        imageResponse?.photos.page[indexPath.row]
    } */
}
