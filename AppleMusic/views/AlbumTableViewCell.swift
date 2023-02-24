//
//  AlbumTableViewCell.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 23/02/23.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    private lazy var firstImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "music.note.list")
        imageView.tintColor = .init(red: 248/255, green: 45/255, blue: 72/255, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var firstLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "PingFangSC-Regular", size: 34)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(with text: String) {
        firstLabel.text = text
    }
    func setImage(with image: String) {
        firstImageView.image = UIImage(systemName: image)
    }
    
}

private extension AlbumTableViewCell {
    func setupViews(){
        contentView.addSubview(firstImageView)
        contentView.addSubview(firstLabel)
    }
    func setupConstraints(){
        firstImageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalTo(contentView).multipliedBy(0.2)
        }
        
        firstLabel.snp.makeConstraints { make in
            make.leading.equalTo(firstImageView.snp.trailing)
            make.top.trailing.bottom.equalToSuperview()
        }
    }
}
