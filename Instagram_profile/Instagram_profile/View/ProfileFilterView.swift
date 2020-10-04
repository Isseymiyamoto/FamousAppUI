//
//  ProfileFilterView.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/08.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import UIKit

private let identifier = "ProfileFilterCell"

// ハリボテ
protocol ProfileFilterViewDelegate: class {
    func filterView(_ view: ProfileFilterView, didSelect index: Int)
}

class ProfileFilterView: UICollectionReusableView {
    
    // MARK: - Properties
    
    // ハリボテ
    weak var delegate: ProfileFilterViewDelegate?
    
    // viewに載せていくcollectionView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .systemGroupedBackground
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    // こいつをアニメーションさせていい感じに選択した感を演出
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    // profileHeaderCellとの境界線
    private let abovelineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionView.register(ProfileFilterCell.self, forCellWithReuseIdentifier: identifier)
        
        // 初期化時にisSelected = trueにするcellを決定する
        let selectedIndexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: true, scrollPosition: .left)
        
        addSubview(collectionView)
        // 親viewいっぱいにcollectionViewを広げる
        collectionView.addConstraintsToFillView(self)
    }
    
    override func layoutSubviews() {
        addSubview(abovelineView)
        abovelineView.anchor(left: leftAnchor, bottom: topAnchor, width: frame.width, height: 0.5)
        
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, width: frame.width / 2, height: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UICollectionViewDataSource

extension ProfileFilterView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // tag or post の 2択なので return 2 でも ok
        return ProfileFilterOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProfileFilterCell
        
        // cell側のoptionを更新
        let option = ProfileFilterOptions(rawValue: indexPath.row)
        cell.option = option
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ProfileFilterView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        // underlineViewをtouchUpInsideされたcellのx座標に0.3秒で移動させる
        let xPosition = cell?.frame.origin.x ?? 0
        
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = xPosition
        }
        
        // ハリボテ → 本来ProfileControllerにて表示画像変更できるように処理書く
        delegate?.filterView(self, didSelect: indexPath.row)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProfileFilterView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let count = CGFloat(ProfileFilterOptions.allCases.count)
        return CGSize(width: frame.width / count, height: frame.height)
    }
    
    // item同士の隙間がないよう設置
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
