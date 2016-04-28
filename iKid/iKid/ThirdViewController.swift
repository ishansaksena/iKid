//
//  ThirdViewController.swift
//  iKid
//
//  Created by Ishan Saksena on 4/27/16.
//  Copyright © 2016 Ishan Saksena. All rights reserved.
//

import UIKit

// Knock Knock
class ThirdViewController: UIViewController {

    private var questionViewController : QuestionViewController!
    private var punchlineViewController : Punchline!
    
    // Instantiates
    private func punchlineVCBuilder() {
        if punchlineViewController == nil {
            punchlineViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("punchline")
                as! Punchline
        }
    }
    
    
    // Instantiates
    private func questionVCBuilder() {
        if questionViewController == nil {
            questionViewController =
                storyboard?
                    .instantiateViewControllerWithIdentifier("question")
                as! QuestionViewController
        }
    }
    
    
    @IBAction func switchViews(sender: UIBarButtonItem) {
        
        punchlineVCBuilder()
        questionVCBuilder()
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.EaseInOut)
        
        if questionViewController != nil &&
            questionViewController?.view.superview != nil {
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            punchlineViewController.view.frame = view.frame
            switchViewController(questionViewController, to: punchlineViewController)
        }
        else {
            UIView.setAnimationTransition(.FlipFromLeft, forView: view, cache: true)
            questionViewController.view.frame = view.frame
            switchViewController(punchlineViewController, to: questionViewController)
        }
        UIView.commitAnimations()
    }
    
    private func switchViewController(from: UIViewController?, to: UIViewController?) {
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
