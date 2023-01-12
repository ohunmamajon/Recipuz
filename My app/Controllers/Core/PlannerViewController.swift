//
//  PlannerViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/23.
//

import UIKit
var selectedDate = Date()
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


class PlannerViewController: UIViewController {

    
    var totalSquares = [String]()
    
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
    
     let nextMonth: UIButton = {
        let button = UIButton()
         button.tintColor = .label
        button.setImage(UIImage(systemName: "arrowshape.turn.up.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextMonthPressed), for: .touchUpInside)
        return button
    }()
    
     let previousMonth: UIButton = {
        let button = UIButton()
         button.tintColor = .label
        button.setImage(UIImage(systemName: "arrowshape.turn.up.left"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
         button.addTarget(self, action: #selector(previousMonthPressed), for: .touchUpInside)
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
        stack.addArrangedSubview(previousMonth)
        stack.addArrangedSubview(monthLabel)
        stack.addArrangedSubview(nextMonth)
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(previousMonth)
        view.addSubview(monthLabel)
        view.addSubview(nextMonth)
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
        applyConstraints()
        setMonthView()
        collectionView.delegate = self
        collectionView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Week", style: .done, target: self, action: #selector(goToWeek))
        view.backgroundColor = .systemBackground
        AppOrientationUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    @objc func previousMonthPressed(_ sender: UIButton){
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    @objc func nextMonthPressed(_ sender: UIButton){
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    @objc func goToWeek(){
        let vc = WeeklyCalendarViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setMonthView(){
        totalSquares.removeAll()
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        var count : Int = 1
        while(count <= 42){
            if (count <= startingSpaces || count - startingSpaces > daysInMonth)
            {
                totalSquares.append("")
            }
            else
            {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        monthLabel.text = CalendarHelper().monthString(date: selectedDate) + " " + CalendarHelper().yearString(date: selectedDate)
        collectionView.reloadData()
    }
    
    
    
    private func applyConstraints (){
        topStack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1).isActive = true
        topStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        topStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        weekStack.topAnchor.constraint(equalTo: topStack.bottomAnchor).isActive = true
        weekStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        weekStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        weekStack.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        weekStack.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        collectionView.topAnchor.constraint(equalToSystemSpacingBelow: weekStack.bottomAnchor, multiplier: 1).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    }
   

}
extension PlannerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarCell.identifier, for: indexPath) as! CalendarCell
        cell.dayOfMonth.text = totalSquares[indexPath.row]
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width - collectionView.frame.size.width / 5
        return CGSize(width: width / 7, height: 40)
    }
}
