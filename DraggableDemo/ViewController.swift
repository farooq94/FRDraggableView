//
//  ViewController.swift
//  DraggableDemo
//
//  Created by Farooq Rasheed on 8/7/19.
//  Copyright © 2019 Farooq Rasheed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func simpleVideoButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func vimeoVideoButtonTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "VimeoPlayerViewController") as! VimeoPlayerViewController
        present(vc, animated: true, completion: nil)
    }
}

extension UIView{
    func applyShadow(cornerRadius: CGFloat) {
        // set the corner radius
//        layer.cornerRadius = cornerRadius
//        layer.masksToBounds = true
        // set the shadow properties
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 5.0)
//        layer.shadowOpacity = 1
//        layer.shadowRadius = 10.0
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//


        let shadowSize: CGFloat = 20

        let contactRect = CGRect(x: -shadowSize,
                                 y: frame.height - (shadowSize * 0.4),
                                 width: frame.width + shadowSize * 2,
                                 height: shadowSize)
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowRadius = 10
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
    }
    func roundCorners(cornerRadius: CGFloat) {
        // set the corner radius
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        // set the shadow properties
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 1.0)
//        layer.shadowOpacity = 0.2
//        layer.shadowRadius = 4.0
//        let shadowLayer =
//            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
//        layer.shouldRasterize = true
//        layer.rasterizationScale = UIScreen.main.scale

    }
}
