//
//  PlayedCollectionViewCell.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 23/02/23.
//

import UIKit

class PlayedCollectionViewCell: UICollectionViewCell {
    
    private lazy var firstImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "cover")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PlayedCollectionViewCell {
    func setupViews() {
        contentView.addSubview(firstImageView)
    }
    func setupConstraints() {
        firstImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
