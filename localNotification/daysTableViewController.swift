//
//  daysTableViewController.swift
//  eve4
//
//  Created by Daniel Pape on 26/01/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit

class daysTableViewController: UITableViewController {
    
    @IBOutlet var mondaySwitch: UISwitch!
    @IBOutlet var tuesdaySwitch: UISwitch!
    @IBOutlet var wednesdaySwitch: UISwitch!
    @IBOutlet var thursdaySwitch: UISwitch!
    @IBOutlet var fridaySwitch: UISwitch!
    @IBOutlet var saturdaySwitch: UISwitch!
    @IBOutlet var sundaySwitch: UISwitch!
    
    var mondayAlarm = Bool()
    var tuesdayAlarm = Bool()
    var wednesdayAlarm = Bool()
    var thursdayAlarm = Bool()
    var fridayAlarm = Bool()
    var saturdayAlarm = Bool()
    var sundayAlarm = Bool()

    var alarmDaysArray = [Int]()
    
    var defaults = NSUserDefaults()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if defaults.objectForKey("alarmDays") == nil{
            alarmDaysArray = [1,2,3,4,5]
        }else{
        alarmDaysArray = defaults.objectForKey("alarmDays") as! NSArray as! [Int]
        }
        
        if alarmDaysArray.contains(1){
            mondaySwitch.on = true
        }
        if alarmDaysArray.contains(2){
            tuesdaySwitch.on = true
        }
        if alarmDaysArray.contains(3){
            wednesdaySwitch.on = true
        }
        if alarmDaysArray.contains(4){
            thursdaySwitch.on = true
        }
        if alarmDaysArray.contains(5){
            fridaySwitch.on = true
        }
        if alarmDaysArray.contains(6){
            saturdaySwitch.on = true
        }
        if alarmDaysArray.contains(7){
            sundaySwitch.on = true
        }
        
//        selectOnlyWeekdays()
        
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
        return 7
    }
    
    func selectOnlyWeekdays() {
        let weekdaysArray:[UISwitch] = [mondaySwitch,tuesdaySwitch,wednesdaySwitch,thursdaySwitch,fridaySwitch]
        
        for day in weekdaysArray{
            day.setOn(true, animated: false)
        }

    }
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        print("Back button pressed")
        
        alarmDaysArray.removeAll()
        
        if mondaySwitch.on == true {
            alarmDaysArray.append(1)
        }
        if tuesdaySwitch.on == true {
            alarmDaysArray.append(2)
        }
        if wednesdaySwitch.on == true {
            alarmDaysArray.append(3)
        }
        if thursdaySwitch.on == true {
            alarmDaysArray.append(4)
        }
        if fridaySwitch.on == true {
            alarmDaysArray.append(5)
        }
        if saturdaySwitch.on == true {
            alarmDaysArray.append(6)
        }
        if sundaySwitch.on == true {
            alarmDaysArray.append(7)
        }
        
        let defaults = NSUserDefaults()
        
        defaults.setObject(alarmDaysArray, forKey: "alarmDays")
        defaults.synchronize()
        print(alarmDaysArray)
    }

    

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
