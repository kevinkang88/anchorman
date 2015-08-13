//
//  ResultViewController.swift
//  Anchor Man
//
//  Created by dong yoon kang on 8/12/15.
//  Copyright (c) 2015 yoon kevin kang. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var forecastLabel: UILabel!
    
    var forecast = ""
    var cityName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.cityLabel.text = self.cityName
        self.forecastLabel.text = self.forecast
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
