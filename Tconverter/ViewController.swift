//
//  ViewController.swift
//  Tconverter
//
//  Created by Дмитрий Пономарев on 13.08.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()
    let labelCel = UILabel()
    let labelFor = UILabel()
    let slider = UISlider()
    var imageView = UIImageView()
    let image = UIImage(named: "nebo.jpeg")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        addObjects()
        addConstraints()
        
        func addSubView () {
            view.addSubview(imageView)
            view.addSubview (label)
            view.addSubview (labelCel)
            view.addSubview (labelFor)
            view.addSubview (slider)
            
        }
        func addObjects() {
            label.text = "TConverter"
            label.textColor = .black
            label.font = .italicSystemFont(ofSize: 32)
            
            labelCel.text = "0 ºC"
            labelCel.textColor = .white
            labelCel.font = .italicSystemFont(ofSize: 32)
            
            labelFor.text = "0 ºF"
            labelFor.textColor = .white
            labelFor.font = .italicSystemFont(ofSize: 32)
            
            
            slider.thumbTintColor = .purple
            slider.maximumTrackTintColor = .blue
            slider.minimumTrackTintColor = .red
            slider.value = 0
            slider.minimumValue = 0
            slider.maximumValue = 100
            slider.addTarget(self, action: #selector (changing), for: .valueChanged)
            
            imageView.contentMode = UIImageView.ContentMode.scaleAspectFill
            imageView.center = self.view.center
            imageView.image = image
            self.view = view
            
        }
    }
        func addConstraints () {
            label.snp.makeConstraints {
                $0 .top.lessThanOrEqualToSuperview().offset(200)
                $0 .top.centerX.equalToSuperview().inset(100)
                $0 .centerX.equalToSuperview()
                
            }
            labelCel.snp.makeConstraints {
                $0 .top.equalToSuperview().inset(300)
                $0 .centerX.equalToSuperview()
            }
            labelFor.snp.makeConstraints {
                $0 .top.equalToSuperview().inset(500)
                $0 .centerX.equalToSuperview()
            }
            slider.snp.makeConstraints {
                $0 .top.equalToSuperview().inset(400)
                $0 .centerX.equalToSuperview()
                $0 .leading.trailing.equalToSuperview().inset(100)
                
            
            imageView.snp.makeConstraints {
                $0 .size.equalToSuperview()
            }
        }
    }
    
    @objc func changing () {
        let tempCel = Int(slider.value)
        labelCel.text = "\(tempCel) ºC"
        let tempFor = tempCel
        labelFor.text = "\((tempFor * 9/5) + 32) ºF"
        
    }
}












