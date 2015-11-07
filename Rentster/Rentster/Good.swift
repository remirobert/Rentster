//
//  Good.swift
//  APIRenty
//
//  Created by Remi Robert on 04/11/15.
//  Copyright © 2015 Remi Robert. All rights reserved.
//

import UIKit
import Parse

enum GoodCategorie {
    case Service, Good
    
    static func categoryFromIndex(index: Int) -> GoodCategorie {
        switch index {
        case 0: return .Service
        case 1: return .Good
        default: return .Service
        }
    }
}

class Good {

    var title: String!
    var descriptionGood: String?
    var price: Double?
    var deposit: Double?
    var startDate: NSDate?
    var endDate: NSDate?
    var contact: ContactUser!
    var category: GoodCategorie!
    var image: UIImage?
    private var fileImage: PFFile?

    func fectchImage(blockCompletion: ((image:UIImage?)->())) {
        if let image = self.image {
            print("fetch image locale")
            blockCompletion(image: image)
        }
        else if let fileImage = self.fileImage {
            fileImage.getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
                if let dataImage = data where error == nil {
                    self.image = UIImage(data: dataImage)
                    blockCompletion(image: self.image)
                }
                else {
                    blockCompletion(image: nil)
                }
            })
        }
        else {
            blockCompletion(image: nil)
        }
    }
    
    private func createParseObject() -> PFObject {
        let newObject = PFObject(className: "Good")
        
        newObject["title"] = self.title
        newObject["price"] = self.price
        newObject["deposit"] = self.deposit
        if let description = self.descriptionGood {
            newObject["description"] = description
        }
        if let startDate = self.startDate {
            newObject["start"] = startDate
        }
        if let endDate = self.endDate {
            newObject["end"] = endDate
        }
        if let image = self.image, let dataImage = UIImageJPEGRepresentation(image, 0.1) {
            newObject["image"] = PFFile(data: dataImage)
        }
        if let category = self.category {
            newObject["category"] = category.hashValue
        }
        return newObject
    }
    
    class func buildGood(object: PFObject) -> Good {
        let newGood = Good()
        if let title = object["title"] as? String {
            newGood.title = title
        }
        if let price = object["price"] as? Double {
            newGood.price = price
        }
        if let deposit = object["deposit"] as? Double {
            newGood.deposit = deposit
        }
        if let description = object["description"] as? String {
            newGood.descriptionGood = description
        }
        if let start = object["start"] as? NSDate {
            newGood.startDate = start
        }
        if let end = object["end"] as? NSDate {
            newGood.endDate = end
        }
        if let fileImage = object["image"] as? PFFile {
            newGood.fileImage = fileImage
        }
        if let category = object["category"] as? Int {
            newGood.category = GoodCategorie.categoryFromIndex(category)
        }
        return newGood
    }
}

extension Good {
    
    private class func searchGoodsNear(stringSearch: String?, kilometers: Double = 20, category: Category? = nil, blockCompletion: ((goods:[Good]?)->())) {
            PFGeoPoint.geoPointForCurrentLocationInBackground({ (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
                if let geoPoint = geoPoint where error == nil {
                    let querry = PFQuery(className: "Good")
                    
                    if let category = category {
                        querry.whereKey("category", equalTo: category.hashValue)
                    }
                    if let stringSearch = stringSearch {
                        querry.whereKey("title", containsString: stringSearch)
                    }
                    querry.cachePolicy = PFCachePolicy.CacheThenNetwork
                    querry.whereKey("geoPoint", nearGeoPoint: geoPoint, withinKilometers: kilometers)
                    
                    querry.findObjectsInBackgroundWithBlock({ (results:[PFObject]?, error:NSError?) -> Void in
                        if let results = results where error == nil {
                            blockCompletion(goods:results.map {return Good.buildGood($0)})
                        }
                        else {
                            blockCompletion(goods:nil)
                        }
                    })
                }
                else {
                    blockCompletion(goods:nil)
                }
            })
    }
    
    class func goodsNearUser(kilometers: Double = 20, category: Category? = nil, blockCompletion: ((goods:[Good]?)->())) {
        self.searchGoodsNear(nil, kilometers: kilometers, category: category, blockCompletion: blockCompletion)
    }
    
    class func searchByString(stringSearch: String, kilometers: Double = 20, category: Category? = nil, blockCompletion: ((goods:[Good]?)->())) {
        self.searchGoodsNear(stringSearch, kilometers: kilometers, category: category, blockCompletion: blockCompletion)
    }
    
    class func createNewGood(good: Good, blockCompletion: ((good:Good?)->())) {
        let goodObject = good.createParseObject()
        
        print("new good : \(goodObject)")
        
        PFGeoPoint.geoPointForCurrentLocationInBackground({ (geoPoint: PFGeoPoint?, error: NSError?) -> Void in
            if let geoPoint = geoPoint where error == nil {
                goodObject["geoPoint"] = geoPoint
                goodObject.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
                    if success && error == nil {
                        blockCompletion(good: good)
                    }
                    else {
                        print("error creation : \(error)")
                        blockCompletion(good: nil)
                    }
                })
            }
            else {
                print("error localisation : \(error)")
                blockCompletion(good: nil)
            }
        })
    }
}
