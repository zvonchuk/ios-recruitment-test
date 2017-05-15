//
//  DataManager.swift
//  iOSRecruitmentTest
//
//  Created by user on 5/15/17.
//  Copyright © 2017 Snowdog. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

typealias ItemsFetchComletion = ([Item]?, Error?) -> Void

class ApiDataManager {
    struct Api {
        static let url = "http://localhost:8080/api/items"
    }
    
    func fetchItems(comletion: @escaping ItemsFetchComletion) {
        Alamofire.request(Api.url).responseArray { (data: DataResponse<[Item]>) in
            comletion(data.result.value, data.result.error)
        }
    }
}

