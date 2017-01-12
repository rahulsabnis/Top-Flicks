//
//  InformationViewController.swift
//  Top Flicks
//
//  Created by Rahul Sabnis on 1/7/17.
//  Copyright © 2017 Rahul Sabnis. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var textBox: UILabel!
    @IBOutlet weak var titleView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
