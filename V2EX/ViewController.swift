//
//  ViewController.swift
//  V2EX
//
//  Created by ZhangFan on 15/12/29.
//  Copyright © 2015年 ZhangFan. All rights reserved.
//

import UIKit
import pop
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var aView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func doAnimation(sender:UIBarButtonItem){
        let a:POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPViewFrame);
        a.springSpeed = 3;
        a.springBounciness = 1;
        a.velocity = 0
        a.toValue = NSValue(CGRect:CGRectMake(0, 64, 100, 100));
//        a.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut);
        aView.pop_addAnimation(a, forKey: "frameAnimation");
    }
    
    @IBAction func doNetworking(sender:UIButton){
        Alamofire.request(.GET, "http://mportal.xiu.com/test/getMobileVerifyCode?mobile=13421807391")
            .responseJSON{(response, JSON, error) in
                let dic:NSDictionary = error.value as! NSDictionary   // result of response serialization
                print(dic["result"]);
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
        }
        

    }
    
    
}

