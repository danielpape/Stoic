//
//  ViewController.swift
//  localNotification
//
//  Created by Daniel Pape on 20/02/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var toolbar: UIToolbar!
    
    @IBOutlet var wakePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        toolbar.barTintColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapSetAlarmButton(sender: AnyObject) {
        setAlarm(4)
    }
    
    func requestPermissionForNotifications(){
    // Register for notification: This will prompt for the user's consent to receive notifications from this app.
    let notificationSettings = UIUserNotificationSettings()
    //*NOTE*
    // Registering UIUserNotificationSettings more than once results in previous settings being overwritten.
    UIApplication.sharedApplication().registerUserNotificationSettings(notificationSettings)
    }
    
    func scheduleLocalNotification(dateForNotification:NSDate) {
        // Create reminder by setting a local notification
        let localNotification = UILocalNotification() // Creating an instance of the notification.
        localNotification.alertTitle = "Notification Title"
        localNotification.alertBody = "Alert body to provide more details"
        localNotification.alertAction = "ShowDetails"
        localNotification.fireDate = dateForNotification
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.soundName = UILocalNotificationDefaultSoundName // Use the default notification tone/ specify a file in the application bundle
        localNotification.applicationIconBadgeNumber = 1 // Badge number to set on the application Icon.
        localNotification.category = "reminderCategory" // Category to use the specified actions
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification) // Scheduling the notification.
    }
    
    func setAlarm(alarmDay:Int){
    let gregorian = NSCalendar.init(calendarIdentifier: NSCalendarIdentifierGregorian)
        let units: NSCalendarUnit = [.Year, .Month, .WeekOfYear, .Hour, .Minute, .Weekday]
    let components = gregorian?.components(units, fromDate: NSDate())
        
    let alarmComponents = gregorian?.components(units, fromDate: wakePicker.date)
        print("Alarm Components are \(alarmComponents)")
    
    components?.weekday = 2
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
    
    
    @IBAction func tapWakeButton(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func tapSleepButton(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction func tapSettingsButton(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 2
    }

    

}

