//
//  VimeoLinkViewController.swift
//  DraggableDemo
//
//  Created by farooq on 26/08/2019.
//  Copyright © 2019 Farooq Rasheed. All rights reserved.
//

import UIKit
import HCVimeoVideoExtractor
import AVFoundation
import AVKit

class VimeoLinkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://vimeo.com/253989945")!
        HCVimeoVideoExtractor.fetchVideoURLFrom(url: url, completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in
            if let err = error {
                print("Error = \(err.localizedDescription)")
                return
            }
            
            guard let vid = video else {
                print("Invalid video object")
                return
            }
            
            print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
            
            if let videoURL = vid.videoURL[.Quality360p] {
                let player = AVPlayer(url: videoURL)
                let playerController = AVPlayerViewController()
                playerController.allowsPictureInPicturePlayback = true
                playerController.player = player
                
                playerController.allowsPictureInPicturePlayback = true
                
//                player = AVPlayer(url: URL(fileURLWithPath: path))
                player.addObserver(self, forKeyPath: "rate", options: NSKeyValueObservingOptions.new, context: nil)
                self.present(playerController, animated: true) {
                    player.play()
                }
            }
        })
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "rate" {
//            if player.rate > 0 {
//                print("video started")
//            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
