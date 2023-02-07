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
        textField.placeholder = "Enter a note"
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
        navigationController?.navigationBar.tintColor = .label
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func hideKeyboard(){
        self.view.endEditing(true)
    }
    
    @objc private func keyboardWillShow(notification: Notification){
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
            let bottomSpace = self.view.frame.height - (textField.frame.origin.y + textField.frame.height)
            if bottomSpace < keyboardHeight {
                self.view.frame.origin.y -= keyboardHeight - bottomSpace + 10
            }
            }
    }
    
    @objc private func keyboardWillHide(){
        self.view.frame.origin.y  = 0
    }
    deinit{
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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
        
        datePicker.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 20).isActive = true
        datePicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        datePicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        
        textField.topAnchor.constraint(equalToSystemSpacingBelow: datePicker.bottomAnchor , multiplier: 1).isActive = true
        textField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }

}
