//
//  Extensions.swift
//  chat
//
//  Created by Nelson Gonzalez on 1/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit


let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(urlString: String){
        
        self.image = nil
        //check cashe for image first
        if let cashedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cashedImage
            return
        }
        //Otherwise fire off a new download
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!)  { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                if let downloadedImage = UIImage(data: data!){
                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
                    
                    self.image = downloadedImage
                }
            }
            
            }.resume()
        
    }
}
