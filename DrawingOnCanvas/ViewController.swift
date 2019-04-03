//
//  ViewController.swift
//  DrawingOnCanvas
//
//  Created by Makan Fofana on 3/30/19.
//  Copyright © 2019 Makan Fofana. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let canvas = Canvas()
    
    //Buttons for VC
  
    let undoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Undo", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return button
    }()
    
    //Function to undo drawing
    @objc fileprivate func handleUndo(){
        print("Undo the drawn line")
        canvas.undo()
    }
    
    
    let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Clear", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return button
    }()
    
    //Function to clear the canvas
    @objc func handleClear() {
        canvas.clear()
    }
    
    let yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return button
    }()
    
    let redButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .red
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return button
    }()
    
    let greenButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return button
    }()
    
    let purpleButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .purple
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(changeColor), for: .touchUpInside)
        return button
    }()
    
    //Slider for VC
    let slider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(controlSliderChange), for: .valueChanged)
        return slider
    }()
    
    @objc fileprivate func controlSliderChange() {
        canvas.setStrokeWidth(width: slider.value)
    }
    
    @objc fileprivate func changeColor(button: UIButton) {
        canvas.setStrokeColor(color: button.backgroundColor ?? .black)
    }
    
    
    //View Loading Functions
    override func loadView() {
        self.view = canvas  //Setting the view equal to the canvas view.
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.backgroundColor = .white
        
        buttonLayout()
    }
    
    
    fileprivate func buttonLayout() {
        
        let colorStackView = UIStackView(arrangedSubviews: [yellowButton, redButton, blueButton, greenButton, purpleButton])
        
        colorStackView.distribution = .fillEqually
        
        let stackView = UIStackView(arrangedSubviews: [undoButton, colorStackView, slider, clearButton])
        
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
    }


}

