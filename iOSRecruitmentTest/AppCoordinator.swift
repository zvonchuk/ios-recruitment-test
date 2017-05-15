//
//  AppCoordinator.swift
//  iOSRecruitmentTest
//
//  Created by user on 5/15/17.
//  Copyright © 2017 Snowdog. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let context = (UIApplication.shared.delegate as! AppDelegate).managedObjectContext
        
        let itemsViewModel = ItemsViewModel()
        itemsViewModel.apiDataManager = ApiDataManager()
        itemsViewModel.localDataManager = LocalDataManager(context: context)
        
        let itemsVC = ViewController()
        itemsVC.viewModel = itemsViewModel
        
        window.rootViewController = itemsVC
        window.makeKeyAndVisible()
    }
}
