//
//  ViewController.swift
//  NavigationConcept
//
//  Created by Patrik Potoček on 18.08.16.
//  Copyright © 2016 patrik.potocek. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var topStackViewConstraint: NSLayoutConstraint!

    enum LobbyScreen: Int {
        case home = 0
        case friends = 1
        case messages = 2
        case discover = 3
        case settings = 4
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func menu(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1.6, options: .curveEaseIn, animations: {
            self.stackView.arrangedSubviews.forEach {
                $0.isHidden = false
            }
            self.topStackViewConstraint.constant = 64
            self.stackView.layoutIfNeeded()
            }, completion: nil)
    }

    @IBAction func first(_ sender: AnyObject) {
        show(.home)

    }
    @IBAction func second(_ sender: AnyObject) {
       show(.friends)
    }

    @IBAction func third(_ sender: AnyObject) {
        show(.messages)
    }

    @IBAction func fourth(_ sender: AnyObject) {
        show(.discover)
    }

    @IBAction func fift(_ sender: AnyObject) {
        show(.settings)
    }

    func show(_ screen: LobbyScreen) {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1.6, options: .curveEaseIn, animations: {
            self.stackView.arrangedSubviews.forEach {
                $0.isHidden = true
            }
            self.stackView.arrangedSubviews[screen.rawValue].isHidden = false
            self.topStackViewConstraint.constant = -20
            self.stackView.layoutIfNeeded()
            }, completion: nil)
    }


}

