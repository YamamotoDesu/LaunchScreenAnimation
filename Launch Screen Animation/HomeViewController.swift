//
//  HomeViewController.swift
//  Launch Screen Animation
//
//  Created by 山本響 on 2021/07/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    let label: UILabel = {
       let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Hello World!"
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.center = view.center
        //ダークモード対応
        view.backgroundColor = .systemBackground

    }

}
