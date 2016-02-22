//
//  WakeTableViewController.swift
//  eve4
//
//  Created by Daniel Pape on 20/01/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit

class WakeTableViewController: UITableViewController {
    
    let dateFormatter = NSDateFormatter()
    var minutesSinceMidnight:Int = 0
    var midnight:NSDate = NSDate()
    var daysInitialArray = [String]()
    var defaults = NSUserDefaults()
    var alarmDaysArray = [Int]()
    let daysTVC = daysTableViewController()
    var wakeTime = NSDate()
    var fileLocation = NSURL()
    
    @IBOutlet var confirmButton: UIButton!
    @IBOutlet var sleepPicker: UIDatePicker!
    @IBOutlet var wakeDaysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sleepPicker.setValue(UIColor.whiteColor(), forKeyPath: "textColor")
        
//        var alarmDaysArray = defaults.objectForKey("alarmDays") as! NSArray as! [Int]
        updateAlarmDaysArray()
        
        print("Wake days are \(alarmDaysArray)")
         createDaysString()
        print(daysInitialArray)
    }
    
    func createDaysString(){
        daysInitialArray.removeAll()
        for day in alarmDaysArray{
            if day == 1{
                daysInitialArray.append("M")
            }
            if day == 2{
                daysInitialArray.append("T")
            }
            if day == 3{
                daysInitialArray.append("W")
            }
            if day == 4{
                daysInitialArray.append("T")
            }
            if day == 5{
                daysInitialArray.append("F")
            }
            if day == 6{
                daysInitialArray.append("S")
            }
            if day == 7{
                daysInitialArray.append("S")
            }
        }
    }
    
    func updateAlarmDaysArray(){
        if (defaults.objectForKey("alarmDays")) == nil{
        alarmDaysArray = [1,2,3,4,5]
        }else{
        alarmDaysArray = defaults.objectForKey("alarmDays") as! NSArray as! [Int]
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        defaults.synchronize()
        updateAlarmDaysArray()
        createDaysString()
        let daysInitialLabelString = daysInitialArray.joinWithSeparator("")
        if daysInitialLabelString == "MTWTF" {
            wakeDaysLabel.text = "Weekdays"
        }else if daysInitialLabelString == "SS"{
            wakeDaysLabel.text = "Weekends"
        }else{
        wakeDaysLabel.text = daysInitialLabelString
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1{
            return 2
        }else{
            return 1
        }
    }
    
    func setReminder(alarmDay:[Int]){
        
        for day in alarmDay{
        let gregorian = NSCalendar.init(calendarIdentifier: NSCalendarIdentifierGregorian)
        let units: NSCalendarUnit = [.Year, .Month, .WeekOfYear, .Hour, .Minute, .Weekday]
        let components = gregorian?.components(units, fromDate: NSDate())
        
        let alarmComponents = gregorian?.components(units, fromDate: sleepPicker.date)
        print("Alarm Components are \(alarmComponents)")
        
        components?.weekday = day
        components?.hour = (alarmComponents?.hour)!
        components?.minute = (alarmComponents?.minute)!
        
        var alarmDate = gregorian?.dateFromComponents(components!)
        print("Alarm Date is \(alarmComponents)")
        
        if (alarmDate?.compare(NSDate()) == NSComparisonResult.OrderedAscending){
            alarmDate = alarmDate?.dateByAddingTimeInterval(60*60*24*7)
        }
        
        let wakeAlarm = UILocalNotification()
        
        wakeAlarm.fireDate = alarmDate
        //    wakeAlarm.repeatInterval =
        wakeAlarm.alertBody = "Time to get up!"
        //    mondayWakeAlarm.soundName = alarmNameString;
        wakeAlarm.repeatInterval = NSCalendarUnit.WeekOfYear
        
        UIApplication.sharedApplication().scheduleLocalNotification(wakeAlarm)
        
        print("Alarm set for \(wakeAlarm.fireDate)")
        }
        
    }
    
    @IBAction func tapConfirmButton(sender: AnyObject) {
        print("Reminder Set")
        setReminder(alarmDaysArray)
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
