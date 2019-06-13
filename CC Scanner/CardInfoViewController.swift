//
//  ViewController.swift
//  CC Scanner
//
//  Created by Barbara Vanaki on 6/12/19.
//  Copyright © 2019 Barbara Vanaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func toScanPage(_ sender: Any) {
        coordinator?.toCameraPage()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
