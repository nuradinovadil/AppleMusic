//
//  TopPickCollectionViewCell.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 22/02/23.
//

import UIKit

class TopPickCollectionViewCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "More from Eminem"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var topRatedImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "topRated")
        imageView.contentMode = .scaleAspectFill
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

private extension TopPickCollectionViewCell {
    func setupViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(topRatedImageView)
    }
    func setupConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.1)
        }
        topRatedImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
