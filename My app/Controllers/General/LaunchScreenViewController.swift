//
//  LaunchScreenViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/02/07.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(backgroundView)
        view.addSubview(appName)
        view.addSubview(welcomeLabel)
        view.addSubview(loadingLabel)
        appName.bringSubviewToFront(appName)
        welcomeLabel.bringSubviewToFront(welcomeLabel)
       applyConstraints()
    }

    let backgroundView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "launch")

        view.contentMode = .scaleAspectFill
        return view
    }()

    let appName: UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MeriendaOne-Regular", size: 80)
        label.textColor = .white
        label.text = "Recipuz"
        return label
    }()
    
    let welcomeLabel: UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MeriendaOne-Regular", size: 20)
        label.textColor = .white
        label.text = "Happines is homemade!"
        return label
    }()
    
    let loadingLabel: UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "MeriendaOne-Regular", size: 20)
        label.textColor = .white
        label.text = "Loading..."
        return label
    }()

   
    
    // MARK: - Navigation
    private func applyConstraints(){
        backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        appName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appName.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60).isActive = true
        
        welcomeLabel.bottomAnchor.constraint(equalTo: appName.bottomAnchor, constant: 40 ).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        loadingLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        loadingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appName.alpha = 0
        welcomeLabel.alpha = 0
        backgroundView.alpha = 0
        loadingLabel.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animateLabels()
    }
    
    // MARK: Animation
    func animateLabels(){
        
        UIView.animate(withDuration: 1) {
            self.appName.alpha = 1
            self.appName.frame.origin.y -= 50
            self.backgroundView.alpha = 0.4
        }
        UIView.animate(withDuration: 2, delay: 0.4, usingSpringWithDamping: 0.5, initialSpringVelocity: 0){
            self.welcomeLabel.alpha = 1
            self.welcomeLabel.frame.origin.y -= 50
        } completion: { completed in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
                let vc = MainTabBarViewController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false)
            }
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.1,options: [.repeat, .autoreverse]) {
                self.loadingLabel.alpha = 1
                self.loadingLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
    }
    
    
    
}
