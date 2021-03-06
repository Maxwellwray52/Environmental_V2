//
//  viewcontroller2ViewController.swift
//  firstpagedraft
//
//  Created by Max Wray on 11/20/15.
//  Copyright © 2015 Max Wray. All rights reserved.
//

import UIKit
import CoreData
import MobileCoreServices
class viewcontroller2ViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    //accesses managed object context
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
// outlets for images
    @IBOutlet weak var image1: UIImageView!//stonefly
    @IBOutlet weak var image2: UIImageView!//caddisfly
    @IBOutlet weak var image3: UIImageView!//beetle larvae
    @IBOutlet weak var image4: UIImageView!//mayfly
    @IBOutlet weak var image5: UIImageView!//water penny
    @IBOutlet weak var image6: UIImageView!//damsel fly
    @IBOutlet weak var image7: UIImageView!//dragon fly
    @IBOutlet weak var image8: UIImageView!//crane fly
    @IBOutlet weak var image9: UIImageView!//fingernail clam
    @IBOutlet weak var image10: UIImageView!//freshwater snail
    @IBOutlet weak var image11: UIImageView!//blackfly
    @IBOutlet weak var image12: UIImageView!//scud
    @IBOutlet weak var image13: UIImageView!//crayfish
    @IBOutlet weak var image14: UIImageView!//aquatic sowbug
    @IBOutlet weak var image15: UIImageView!//aquatic worm
    @IBOutlet weak var image16: UIImageView!//midge
    @IBOutlet weak var image17: UIImageView!//tubifex worm
   // outlets for textviews
    @IBOutlet weak var amount1: UITextField!//stonefly
    @IBOutlet weak var amount2: UITextField!//caddisfly
    @IBOutlet weak var amount3: UITextField!//beetle larvae
    @IBOutlet weak var amount4: UITextField!//mayfly
    @IBOutlet weak var amount5: UITextField!//water penny
    @IBOutlet weak var amount6: UITextField!//damsel fly
    @IBOutlet weak var amount7: UITextField!// dragon fly
    @IBOutlet weak var amount8: UITextField!//crane fly
    @IBOutlet weak var amount9: UITextField!// fingernail clam
    @IBOutlet weak var amount10: UITextField!// freshwater snail
    @IBOutlet weak var amount11: UITextField!// blackfly
    @IBOutlet weak var amount12: UITextField!//scud
    @IBOutlet weak var amount13: UITextField!//crayfish
    @IBOutlet weak var amount14: UITextField!//aquatic sowbug
    @IBOutlet weak var amount15: UITextField!//aquatic worm
    @IBOutlet weak var amount16: UITextField!//midge
    @IBOutlet weak var amount17: UITextField!//tubifex worm
    // outlet for save label
    @IBOutlet weak var saved2: UILabel!
    // variables that convert bug amount text to int
    var b1: Int = 0
    var b2: Int = 0
    var b3: Int = 0
    var b4: Int = 0
    var b5: Int = 0
    var b6: Int = 0
    var b7: Int = 0
    var b8: Int = 0
    var b9: Int = 0
    var b10: Int = 0
    var b11: Int = 0
    var b12: Int = 0
    var b13: Int = 0
    var b14: Int = 0
    var b15: Int = 0
    var b16: Int = 0
    var b17: Int = 0
    // intermediate variables
    var sensitive1: Int = 0
    var sensitive2: Int = 0
    var semisensitive1: Int = 0
    var semisensitive2: Int = 0
    var semitolerant1: Int = 0
    var semitolerant2: Int = 0
    var tolerant1: Int = 0
    var tolerant2: Int = 0
    // variable that stores tolerance value
    var Tindex: NSNumber = 0
    // array for tolerance index 
    //var ttracker: [Int] = []
    // array that stores data
    var bugstracker = [NSManagedObject]()
    // imageview that displays unknown organism
    @IBOutlet weak var mysterybug: UIImageView!
    // determines if images are new or old
    var newMedia: Bool?
    
    // action for saved entries button
    @IBAction func savedtwo(sender: AnyObject) {
        
        // creates entity description
        let entityDescription = NSEntityDescription.entityForName("Bugs", inManagedObjectContext: managedObjectContext)
        // second is an instance of the bugs identity
        let second = Bugs(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext)
        // attributes are set to values of the textfields
        second.bug1 = amount1.text!
        b1 = Int(second.bug1!)!
        second.bug2 = amount2.text!
        b2 = Int(second.bug2!)!
        second.bug3 = amount3.text!
        b3 = Int(second.bug3!)!
        second.bug4 = amount4.text!
        b4 = Int(second.bug4!)!
        second.bug5 = amount5.text!
        b5 = Int(second.bug5!)!
        second.bug6 = amount6.text!
        b6 = Int(second.bug6!)!
        second.bug7 = amount7.text!
        b7 = Int(second.bug7!)!
        second.bug8 = amount8.text! // text is a textfield property
        b8 = Int(second.bug8!)!
        second.bug9 = amount9.text!
        b9 = Int(second.bug9!)!
        second.bug10 = amount10.text!
        b10 = Int(second.bug10!)!
        second.bug11 = amount11.text!
         b11 = Int(second.bug11!)!
        second.bug12 = amount12.text!
         b12 = Int(second.bug12!)!
        second.bug13 = amount13.text!
        b13 = Int(second.bug13!)!
        second.bug14 = amount14.text!
        b14 = Int(second.bug14!)!
        second.bug15 = amount15.text!
        b15 = Int(second.bug15!)!
        second.bug16 = amount16.text!
        b16 = Int(second.bug16!)!
        second.bug17 = amount17.text!
        b17 = Int(second.bug17!)!
        // saves tolerance index
        second.tolerance = Tindex
        // accesses attribute from nsmanaged context using key value coding
        Tindex = (Bugs.valueForKey("tolerance") as? NSNumber!)!
        // saves Tindex into array
        //ttracker[0] = Tindex
        // saves data
        do {
            
            try managedObjectContext.save()
            //informs user of when entries are saved
            saved2.text = "Entries have been saved"
        }
        catch let error as NSError {
            // informs user if entries are not saved
            saved2.text = error.localizedFailureReason;  "please try again"
        }
    }
    // Calculates tolerance index
    func calculatetolerance(b1:Int,b2:Int,b3:Int,b4:Int,b5:Int,b6:Int,b7:Int, b8:Int, b9:Int, b10:Int,b11:Int, b12:Int,b13:Int,b14:Int, b15:Int,b16:Int, b17:Int) {
        // variables that calculate index for each group
        // several intermediate variables were recorded as xcode cannot handle arithmetic operations with many quantities
        //first 9 organisms are sensitive
        let sensitive1 = 1*(b1+b2)
        let sensitive2 = 1*(b3+b4)
        // next 6 organisms are semisensitive and are mutilplied by 2
        let semisensitive1 = 2*(b5+b6+b7)
         let semisensitive2 = 2*(b8+b9)
       // next 6 organisms are semitolerant and are multiplied by 3
        let semitolerant1 = 3*(b10+b11)
        let semitolerant2 = 3*(b12+b13)
        // last 6 oganisms are tolerant and are multiplied by 4
        let tolerant1 = 4*(b14+b15)
        let tolerant2 = 4*(b16+b17)
        // tolerance index is the sum of the groups divided by 27 organisms
       Tindex = (sensitive1 + sensitive2 + semisensitive1 + semisensitive2 + semitolerant1 + semitolerant2 + tolerant1 + tolerant2)/17
    }
    
    //loads camera to take pictures of unknown organisms
    @IBAction func unknown(sender: AnyObject) {
        // checks if device has a camera 
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            //assigns delegate 
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            // defines media source as camera
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            // array that stores media
            imagePicker.mediaTypes = [kUTTypeImage as String] // media is images only
            imagePicker.allowsEditing = false // no editing allowed
            // still images only
            self.presentViewController(imagePicker, animated: true, completion: nil)
            newMedia = true // images are new and not from the library
        }
    }
    // accesses camera library
    @IBAction func getlibrary(sender: AnyObject) {
        //checks if device has a library 
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum)
        {
            // assigns delegate 
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            // defines media source as library
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            // array stores media 
            imagePicker.mediaTypes = [kUTTypeImage as String] // media is images only
            imagePicker.allowsEditing = false // no editing
            // still images only
            self.presentViewController(imagePicker, animated: true, completion: nil)
            newMedia = false // images are old and from library
        }
    }
    // configures didFinishPickingMediaWithInfo this is called when image is taken and selected
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        self.dismissViewControllerAnimated(true, completion: nil)
        if mediaType.isEqualToString(kUTTypeImage as String) {
            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            mysterybug.image = image
            if (newMedia == true) {
                UIImageWriteToSavedPhotosAlbum(image, self, "image:didFinishSavingWithError:contextInfo", nil)
            }
        }
    }
    // dismisses image picker view and creates an alert for unsaved images and cancel button
    func image(image: UIImage, didFinishSavingWithError error:NSErrorPointer, contextInfo:UnsafePointer<Void>) {
        if error != nil {
            let alert = UIAlertController(title: "Save Failed", message: "Failed to save image", preferredStyle:UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "OK", style:.Cancel, handler: nil)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated:true, completion:nil)
        }
    }
    // cancels imagepicking session without saving or taking a pic
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    // uploads images to respective image views code obtained from ios8cookbook safaribooksonline
    let stoneflypic = UIImage(named: "stonefly") // variable to access picture of stonefly from my computer
    let caddisflypic = UIImage(named: "caddisfly")
    let blarvaepic = UIImage(named: "beetlelarvae")
    let mayflypic = UIImage(named: "mayfly")
    let waterpennypic = UIImage(named: "waterpenny")
    let damselflypic = UIImage(named: "damsel fly")
    let dragonflypic = UIImage(named: " dragon fly")
    let craneflypic = UIImage(named: "Cranefly")
    let clampic = UIImage(named: "Fingernail Clam")
    let snailpic = UIImage(named: "watersnail")
    let blackflypic = UIImage(named: "black fly")
    let scudpic = UIImage(named: "Scud")
    let crayfishpic = UIImage(named: "Crayfish")
    let sowbugpic = UIImage(named: "Aquatic sowbug")
    let aquaticwormpic = UIImage(named: "Aquaticworm")
    let midgepic = UIImage(named: "midge")
    let tubifexpic = UIImage(named: "tubifexworm")
//}
    override func viewDidLoad() {
       super.viewDidLoad()
image1.image = stoneflypic // image view is populated with stone fly picture
        image1.addSubview(image1) // displays stonefly picture on second page
        // view.addSubview was changed to image1.addSubview
        image2.image = caddisflypic
        image2.addSubview(image2)
        image3.image = blarvaepic
        image3.addSubview(image3)
        image4.image = mayflypic
        image4.addSubview(image4)
        image5.image = waterpennypic
        image5.addSubview(image5)
        image6.image = damselflypic
        image6.addSubview(image6)
        image7.image = dragonflypic
        image7.addSubview(image7)
        image8.image = craneflypic
        image8.addSubview(image8)
        image9.image = clampic
        image9.addSubview(image9)
        image10.image = snailpic
        image10.addSubview(image10)
        image11.image = blackflypic
        image11.addSubview(image11)
        image12.image = scudpic
        image12.addSubview(image12)
        image13.image = crayfishpic
        image13.addSubview(image13)
        image14.image = sowbugpic
        image14.addSubview(image14)
        image15.image = aquaticwormpic
        image15.addSubview(image15)
        image16.image = midgepic
        image16.addSubview(image16)
        image17.image = tubifexpic
        image17.addSubview(image17)
        // fetches data
        //accesses application delegate to obtain managed object context
         let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedcontext = appdelegate.managedObjectContext
        // fetch request 
        let fetchrequest = NSFetchRequest(entityName: "Bugs")
        // filters request to return tolerance value
        let tolerancepredicate = NSPredicate(format:"tolerance >=0")
        (bugstracker as NSArray).filteredArrayUsingPredicate(tolerancepredicate)
        do {
            let results = try managedcontext.executeFetchRequest(fetchrequest)
            bugstracker = results as! [NSManagedObject]
        } catch let error as NSError {
            print(" Could not fetch \(error), \(error.userInfo)")
        }
        }
        
        
        // Do any additional setup after loading the view.
}

   // override func didReceiveMemoryWarning() {
     //   super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

//}
