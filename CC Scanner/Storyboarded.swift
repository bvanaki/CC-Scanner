//
//  Storyboarded.swift
//  CC Scanner
//
//  Created by Barbara Vanaki on 6/12/19.
//  Copyright © 2019 Barbara Vanaki. All rights reserved.
//

/*YOU GOT THIS CODE FROM https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps
 
 IT WAS A TUTORIAL FOR USING COORDINATORS*/

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        // this pulls out "MyApp.MyViewController"
        let fullName = NSStringFromClass(self)
        // this splits by the dot and uses everything after, giving "MyViewController"
        let className = fullName.components(separatedBy: ".")[1]
        
        // load our storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
