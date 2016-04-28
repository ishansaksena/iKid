//
//  questionViewController.swift
//  iKid
//
//  Created by Ishan Saksena on 4/27/16.
//  Copyright © 2016 Ishan Saksena. All rights reserved.
//

import UIKit

// Puns
class FirstViewController: UIViewController {
    
    private var questionViewController : QuestionViewController!
    private var punchlineViewController : Punchline!
    private var jokeIndex: Int = 0
    private var jokes = punJokes
    
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
        
        // to punchline
        if questionViewController != nil &&
            questionViewController?.view.superview != nil {
            punchlineViewController.PunchlineLabel.text = jokes[jokeIndex]?.1
            UIView.setAnimationTransition(.FlipFromRight, forView: view, cache: true)
            punchlineViewController.view.frame = view.frame
            switchViewController(questionViewController, to: punchlineViewController)
        }
        else {// to question
            jokeIndex += 1
            questionViewController.QuestionLabel.text = jokes[jokeIndex]?.0
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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

