//
//  AppDelegate.swift
//  ToDoey
//
//  Created by Thomas Krentz on 06.03.19.
//  Copyright © 2019 Thomas Krentz. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        do {
            _ = try Realm()
        }
        catch {
            print("Could not open Realm \(error)")
        }
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
       
    }
    
    // MARK: - Core Data stack
    
  


}

