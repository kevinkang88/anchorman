//
//  ViewController.swift
//  Anchor Man
//
//  Created by dong yoon kang on 8/10/15.
//  Copyright (c) 2015 yoon kevin kang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var cityTextField: UITextField!

    @IBOutlet var statusLabel: UILabel!
    
    var currentWeatherForecast = ""
    
    func showError(){
        statusLabel.text = "Cannot locate your city"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func findTappede(sender: AnyObject) {
        NSLog("find button tapped, begin search")
        var url = NSURL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text.stringByReplacingOccurrencesOfString(" ", withString: "-") + "/forecasts/latest")
        if(url != nil){
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
                
                var urlError = false
                
                var weather = ""
                
                if error == nil {
                    var urlContent = NSString(data: data , encoding: NSUTF8StringEncoding)
                    println(urlContent)
                    var urlContentArray = urlContent?.componentsSeparatedByString("<span class=\"phrase\">")
                    
                    if urlContentArray!.count > 1 {
                        var weatherArray = urlContentArray![1].componentsSeparatedByString("</span>")
                        weather = weatherArray[0] as! String
                        weather = weather.stringByReplacingOccurrencesOfString("&deg;", withString: "º")
                        
                    }else {
                        urlError = true
                    }
                    
                } else{
                    urlError = true
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    if urlError == true {
                        self.showError()
                    }else{
                        self.currentWeatherForecast = weather
                        // present results VC
                        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                        let viewController = storyBoard.instantiateViewControllerWithIdentifier("ResultViewController") as! ResultViewController
                        viewController.forecast = weather
                        viewController.cityName = self.cityTextField.text
                        self.cityTextField.text = ""
                        self.presentViewController(viewController, animated: true, completion: nil)
                        
                    }
                })
                
                
                
            })
            
            task.resume()
        }else{
            self.showError()
        }

    }
}

