//
//  ViewController.swift
//  NavigationConcept
//
//  Created by Patrik Potoček on 18.08.16.
//  Copyright © 2016 patrik.potocek. All rights reserved.
//

import Foundation
import UIKit

class CardsLobbyViewController: UIViewController {

    @IBOutlet weak var stackView: CustomStackView!
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
        stackView.delegate = self
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
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

extension CardsLobbyViewController: StackViewDelegate {
    func didTapOnView(at index: Int) {
        if let screen = LobbyScreen(rawValue: index) {
            show(screen)
        }
    }
}

