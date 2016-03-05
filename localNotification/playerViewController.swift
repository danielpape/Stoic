//
//  playerViewController.swift
//  eve4
//
//  Created by Daniel Pape on 24/01/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit
import AVFoundation

class playerViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer = AVAudioPlayer()
    var currentlyplaying:Bool = true
    
    let defaults = NSUserDefaults()
    
    @IBOutlet var sessionNameLabel: UILabel!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let audioPath = NSURL()
        let pathString = defaults.objectForKey("fileLocation") as! String
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOfURL: audioPath)
        }catch{
            print(error)
        }
        audioPlayer.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapPlayerButton(sender: AnyObject) {
        if currentlyplaying{
            currentlyplaying = false
            audioPlayer.pause()
            playButton.setTitle("Play", forState: UIControlState.Normal)
        }else{
            currentlyplaying = true
            audioPlayer.play()
            playButton.setTitle("Pause", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func slideVolumeSlider(sender: AnyObject) {
        audioPlayer.volume = volumeSlider.value
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
