//
//  BlurLobbyViewController.swift
//  NavigationConcept
//
//  Created by Patrik Potoček on 14.12.16.
//  Copyright © 2016 patrik.potocek. All rights reserved.
//

import Foundation
import UIKit

class BlurLobbyViewController: UIViewController {
    @IBOutlet weak var topContraint: NSLayoutConstraint!
    @IBOutlet weak var stackView: CustomStackView!
    @IBOutlet var lobbyTitles: [UILabel]!
    @IBOutlet weak var lobbyTitle: UILabel!
    @IBOutlet weak var containerVievController: UIView!
    @IBOutlet weak var blurEffect: UIVisualEffectView!
    @IBOutlet weak var filterLayer: UIView!

    enum RoomTypes: Int {
        case different = 0
        case kind = 1
        case of = 2
        case navigation = 3
        case titles = 4
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.delegate = self

    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

    @IBAction func showLobby(_ sender: Any) {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1.6, options: .curveEaseIn, animations: {
            self.stackView.arrangedSubviews.forEach {
                $0.isHidden = false
            }
            self.lobbyTitles.forEach {
                $0.alpha = 1
            }
            self.lobbyTitle.alpha = 1
            self.blurEffect.alpha = 1
            self.topContraint.constant = 64
            self.stackView.layoutIfNeeded()
        }, completion: nil)
    }

    func show(room: RoomTypes) {
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.65, initialSpringVelocity: 1.6, options: .curveEaseIn, animations: {
            self.stackView.arrangedSubviews.forEach {
                $0.isHidden = true
            }
            self.stackView.arrangedSubviews[room.rawValue].isHidden = false
            self.lobbyTitles.forEach {
                $0.alpha = 0
            }
            self.lobbyTitles[room.rawValue].alpha = 1
            self.blurEffect.alpha = 0
            self.lobbyTitle.alpha = 0
            self.topContraint.constant = -20
            self.stackView.layoutIfNeeded()
        }, completion: nil)
    }
}

extension BlurLobbyViewController: StackViewDelegate {
    func didTapOnView(at index: Int) {
        if let screen = RoomTypes(rawValue: index) {
            show(room: screen)
        }
    }
}
