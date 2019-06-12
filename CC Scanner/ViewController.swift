//
//  ViewController.swift
//  CC Scanner
//
//  Created by Barbara Vanaki on 6/12/19.
//  Copyright © 2019 Barbara Vanaki. All rights reserved.
//

import MobileCoreServices

import UIKit

import FirebaseMLVision
import FirebaseMLVisionObjectDetection
import FirebaseMLVisionAutoML
import FirebaseMLCommon


    
    
class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var setupButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitle("Scan Card", for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        view.addSubview(setupButton)
        view.backgroundColor = .white
        scanButton()
        
    }
    
    func scanButton() {
        
        setupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor ).isActive = true
        setupButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        setupButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        setupButton.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        
        
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        func tapToScan(_ sender: Any) {
            coordinator?.toScanner()
        }
        
         func tapToMainMenu(_ sender: Any) {
            coordinator?.toMainMenu()
        }
        
        
    }
    
    
    

}
