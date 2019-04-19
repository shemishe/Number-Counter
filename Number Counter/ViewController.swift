//
//  ViewController.swift
//  Number Counter
//
//  Created by Sherman Shi on 4/14/19.
//  Copyright © 2019 Sherman Shi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberCounter = 0
    var numberForColor: Float = 0.0
    
    let counterTextView: UITextView = {
        let textView = UITextView()
        var text = "0"
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.init(name: "Helvetica Neue", size: 125)!,
            .foregroundColor: UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0),
        ]
        let attributedText = NSAttributedString(string: text, attributes: attributes)
        textView.attributedText         = attributedText
        textView.textAlignment          = .center
        textView.isEditable             = false
        textView.isScrollEnabled        = false
        textView.isSelectable           = false
        textView.backgroundColor        = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let tapButton: UIButton = {
        let button = UIButton(type: .system)
        let text = "Tap Me!"
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 30)
        let color = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        button.setTitleColor(color, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        let text = "Reset Me!"
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 30)
        let color = UIColor.init(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        button.setTitleColor(color, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        setupLayout()
        tapButton.addTarget(self, action: #selector(ViewController.buttonTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(ViewController.buttonResetted), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        numberCounter += 1
        numberForColor += 1.0
        counterTextView.text = "\(numberCounter)"
        view.backgroundColor = UIColor.init(red: CGFloat((255.0 - numberForColor)/255.0), green: CGFloat((255.0 - numberForColor)/255.0), blue: CGFloat((255.0 - numberForColor)/255.0), alpha: 1.0)
    }
    
    @objc func buttonResetted() {
        numberCounter = 0
        numberForColor = 0.0
        counterTextView.text = "\(numberCounter)"
        view.backgroundColor = UIColor.init(red: CGFloat((255.0 - numberForColor)/255.0), green: CGFloat((255.0 - numberForColor)/255.0), blue: CGFloat((255.0 - numberForColor)/255.0), alpha: 1.0)
    }

    private func setupLayout() {
        view.addSubview(counterTextView)
        counterTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        counterTextView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(resetButton)
        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resetButton.anchorwithConstant(top: nil, bottom: counterTextView.topAnchor, leading: nil, trailing: nil, paddingTop: 0, paddingBottom: 10, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
        
        view.addSubview(tapButton)
        tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tapButton.anchorwithConstant(top: counterTextView.bottomAnchor, bottom: nil, leading: nil, trailing: nil, paddingTop: 10, paddingBottom: 0, paddingLeading: 0, paddingTrailing: 0, width: 0, height: 0)
    }
    
}

