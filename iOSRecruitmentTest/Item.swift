//
//  Item.swift
//  iOSRecruitmentTest
//
//  Created by user on 5/15/17.
//  Copyright © 2017 Snowdog. All rights reserved.
//

import ObjectMapper
import CoreData

extension Item: StaticMappable {
    public static func objectForMapping(map: Map) -> BaseMappable? {
        let entity = NSEntityDescription.entity(forEntityName: String(describing: Item.self), in: AppDelegate.context)!
        let item = Item(entity: entity, insertInto: AppDelegate.context)
        item.mapping(map: map)
        return item
    }
    
    public func mapping(map: Map) {
        id <- map["id"]
        url <- map["url"]
        name <- map["name"]
        icon <- map["icon"]
        details <- map["description"]
        timestamp <- map["timestamp"]
    }
}
