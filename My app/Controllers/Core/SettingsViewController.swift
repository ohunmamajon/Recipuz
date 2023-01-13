//
//  SettingsViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/23.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(onOffswitch)
        view.addSubview(darkModeLabel)
        view.addSubview(onOffLabel)
        view.addSubview(stackView)
        applyConstraints()
        checkSwitchState()
       
    }
    
    public func   checkSwitchState(){
        let window = UIApplication.shared.windows[0]
        if(userDefaults.bool(forKey: onOffKey) || traitCollection.userInterfaceStyle == .dark )
        {
            
            onOffswitch.setOn(true, animated: false)
            onOffLabel.text = "ON"
            let window = UIApplication.shared.windows[0]
            window.overrideUserInterfaceStyle = .dark
        }
        else  {
            
            onOffswitch.setOn(false, animated: false)
            onOffLabel.text = "OFF"
            let window = UIApplication.shared.windows[0]
            window.overrideUserInterfaceStyle = .light
        }
    }
   
    
    let darkModeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dark Mode"
        label.textColor = .label
        return label
    }()
    
    let onOffLabel: UILabel = {
        let label = UILabel()
        label.text = "OFF"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        return label
    }()
    
    let userDefaults = UserDefaults.standard
    
    let onOffKey = "OnOfKey"
    
    let onOffswitch: UISwitch = {
        let switchMode = UISwitch()
        switchMode.translatesAutoresizingMaskIntoConstraints = false
        switchMode.addTarget(self, action: #selector(switchDidChange), for: .valueChanged)
        return switchMode
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(onOffLabel)
        stack.addArrangedSubview(onOffswitch)
        return stack
    }()


    @objc func switchDidChange(_ sender: UISwitch){
        if sender.isOn {
            userDefaults.set(true, forKey: onOffKey)
            onOffLabel.text = "ON"
            let window = UIApplication.shared.windows[0]
            window.overrideUserInterfaceStyle = .dark
        }
        else {
            userDefaults.set(false, forKey: onOffKey)
            let window = UIApplication.shared.windows[0]
            window.overrideUserInterfaceStyle = .light
            onOffLabel.text = "OFF"
        }
    }
    private func applyConstraints(){
        
        darkModeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        darkModeLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
    }
    
}
