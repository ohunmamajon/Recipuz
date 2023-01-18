//
//  AboutViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/19.
//

import UIKit

class AboutViewController: UIViewController {
 
    
    let textLabel : UILabel = {
       let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "This app was created by Okhunjon Mamajonov \n\n Contact:   ohunmamajon@gmail.com \n\n "
        view.textColor = .label
        view.numberOfLines = 0
        return view
        
    }()
    
    let closeButton : UIButton  = {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func closeButtonTapped(){
        self.dismiss(animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

                view.addSubview(textLabel)
        view.addSubview(closeButton)
        
        textLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        closeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    

   

}
