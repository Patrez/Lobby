//
//  CustomStackView.swift
//  NavigationConcept
//
//  Created by Patrik Potoček on 14.12.16.
//  Copyright © 2016 patrik.potocek. All rights reserved.
//

import Foundation
import UIKit

protocol StackViewDelegate {
    func didTapOnView(at index: Int)
}

class CustomStackView: UIStackView {

    var delegate: StackViewDelegate? {
        didSet {
            configureTapGestures()
        }
    }

    func configureTapGestures() {
        arrangedSubviews.forEach { view in
            view.gestureRecognizers?.forEach { gesture in
                view.removeGestureRecognizer(gesture)
            }
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOnView))
            view.addGestureRecognizer(tapGesture)
        }
    }

    func didTapOnView(gestureRecognizer: UIGestureRecognizer) {
        if let index = arrangedSubviews.index(of: gestureRecognizer.view!) {
            delegate?.didTapOnView(at: index)
        }
    }
}
