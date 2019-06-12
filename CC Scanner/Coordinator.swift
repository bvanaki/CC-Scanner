//
//  Coordinator.swift
//  CC Scanner
//
//  Created by Barbara Vanaki on 6/12/19.
//  Copyright © 2019 Barbara Vanaki. All rights reserved.
//

/*YOU GOT THIS CODE FROM https://www.hackingwithswift.com/articles/71/how-to-use-the-coordinator-pattern-in-ios-apps
 
 IT WAS A TUTORIAL FOR USING COORDINATORS*/

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
