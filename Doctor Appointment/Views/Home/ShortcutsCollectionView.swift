//
//  ShortcutsView.swift
//  Doctor Appointment
//
//  Created by Игорь Пустыльник on 06.07.2024.
//

import UIKit

protocol ShortcutsDelegate: AnyObject {
    func showVC(_ vc: UIViewController)
}

class ShortcutsCollectionView: UICollectionView {
    private var shortcuts: [Shortcut]?
    weak var shortcutsDelegate: ShortcutsDelegate?
    
    init(shortcutsDelegate: ShortcutsDelegate) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.showsHorizontalScrollIndicator = false
        self.alwaysBounceHorizontal = true
        
        self.shortcutsDelegate = shortcutsDelegate
        self.delegate = self
        self.dataSource = self
        self.register(ShortcutCell.self, forCellWithReuseIdentifier: ShortcutCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setShortcuts(_ shortcuts: [Shortcut]) {
        self.shortcuts = shortcuts
    }
    
}

extension ShortcutsCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = shortcuts?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ShortcutCell.identifier,
          for: indexPath
        ) as! ShortcutCell
        
        guard let shortcut = shortcuts?[indexPath.row] else { return cell }
        cell.configure(with: shortcut)
        return cell
    }
    
    
}

extension ShortcutsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        deselectItem(at: indexPath, animated: true)
        shortcuts?[indexPath.row].clicked { vc in
            self.shortcutsDelegate?.showVC(vc)
        }
    }
}

extension ShortcutsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 72, height: 103)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        13
    }
}
