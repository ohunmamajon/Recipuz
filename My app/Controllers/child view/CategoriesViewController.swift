//
//  CoursesViewController.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/24.
//

import UIKit
import AVKit
class CategoriesViewController: UIViewController {
    let playerView = HeaderVideoView()
    let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 300)
        return view
    }()
    let coursesTable :  UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemIndigo
        view.addSubview(coursesTable)
        coursesTable.delegate = self
        coursesTable.dataSource = self
        coursesTable.tableHeaderView = headerView
        
        try? HeaderVideoView.shared.play(
            view: headerView,
            videoName: "video1",
            videoType: "mp4",
            isMuted: false, darkness: 0.1,
            willLoopVideo: true,
            setAudioSessionAmbient: true
        )
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        coursesTable.frame = view.bounds
    }
    
    

}
extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
}
