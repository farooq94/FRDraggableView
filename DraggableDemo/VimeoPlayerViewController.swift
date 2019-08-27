//
//  VimeoPlayerViewController.swift
//  DraggableDemo
//
//  Created by Farooq Rasheed on 8/7/19.
//  Copyright © 2019 Farooq Rasheed. All rights reserved.
//

import UIKit
class VimeoPlayerViewController: UIViewController {

    @IBOutlet weak var playerHolderView: UIView!
    
    
    
    var video: TRVideoView!
    var urlString = "https://vimeo.com/344735055"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewDidAppear(_ animated: Bool) {
//        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
//            self.playVideo(url: self.urlString)
//        })
        playVideo(url: urlString)
    }

    func playVideo(url: String) {
        video = TRVideoView(text: url)
//        let video = TRVideoView(text: "https://vimeo.com/139785390")
        video.frame = CGRect(x: 0, y: 0, width: playerHolderView.frame.width, height: playerHolderView.frame.height)
        video.backgroundColor = .black
        playerHolderView.addSubview(video)
        view.layoutIfNeeded()
    }
    
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func minimizeButtonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "PIPViewController") as! PIPViewController
        vc.webView = video
        PIPKit.show(with: vc) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
