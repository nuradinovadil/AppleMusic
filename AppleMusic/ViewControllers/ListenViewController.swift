//
//  ListenViewController.swift
//  AppleMusic
//
//  Created by Nuradinov Adil on 22/02/23.
//

import UIKit

class ListenViewController: UIViewController {

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var firstLabel: UILabel = {
       let label = UILabel()
        label.text = "Слушать"
        label.font = UIFont.boldSystemFont(ofSize: 40)
//        if view.backgroundColor == .systemBackground {
//            label.textColor = .black
//        }
        label.textColor = .black
        return label
    }()
    
    private lazy var avatarImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var secondLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "Top Picks"
        return label
    }()
    
    private lazy var topPicksCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TopPickCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.topPickCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
//    private lazy var forYourselfTableView: UITableView = {
//       let tableView = UITableView()
//        tableView.register(ForYourselfTableViewCell.self, forCellReuseIdentifier: Constants.Identifiers.forYourselfTableViewCell)
//        tableView.layer.borderWidth = 1
//        tableView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        return tableView
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupViews()
        setupConstraints()
      
        topPicksCollectionView.dataSource = self
        topPicksCollectionView.delegate = self
//        forYourselfTableView.dataSource = self
//        forYourselfTableView.delegate = self
    }
}

extension ListenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.topPickCollectionViewCell, for: indexPath) as! TopPickCollectionViewCell
            return cell
    }
}

extension ListenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = view.frame.size.width * 0.65
            let height = view.frame.size.height * 0.5
            return CGSize(width: width, height: height)
    }
}

//extension ListenViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.forYourselfTableViewCell, for: indexPath) as! ForYourselfTableViewCell
//        return cell
//    }
//}
//
//extension ListenViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        let height = contentView.frame.size * 0.3
//        return CGFloat(200)
//    }
//}

private extension ListenViewController {
    func setupViews(){
        view.addSubview(contentView)
        contentView.addSubview(firstLabel)
        contentView.addSubview(avatarImage)
        contentView.addSubview(secondLabel)
        contentView.addSubview(topPicksCollectionView)
//        contentView.addSubview(forYourselfTableView)
    }
    
    func setupConstraints(){
        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        firstLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.width.equalTo(view).multipliedBy(0.7)
        }
        avatarImage.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(firstLabel.snp.trailing).offset(10)
            make.height.equalTo(firstLabel.snp.height)
        }
        secondLabel.snp.makeConstraints { make in
            make.top.equalTo(firstLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
        }
        topPicksCollectionView.snp.makeConstraints { make in
            make.top.equalTo(secondLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(view).multipliedBy(0.5)
        }
//        forYourselfTableView.snp.makeConstraints { make in
//            make.top.equalTo(topPicksCollectionView.snp.bottom).offset(10)
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(view).multipliedBy(2.5)
//        }
    }
}
