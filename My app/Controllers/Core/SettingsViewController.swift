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
        view.addSubview(tableView)
        tableView.delegate =  self
        tableView.dataSource = self
        checkSwitchState()
       
    }
    
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = .systemBackground
        table.separatorStyle = .none
        return table
    }()
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
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
    
    let aboutLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .label
        label.text = "About"
         return label
     }()

   
 
    
}
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.row == 0 {
            cell.contentView.addSubview(stackView)
            cell.contentView.addSubview(darkModeLabel)
            cell.selectionStyle = .none

                    darkModeLabel.leadingAnchor.constraint(equalTo: cell.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
            darkModeLabel.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
                    
            stackView.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor).isActive = true
                    stackView.widthAnchor.constraint(equalToConstant: 90).isActive = true
            stackView.trailingAnchor.constraint(equalTo: cell.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        }
        else if indexPath.row == 1 {
            cell.contentView.addSubview(aboutLabel)
            cell.selectionStyle = .none
            aboutLabel.leadingAnchor.constraint(equalTo: cell.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
            aboutLabel.heightAnchor.constraint(equalTo: cell.contentView.heightAnchor).isActive = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
        let vc = AboutViewController()
           
           
            present(vc, animated: true)
        }
    }
    
}
