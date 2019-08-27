//
//  wViewController.swift
//  DraggableDemo
//
//  Created by Farooq Rasheed on 8/7/19.
//  Copyright © 2019 Farooq Rasheed. All rights reserved.
//

import UIKit
import FRCustomPIPViewController

class PIPViewController: UIViewController, PIPUsable {
    
    @IBOutlet weak var playerHolderView: UIView!
    @IBOutlet weak var shadowView: UIView!
    var webView: TRVideoView?
    var initialState: PIPState { return .pip }
    var pipHeight: CGFloat = 200.0
    var pipSize: CGSize {
        if view.frame.width == (UIApplication.shared.keyWindow!.frame.width - 20){
            return CGSize(width: view.frame.width, height: pipHeight)
        }else{
            return CGSize(width: view.frame.width-20, height: pipHeight)
        }
    }
    var initialPosition: PIPPosition { return .topCenter }
    
    override func viewDidAppear(_ animated: Bool) {
        webView?.frame = CGRect(x: 0, y: 0, width: playerHolderView.frame.width, height: playerHolderView.frame.height)
        playerHolderView.addSubview(webView!)
        shadowView.applyShadow(cornerRadius: 10)
        view.applyShadow(cornerRadius: 10)
    }
    @IBAction func dismissPIP(_ sender: UIButton) {
        PIPKit.dismiss(animated: true)
    }
    @IBAction func maximizeTapped(_ sender: UIButton) {
        if PIPKit.isPIP {
            animateHolderToMaximize()
        } else {
            animateHolderToMinimize()
        }
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        if PIPKit.isPIP {
            animateHolderToMaximize()
        } else {
            animateHolderToMinimize()
        }
    }
    
    func didChangedState(_ state: PIPState) {
        switch state {
        case .pip:
            print("PIPViewController.pip")
        case .full:
            print("PIPViewController.full")
        }
    }
    
    func animateHolderToMaximize() {
        let window = UIApplication.shared.keyWindow
        UIView.animate(withDuration: 0.2) {
            self.stopPIPMode()
            self.playerHolderView.frame = CGRect(x: 0 , y: 0, width: self.view.frame.width, height: window!.frame.height)
            let center = CGPoint(x: 0, y: (window!.frame.height/2)-100)
            let webViewFrame = CGRect(origin: center, size: CGSize(width: self.view.frame.width-20, height: 200))
            self.webView?.frame = webViewFrame
            self.view.layoutIfNeeded()
        }
    }
    func animateHolderToMinimize() {
        let window = UIApplication.shared.keyWindow
        let y = (window!.frame.height/2)-100
        UIView.animate(withDuration: 0.2) {
//            self.playerHolderView.frame = CGRect(x: 0 , y: 0, width: self.view.frame.width, height: window!.frame.height)
            self.startPIPMode()
            let center = CGPoint(x: 0, y: y)
            let webViewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            self.webView?.frame = webViewFrame
            self.view.layoutIfNeeded()
        }
    }
    func setGradient() {
        shadowView.applyShadow(cornerRadius: 20)
    }
}
