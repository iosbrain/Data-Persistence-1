//
//  ViewController.swift
//  Data Persistence 1
//
//  Created by Andrew Jaffee on 2/17/17.
/*
 
 Copyright (c) 2017 Andrew L. Jaffee, microIT Infrastructure, LLC, and
 iosbrain.com.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
 
*/

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var backgroundViewColorSwitch: UISwitch!
    
    @IBOutlet weak var useMetricSwitch: UISwitch!
    
    @IBOutlet weak var distanceMeasureLabel: UILabel!
    
    // this is an array of colors
    let arrayColorList = ["red", "green", "blue"]
    
    // MARK: - UIViewController delegate
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // get a copy of the shared NSUserDefaults object so we can
        // use short-hand and save some typing
        let userDefaults = UserDefaults.standard

        /*
         
        This is an alternative methodology for reading a default value, It
        returns a value of "true" if it finds a key/value pair; it returns false if no default is
        found, which to me, leaves too much open to question. You decide.
         
        let isViewBackgroundColorOn:Bool = userDefaults.bool(forKey: "backgroundViewColorOn")
        
        if isViewBackgroundColorOn
        {
        */
        
        // if we find a preference for "backgroundViewColorOn" then read its value
        if let isViewBackgroundColorOn:Bool = userDefaults.value(forKey: "backgroundViewColorOn") as! Bool?
        {
            if isViewBackgroundColorOn
            {
                backgroundView.backgroundColor = UIColor.lightGray
                backgroundViewColorSwitch.isOn = true
            }
            else
            {
                backgroundView.backgroundColor = UIColor.clear
                backgroundViewColorSwitch.isOn = false
            }
        }
        else // no preference was found so we set a default value
        {
            backgroundView.backgroundColor = UIColor.clear
            backgroundViewColorSwitch.isOn = false
            userDefaults.set(false, forKey: "backgroundViewColorOn")
            userDefaults.synchronize()
        }
        
        // if we find a preference for "measurementType" then read its value
        if let isMeasureType:String = userDefaults.value(forKey: "measurementType") as! String?
        {
            if isMeasureType == "meters"
            {
                distanceMeasureLabel.text = "meters"
                useMetricSwitch.isOn = true
            }
            else
            {
                distanceMeasureLabel.text = "feet"
                useMetricSwitch.isOn = false
            }
        }
        else // no preference was found so we set a default value
        {
            distanceMeasureLabel.text = "feet"
            useMetricSwitch.isOn = false
            userDefaults.set("feet", forKey: "measurementType")
            userDefaults.synchronize()
        }
        
    } // end viewDidLoad()
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Manage user interactions
    
    @IBAction func backgroundColorSwitchChanged(_ sender: Any)
    {
        let userDefaults = UserDefaults.standard
        
        // "Any can represent an instance of any type at all."
        // Since we created this IBAction by dragging from 
        // a UISwitch, we can be certain that the "sender"
        // is a UISwitch, so we force downcast and unwrap.
        let swtich:UISwitch = sender as! UISwitch
        
        if swtich.isOn
        {
            // since switch is on, set background color
            backgroundView.backgroundColor = UIColor.lightGray
            // save the switch's "on" value to NSUserDefaults
            userDefaults.set(true, forKey: "backgroundViewColorOn")
            // force save of NSUserDefaults to disk...
            // "Because this method is automatically invoked
            // at periodic intervals, use this method only if you
            // cannot wait for the automatic synchronization
            // (for example, if your application is about to exit)
            // or if you want to update the user defaults to what is on
            // disk even though you have not made any changes."
            userDefaults.synchronize()
        }
        else
        {
            // since switch is off, clear background color
            backgroundView.backgroundColor = UIColor.clear
            // save the switch's "off" value to NSUserDefaults
            userDefaults.set(false, forKey: "backgroundViewColorOn")
            // force save of NSUserDefaults to disk...
            // "Because this method is automatically invoked 
            // at periodic intervals, use this method only if you 
            // cannot wait for the automatic synchronization 
            // (for example, if your application is about to exit) 
            // or if you want to update the user defaults to what is on 
            // disk even though you have not made any changes."
            userDefaults.synchronize()
        }
    } //end backgroundColorSwitchChanged
    
    @IBAction func useMetricSwitchChanged(_ sender: Any)
    {
        let userDefaults = UserDefaults.standard
        
        // "Any can represent an instance of any type at all."
        // Since we created this IBAction by dragging from
        // a UISwitch, we can be certain that the "sender"
        // is a UISwitch, so we force downcast and unwrap.
        let swtich:UISwitch = sender as! UISwitch
        
        if swtich.isOn
        {
            distanceMeasureLabel.text = "meters"
            userDefaults.set("meters", forKey: "measurementType")
            userDefaults.synchronize()
        }
        else
        {
            distanceMeasureLabel.text = "feet"
            userDefaults.set("feet", forKey: "measurementType")
            userDefaults.synchronize()
        }
    } // end useMetricSwitchChanged
        
} // end ViewController

