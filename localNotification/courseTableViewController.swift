//
//  courseTableViewController.swift
//  eve4
//
//  Created by Daniel Pape on 21/01/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit
import AVFoundation

class courseTableViewController: UITableViewController {

    @IBOutlet weak var actionButton: UIButton!
    
    var localPath: NSURL?
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (localPath == nil){
            actionButton.setTitle("Download", forState: .Normal)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
//    func downloadURL(url:String){
//        Alamofire.download(.GET,
//            url,
//            destination: { (temporaryURL, response) in
//                let directoryURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
//                let pathComponent = response.suggestedFilename
//                
//                self.localPath = directoryURL.URLByAppendingPathComponent(pathComponent!)
//                return self.localPath!
//        })
//            .response { (request, response, _, error) in
//                print(response)
//                print("Downloaded file to \(self.localPath!)")
//                self.actionButton.setTitle("Play", forState: .Normal)
//        }
//    }
    
//    @IBAction func tapActionButton(sender: AnyObject) {
//        if (localPath == nil){
//                    downloadURL("https://www.danielpape.co.uk/sleepwell/01_06.mp3")
//        }else{
//            do{
//                audioPlayer = try AVAudioPlayer(contentsOfURL: localPath!)
//            }catch{
//                print(error)
//            }
//            audioPlayer.play()
//        }
//    }
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
