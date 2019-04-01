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
    
    //Public Functions
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
        let stackView = UIStackView(arrangedSubviews: [undoButton, clearButton])
        
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }


}

