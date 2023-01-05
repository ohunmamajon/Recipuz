//
//  TableHeader.swift
//  My app
//
//  Created by Okhunjon Mamajonov on 2022/12/28.
//

import UIKit

class HeaderView: UIView {

    let player = VideoPlayer()
    
    let videoView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Cook well"
        label.textColor = .label
        label.layer.shadowOpacity = 0.5
        label.layer.shadowRadius = 0.5
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSizeMake(0.0, -0.5)
//        label.backgroundColor = .systemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.sizeToFit()
        return label
    }()
    
    
    override  init(frame: CGRect) {
        super.init(frame: frame)
       addSubview(videoView)
//        applyGradient()
        addSubview(label)
       
//        try? VideoPlayer.shared.play(
//            view: videoView,
//            videoName: "video",
//            videoType: "mp4",
//            isMuted: true,
//            darkness: 0.1,
//            willLoopVideo: true,
//            setAudioSessionAmbient: true
//        )

    }
    private func applyConstraints(){
       
        videoView.frame = CGRect(x: 10, y: 0, width: bounds.width - 20, height: bounds.height)
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
       

    }
    
    
    func  applyGradient(){
      let  gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [UIColor.clear.cgColor,UIColor.clear.cgColor, UIColor.systemBackground.cgColor]
        
        layer.insertSublayer(gradientLayer, below: label.layer)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
       
        applyConstraints()
       
       
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
