//
//  PlannerViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/23.
//

import UIKit
var selectedDate = Date()

class PlannerViewController: UIViewController {
    
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.locale = Locale(identifier: "en_US")
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .inline
        picker.tintColor = .label
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let tableView : UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.identifier)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        datePicker.setDate(selectedDate, animated: true)
        datePicker.addTarget(self, action: #selector(datePicked), for: .valueChanged)
        tableView.delegate = self
        tableView.dataSource = self
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(sender:)))
        tableView.addGestureRecognizer(longPress)
        
        navigationItem.rightBarButtonItem =  UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        title = "Plan your day"
        view.backgroundColor = .systemBackground
        NoteDataPersistenceManager.shared.getAllNotes()
        tableView.reloadData()
        datePicker.widthAnchor.constraint(equalToConstant:
                                            view.frame.width).isActive = true
        
    }
    
    @objc private func longPress(sender: UILongPressGestureRecognizer){
        if sender.state == .began {
            let touchPoint = sender.location(in: tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint){
                let item = NoteDataPersistenceManager.shared.NotesForDate(date: selectedDate)[indexPath.row]
                let sheet = UIAlertController(title: "Edit", message: nil, preferredStyle: .actionSheet)
                
                sheet.addAction(UIAlertAction.init(title: "Cancel", style: .cancel))
                sheet.addAction(UIAlertAction.init(title: "Edit", style: .default, handler: { [weak self] _ in
                    let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
                    
                    alert.addTextField(configurationHandler: nil)
                    alert.textFields?.first?.text  = item.name
                    alert.addAction(UIAlertAction.init(title: "Save", style: .cancel, handler: {[weak self] _ in
                        guard let field = alert.textFields?.first, let newName = field.text, !newName.isEmpty else {
                            return
                        }
                        NoteDataPersistenceManager.shared.updateNote(note: item, newName: newName)
                        self?.tableView.reloadData()
                    }))
                    self?.present(alert, animated: true)
                }))
                sheet.addAction(UIAlertAction.init(title: "Delete", style: .destructive, handler: {[weak self] _  in
                    NoteDataPersistenceManager.shared.deleteNote(note: item)
                    self?.tableView.reloadData()
                }))
                present(sheet, animated: true)
            }
        }
    }
    
    
    @objc func didTapAdd(){
        let vc  = AddEventViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func datePicked(){
        selectedDate = datePicker.date
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    
    private var windowInterfaceOrientation: UIInterfaceOrientation? {
        return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        datePicker.setDate(selectedDate, animated: true)
        tableView.reloadData()
    }
 
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}


extension PlannerViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return NoteDataPersistenceManager.shared.NotesForDate(date: selectedDate).count
        }
         
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.backgroundColor = .systemBackground
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.contentView.addSubview(datePicker)
            cell.selectionStyle = .none
            cell.contentView.backgroundColor = .systemBackground
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as! NoteTableViewCell
            let note = NoteDataPersistenceManager.shared.NotesForDate(date: selectedDate)[indexPath.row]
            cell.noteLabel.text = "📝 " + note.name! + "   " + CalendarHelper().timeString(date: note.date!)
             
            cell.contentView.backgroundColor = .systemBackground
        
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
       
            guard let header = view as? UITableViewHeaderFooterView else {return}
        header.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
            header.textLabel?.textColor = .label
            header.textLabel?.text =  header.textLabel?.text?.capitalizeFirstLetter()
            header.contentView.backgroundColor = .systemBackground
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            if NoteDataPersistenceManager.shared.NotesForDate(date: selectedDate).isEmpty  {
                
                return "No notes for the day"
            }
            else{
                return "Notes"
            }
                
        }
        else {
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return datePicker.frame.height
        }
        else if indexPath.section == 1 {
            return UITableView.automaticDimension
        }
        else {return 10}
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let note = NoteDataPersistenceManager.shared.NotesForDate(date: selectedDate)[indexPath.row]
        if editingStyle == .delete {
            tableView.beginUpdates()

            NoteDataPersistenceManager.shared.deleteNote(note: note)
            tableView.deleteRows(at: [indexPath], with: .fade)
          
            tableView.endUpdates()
        }
        tableView.reloadData()
    }
    
}
