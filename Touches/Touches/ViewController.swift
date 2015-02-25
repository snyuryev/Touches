//
//  ViewController.swift
//  Touches
//
//  Created by Sergey Yuryev on 29/01/15.
//  Copyright (c) 2015 snyuryev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK - Outlets
    
    @IBOutlet weak var methodLabel: UILabel!
    @IBOutlet weak var touchesLabel: UILabel!
    @IBOutlet weak var tapsLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!

    @IBOutlet weak var xViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var yViewConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println("x: \(xViewConstraint.constant)")
        println("y: \(yViewConstraint.constant)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        let touchCount = touches.count
        let touch = touches.anyObject() as UITouch
        let tapCount = touch.tapCount
        let point = touch.locationInView(self.view)
        
        updateLabels(methodString: "touchesBegan", touchesString: "\(touchCount) touches", tapsString: "\(tapCount) taps", xString: "\(point.x)", yString: "\(point.y)")
        moveView(point)
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        let touchCount = touches.count
        let touch = touches.anyObject() as UITouch
        let tapCount = touch.tapCount
        let point = touch.locationInView(self.view)
        
        updateLabels(methodString: "touchesMoved", touchesString: "\(touchCount) touches", tapsString: "\(tapCount) taps", xString: "\(point.x)", yString: "\(point.y)")
        moveView(point)
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        let touchCount = touches.count
        let touch = touches.anyObject() as UITouch
        let tapCount = touch.tapCount
        let point = touch.locationInView(self.view)
        
        updateLabels(methodString: "touchesEnded", touchesString: "\(touchCount) touches", tapsString: "\(tapCount) taps", xString: "\(point.x)", yString: "\(point.y)")
        moveView(point)
    }
    
    func updateLabels (#methodString: String, touchesString: String, tapsString: String, xString: String, yString: String) {
        methodLabel.text = methodString
        touchesLabel.text = touchesString
        tapsLabel.text = tapsString
        xLabel.text = xString
        yLabel.text = yString
    }
    
    func moveView(center: CGPoint) {

        let viewCenterX = self.view.frame.width / 2
        let viewCenterY = self.view.frame.height / 2
        
        let newX = viewCenterX - center.x
        let newY = viewCenterY - center.y
        
        UIView.animateWithDuration(0.0, delay: 0.0, options: .BeginFromCurrentState, animations: { () -> Void in
            self.xViewConstraint.constant = newX
            self.yViewConstraint.constant = newY
            }, completion: { (Bool finished) -> Void in
                println("x: \(self.xViewConstraint.constant)")
                println("y: \(self.yViewConstraint.constant)")}
        )
    }

}

