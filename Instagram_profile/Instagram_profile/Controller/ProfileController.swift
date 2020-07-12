//
//  ProfileController.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/04.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import UIKit

private let headerIdentifier = "filterHeader"
private let profileIdentifier = "profileCell"
private let identifier = "postCell"



class ProfileController: UICollectionViewController{
    
    // MARK: - Properties
    
    private var imageArray: [UIImage?] =
        [UIImage(named: "jeff"), UIImage(named: "zack"), UIImage(named: "elon"), UIImage(named: "steve"),
         UIImage(named: "jeff"), UIImage(named: "zack"), UIImage(named: "elon"), UIImage(named: "steve"),
         UIImage(named: "jeff"), UIImage(named: "zack"), UIImage(named: "elon"), UIImage(named: "steve"),
         UIImage(named: "jeff"), UIImage(named: "zack"), UIImage(named: "elon"), UIImage(named: "steve")]
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    // MARK: - Selectors
    
    @objc func handleRightButtonTapped(){
        
    }
    
    @objc func handleRefresh(){
        // データがないので何もしません
        collectionView.refreshControl?.beginRefreshing()
        collectionView.refreshControl?.endRefreshing()
    }
    
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .systemGroupedBackground
        
        configureNavigationBar()
        configureCollectionView()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.refreshControl = refreshControl
    }
    
    
    func configureNavigationBar(){
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barTintColor = .systemGroupedBackground
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        
        navigationItem.title = "user_id"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(handleRightButtonTapped))
        
    }
    
    func configureCollectionView(){
        collectionView.backgroundColor = .systemGroupedBackground
        
        collectionView.register(ProfileHeader.self, forCellWithReuseIdentifier: profileIdentifier)
        collectionView.register(PostCell.self, forCellWithReuseIdentifier: identifier)
        
        collectionView.register(ProfileFilterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        guard let tabHeight = tabBarController?.tabBar.frame.height else { return }
        collectionView.contentInset.bottom = tabHeight
        
        guard let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        flowLayout.sectionHeadersPinToVisibleBounds = true
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileController{
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return imageArray.count
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: profileIdentifier, for: indexPath) as! ProfileHeader
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PostCell
            cell.postImageView.image = imageArray[indexPath.row]
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! ProfileFilterView
        return header
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileController{
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DEBUG: this item is \(indexPath.row)")
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0:
            return CGSize(width: 0, height: 0)
        default:
            let height: CGFloat = 50
            return CGSize(width: view.frame.width, height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let height: CGFloat = 340
            return CGSize(width: view.frame.width, height: height)
        default:
            let size = view.frame.width / 3
            return CGSize(width: size, height: size)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}




