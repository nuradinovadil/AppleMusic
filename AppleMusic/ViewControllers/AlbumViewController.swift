//
//  AlbumViewController.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 22/02/23.
//

import UIKit
import SnapKit

class AlbumViewController: UIViewController {

    private let mediaArray = Constants.Values.arrayOfAlbums
    private let imageArray = Constants.Values.arrayOfImages
    private let contentView = UIView()
    
    private lazy var firstLabel: UILabel = {
       let label = UILabel()
        label.text = "Медиатека"
        label.font = UIFont.boldSystemFont(ofSize: 40)
//        if view.backgroundColor == .systemBackground {
//            label.textColor = .black
//        }
        label.textColor = .black
        return label
    }()
    
    private lazy var albumTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.albumTableViewCell)
        return tableView
    }()
    
    private lazy var secondLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "Недавно добавленные"
        return label
    }()
    
    private lazy var albumCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.albumCollectionViewCell)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        setupViews()
        setupConstraints()
        
        albumCollectionView.dataSource = self
        albumCollectionView.delegate = self
        albumTableView.dataSource = self
        albumTableView.delegate = self
    }
}

extension AlbumViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.albumCollectionViewCell, for: indexPath) as! AlbumCollectionViewCell
        return cell
    }
}

extension AlbumViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.size.width * 0.46
        let height = view.frame.size.height * 0.3
        return CGSize(width: width, height: height)
    }
}

extension AlbumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.albumTableViewCell, for: indexPath) as! AlbumTableViewCell
        cell.setText(with: mediaArray[indexPath.row])
        cell.setImage(with: imageArray[indexPath.row])
        return cell
    }
}

extension AlbumViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(47)
    }
}

private extension AlbumViewController {
    func setupViews(){
        view.addSubview(contentView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(albumTableView)
        contentView.addSubview(secondLabel)
        contentView.addSubview(albumCollectionView)
    }
    func setupConstraints(){
        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        firstLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        albumTableView.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.3)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(albumTableView.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView).multipliedBy(0.07)
        }
        albumCollectionView.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
    
    }
}
