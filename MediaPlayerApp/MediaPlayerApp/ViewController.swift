//
//  ViewController.swift
//  MediaPlayerApp
//
//  Created by mac on 12/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {

    var myplayer = AVPlayerViewController()
    var playerobj = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btn_auPlayer(_ sender: Any) {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "song", ofType: "mp3") ?? "")
        playerobj = AVPlayer(url: path)
        myplayer.player = playerobj
        playerobj.play()
        playerobj.volume = 30.0
        present(myplayer , animated: true , completion: nil)
        
    }
    
    @IBAction func btn_video(_ sender: Any) {
        let path = URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4") ?? "")
        playerobj = AVPlayer(url: path)
        myplayer.player = playerobj
        playerobj.play()
        playerobj.volume = 30.0
        present(myplayer , animated: true , completion: nil)
    }
    
}

