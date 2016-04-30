//
//  BestSwitchViewController.swift
//  iKid
//
//  Created by apple on 4/29/16.
//  Copyright © 2016 apple. All rights reserved.
//

import UIKit

class BestSwitchViewController: UIViewController {
    
    private var firstViewController : BestFirstViewController!
    private var secondViewController : BestSecondViewController!
    
    private func firstBuilder() {
        if firstViewController == nil { firstViewController =
            storyboard?.instantiateViewControllerWithIdentifier("BestFirst")
            as! BestFirstViewController
        }
    }
    private func secondBuilder() {
        if secondViewController == nil { secondViewController =
            storyboard?.instantiateViewControllerWithIdentifier("BestSecond")
            as! BestSecondViewController
        }
    }
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        secondBuilder()
        firstBuilder()
        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(firstViewController, to: secondViewController)
        } else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(secondViewController, to: firstViewController)
        }
    }
    
    private func switchViewController(from: UIViewController?, to:
        UIViewController?) {
        if from != nil {
            from!.willMoveToParentViewController(nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, atIndex: 0)
            to!.didMoveToParentViewController(self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
