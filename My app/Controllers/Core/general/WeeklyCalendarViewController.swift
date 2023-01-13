//
//  WeeklyCalendarViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2023/01/12.
//

import UIKit


class WeeklyCalendarViewController: UIViewController {
    
    struct AppOrientationUtility {
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
            if let delegate = UIApplication.shared.delegate as? AppDelegate {
                delegate.orientationLock = orientation
            }
        }
        
        static func lockOrientation(_ orientation: UIInterfaceOrientationMask, andRotateTo rotateOrientation: UIInterfaceOrientation) {
            self.lockOrientation(orientation)
            UIDevice.current.setValue(rotateOrientation.rawValue, forKey: "orientation")
        }
    }
    
    
    
    var totalSquares = [Date]()
    
    let sundayLabel : UILabel = {
        let label = UILabel()
        label.text = "Ya"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mondayLabel : UILabel = {
        let label = UILabel()
        label.text = "Du"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let tuesdayLabel : UILabel = {
        let label = UILabel()
        label.text = "Se"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let wednesdayLabel : UILabel = {
        let label = UILabel()
        label.text = "Cho"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let thursdayLabel : UILabel = {
        let label = UILabel()
        label.text = "Pa"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let fridayLabel : UILabel = {
        let label = UILabel()
        label.text = "Ju"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let saturdayLabel : UILabel = {
        let label = UILabel()
        label.text = "Sha"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let monthLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nextWeek: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextWeekPressed), for: .touchUpInside)
        return button
    }()
    
    let previousWeek: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.setImage(UIImage(systemName: "arrowshape.turn.up.left"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(previousWeekPressed), for: .touchUpInside)
        return button
    }()
    
    
    
    lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.distribution = .fillEqually
        stack.addArrangedSubview(previousWeek)
        stack.addArrangedSubview(monthLabel)
        stack.addArrangedSubview(nextWeek)
        return stack
    }()
    
    lazy var weekStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .center
        stack.isLayoutMarginsRelativeArrangement = true
        stack.distribution = .equalCentering
        stack.addArrangedSubview(sundayLabel)
        stack.addArrangedSubview(mondayLabel)
        stack.addArrangedSubview(tuesdayLabel)
        stack.addArrangedSubview(wednesdayLabel)
        stack.addArrangedSubview(thursdayLabel)
        stack.addArrangedSubview(fridayLabel)
        stack.addArrangedSubview(saturdayLabel)
        return stack
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CalendarCell.self, forCellWithReuseIdentifier: CalendarCell.identifier)
        
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let tableView : UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(previousWeek)
        view.addSubview(monthLabel)
        view.addSubview(nextWeek)
        view.addSubview(topStack)
        view.addSubview(sundayLabel)
        view.addSubview(mondayLabel)
        view.addSubview(tuesdayLabel)
        view.addSubview(wednesdayLabel)
        view.addSubview(thursdayLabel)
        view.addSubview(fridayLabel)
        view.addSubview(saturdayLabel)
        view.addSubview(weekStack)
        view.addSubview(collectionView)
        view.addSubview(tableView)
        applyConstraints()
        setWeekView()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        NoteDataPersistenceManager.shared.getAllNotes()
        tableView.reloadData()
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(sender:)))
        tableView.addGestureRecognizer(longPress)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        view.backgroundColor = .systemBackground
        AppOrientationUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    @objc func previousWeekPressed(_ sender: UIButton){
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
    }
    @objc func nextWeekPressed(_ sender: UIButton){
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }
    @objc func didTapAdd(){
        let vc  = AddEventViewController()
        navigationController?.pushViewController(vc, animated: true)
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
   
    func setWeekView(){
        totalSquares.removeAll()
        
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while (current < nextSunday) {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    
    
    private func applyConstraints (){
        topStack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1).isActive = true
        topStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        topStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        weekStack.topAnchor.constraint(equalTo: topStack.bottomAnchor).isActive = true
        weekStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        weekStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        weekStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: weekStack.bottomAnchor, multiplier: 1).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
    }
    
    
}
    extension WeeklyCalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            totalSquares.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.identifier, for: indexPath) as! CalendarCell
            let date = totalSquares[indexPath.item]
            cell.dayOfMonth.text = String(CalendarHelper().dayOfMonth(date: date))
            
            if (date == selectedDate){
                cell.backgroundColor = UIColor.systemGreen
            }
            else{
                cell.backgroundColor = UIColor.systemBackground
            }
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            selectedDate = totalSquares[indexPath.item]
            collectionView.reloadData()
            tableView.reloadData()
        }
       
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = collectionView.frame.size.width - collectionView.frame.size.width / 5
            return CGSize(width: width / 7, height: 40)
        }
    }

extension WeeklyCalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteDataPersistenceManager.shared.NotesForDate(date: selectedDate).count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as! NoteTableViewCell
        let note = NoteDataPersistenceManager.shared.NotesForDate(date: selectedDate)[indexPath.row]
        cell.label.text = "📝 " + note.name! + "  🕙 " + CalendarHelper().timeString(date: note.date!)
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        collectionView.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
    }
    
}
