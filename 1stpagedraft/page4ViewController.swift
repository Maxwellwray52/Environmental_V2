//
//  page4ViewController.swift
//  firstpagedraft
//
//  Created by Max Wray on 1/5/16.
//  Copyright © 2016 Max Wray. All rights reserved.
//

import UIKit
import CoreData

class page4ViewController: UIViewController {
    @IBOutlet weak var displayhealth: UILabel!
    @IBOutlet weak var displaytolerance: UILabel!
    
    // temporary variables to store index values 
    var tretrieve: NSNumber = 0.0
    var hretrieve: NSNumber = 0.0
    
// fetches data from 3rd page
   // let request = NSFetchRequest(entityName:"Habitat")
  //  request.entity = entityDescription
 //   var error: NSError?
    // retrieves data in an array
   // var results = ManagedObjectContext?.executeFetchRequest(request,error: &error)
  //  let match = results[0] as! NSManagedObject
  //  let healthind = match.valueforKey("hindex") as! Double
   // displayhealth.text = "Health index is \(healthind)"
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
