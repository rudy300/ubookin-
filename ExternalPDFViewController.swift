//
//  ExternalPDFViewController.swift
//  MyFilesSwift9
//
//  Created by cis290 on 10/17/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//

import UIKit

class ExternalPDFViewController: UIViewController {

    
    @IBAction func btnback(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBOutlet weak var webview: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //https://www.google.com/maps/@42.3082038,-88.9971766,17z
        LoadExternalPDF()
        
        // Do any additional setup after loading the view.
    }
    
    func LoadExternalPDF()
    {
        //webview.loadLocalPDF("testers")
        webview.loadExternalPDF("https://www.google.com/maps/@42.3082038,-88.9971766,17z")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
