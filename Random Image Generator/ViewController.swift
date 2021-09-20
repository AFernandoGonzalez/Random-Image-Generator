//
//  ViewController.swift
//  Random Image Generator
//
//  Created by Fernando Gonzalez on 9/20/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        
        return imageView
    }()
    
    // adding a button to get random images
    private let button: UIButton = {
        let buttom = UIButton()
        buttom.backgroundColor = .white
        buttom.setTitle("Random Photo", for: .normal)
        buttom.setTitleColor(.black, for: .normal)
        
        return buttom
    }()
    
    
    //array of colors
    let colors : [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemPink,
        .systemTeal,
        .systemGray,
        .systemGreen
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //changing background color
        view.backgroundColor = .systemRed
        //
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        
        //
        getRandomPhoto()
        //ataching to a button
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    
    //
    @objc func didTapButton(){
        getRandomPhoto()
        
        // getting random colors when pressing button
        view.backgroundColor = colors.randomElement()
    }
    
    
    // button place
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //addimng a subbutton
        view.addSubview(button)
        button.frame = CGRect(
            x: 30,
            y: view.frame.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55)
    }
    
    
    //get random phone
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/collection/190727/300x300"
        let url = URL(string:  urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)
    }


}

