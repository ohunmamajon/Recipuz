//
//  AddEventViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/12.
//

import UIKit

class AddEventViewController: UIViewController {
    let textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .label
        textField.layer.borderWidth = 1
        textField.textAlignment = .center
        textField.layer.cornerRadius = 15
        textField.layer.borderColor = UIColor.label.cgColor
        textField.placeholder = "enter event"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = Locale(identifier: "en_US")
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .wheels
        picker.tintColor = .label
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(textField)
        view.addSubview(datePicker)
        applyConstraints()
        datePicker.setDate(selectedDate, animated: true)
        datePicker.addTarget(self, action: #selector(datePicked), for: .valueChanged)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveButtonPressed))
    }
    
    @objc func saveButtonPressed(){
        if textField.text != ""{
            let newNote = textField.text!
            NoteDataPersistenceManager.shared.createNote(name: newNote, date: selectedDate)
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @objc func datePicked(){
        selectedDate = datePicker.date
    }

    private func applyConstraints(){
        textField.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1).isActive = true
        textField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        datePicker.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1).isActive = true
        datePicker.widthAnchor.constraint(equalTo: textField.widthAnchor).isActive = true
        datePicker.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }

}
