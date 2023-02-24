//
//  AlbumCollectionViewCell.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 23/02/23.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    private lazy var albumImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "cover")
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 19)
        label.numberOfLines = 1
        label.text = "Время возвращаться"
        return label
    }()
    
    private lazy var artistNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Скриптонит"
        return label
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

private extension AlbumCollectionViewCell {
    func setupViews(){
        contentView.addSubview(albumImage)
        contentView.addSubview(albumNameLabel)
        contentView.addSubview(artistNameLabel)
    }
    func setupConstraints(){
        albumImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.75)
        }
        albumNameLabel.snp.makeConstraints { make in
            make.top.equalTo(albumImage.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.125)
        }
        artistNameLabel.snp.makeConstraints { make in
            make.top.equalTo(albumNameLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
