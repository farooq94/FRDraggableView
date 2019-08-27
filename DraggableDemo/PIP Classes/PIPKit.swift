////
////  PIPKit.swift
////  DraggableDemo
////
////  Created by Farooq Rasheed on 8/7/19.
////  Copyright © 2019 Farooq Rasheed. All rights reserved.
////
//
//
//import Foundation
//import UIKit
//
//public enum PIPState {
//    case pip
//    case full
//}
//
//public enum PIPPosition {
//    case topLeft
//    case middleLeft
//    case bottomLeft
//    case topRight
//    case middleRight
//    case bottomRight
//    case topCenter
//    case middleCenter
//    case bottomCenter
//}
//
//enum _PIPState {
//    case none
//    case pip
//    case full
//    case exit
//}
//
//public typealias PIPKitViewController = (UIViewController & PIPUsable)
//
//public final class PIPKit {
//    
//    static public var isActive: Bool { return rootViewController != nil }
//    static public var isPIP: Bool { return state == .pip }
//    static public var visibleViewController: PIPKitViewController? { return rootViewController }
//    
//    static internal var state: _PIPState = .none
//    static private var rootViewController: PIPKitViewController?
//    
//    public class func show(with viewController: PIPKitViewController, completion: (() -> Void)? = nil) {
//        guard let window = UIApplication.shared.keyWindow else {
//            return
//        }
//        
//        guard !isActive else {
//            dismiss(animated: false) {
//                PIPKit.show(with: viewController)
//            }
//            return
//        }
//        
//        rootViewController = viewController
//        state = (viewController.initialState == .pip) ? .pip : .full
//        
//        viewController.view.alpha = 0.0
//        window.addSubview(viewController.view)
//        viewController.setupEventDispatcher()
//        
//        UIView.animate(withDuration: 0.25, animations: {
//            PIPKit.rootViewController?.view.alpha = 1.0
//        }) { (_) in
//            completion?()
//        }
//    }
//    
//    public class func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
//        state = .exit
//        rootViewController?.pipDismiss(animated: animated, completion: {
//            PIPKit.reset()
//            completion?()
//        })
//    }
//    
//    // MARK: - Internal
//    class func startPIPMode() {
//        guard let rootViewController = rootViewController else {
//            return
//        }
//        
//        // PIP
//        state = .pip
//        rootViewController.pipEventDispatcher?.enterPIP()
//    }
//    
//    class func stopPIPMode() {
//        guard let rootViewController = rootViewController else {
//            return
//        }
//        
//        // fullScreen
//        state = .full
//        rootViewController.pipEventDispatcher?.enterFullScreen()
//    }
//    
//    // MARK: - Private
//    private static func reset() {
//        PIPKit.state = .none
//        PIPKit.rootViewController = nil
//    }
//    
//}
//extension UIView{
//    func applyShadow(cornerRadius: CGFloat) {
//        // set the corner radius
////        layer.cornerRadius = cornerRadius 
////        layer.masksToBounds = true
//        // set the shadow properties
////        layer.shadowColor = UIColor.black.cgColor
////        layer.shadowOffset = CGSize(width: 0, height: 5.0)
////        layer.shadowOpacity = 1
////        layer.shadowRadius = 10.0
////        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
////
//        
//        
//        let shadowSize: CGFloat = 20
//        
//        let contactRect = CGRect(x: -shadowSize,
//                                 y: frame.height - (shadowSize * 0.4),
//                                 width: frame.width + shadowSize * 2,
//                                 height: shadowSize)
//        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
//        layer.shadowRadius = 10
//        layer.shadowOpacity = 1
//        layer.shadowOffset = .zero
//    }
//    func roundCorners(cornerRadius: CGFloat) {
//        // set the corner radius
//        layer.cornerRadius = cornerRadius
//        layer.masksToBounds = true
//        // set the shadow properties
////        layer.shadowColor = UIColor.black.cgColor
////        layer.shadowOffset = CGSize(width: 0, height: 1.0)
////        layer.shadowOpacity = 0.2
////        layer.shadowRadius = 4.0
////        let shadowLayer =
////            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
////        layer.shouldRasterize = true
////        layer.rasterizationScale = UIScreen.main.scale
//        
//    }
//}
