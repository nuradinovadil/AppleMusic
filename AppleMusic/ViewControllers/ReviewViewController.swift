//
//  ReviewViewController.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 22/02/23.
//

import UIKit

class ReviewViewController: UIViewController {

    private lazy var firstImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "gobackward")
        imageView.tintColor = .init(red: 248/255, green: 45/255, blue: 72/255, alpha: 1)
        return imageView
    }()
    
    private lazy var firstLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 21)
        label.text = "Development of this page is on process"
        label.numberOfLines = 2
        label.textColor = .systemGray
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
    }
}

private extension ReviewViewController {
    func setupViews() {
        view.addSubview(firstImageView)
        view.addSubview(firstLabel)
    }
    
    func setupConstraints() {
        firstImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.width.equalTo(80)
        }
        firstLabel.snp.makeConstraints { make in
            make.top.equalTo(firstImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }
}
