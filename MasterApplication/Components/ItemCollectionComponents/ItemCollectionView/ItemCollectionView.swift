//
//  ItemCollectionView.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 23.10.2021.
//

import UIKit

class ItemCollectionView: GenericBaseView<ItemCollectionViewData> {
    
    weak var delegate: ItemProviderProtocol?
    
    private lazy var componentCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.register(ItemCollectionCellView.self, forCellWithReuseIdentifier: ItemCollectionCellView.identifier)
        temp.register(LoadingCellView.self, forCellWithReuseIdentifier: LoadingCellView.identifier)
        return temp
    }()
    
    private var emptyView: EmptyBackgroundView!
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setupBackgroundView()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addCollectionView()
    }
    
    private func addCollectionView() {
        addSubview(componentCollection)
        
        NSLayoutConstraint.activate([
            componentCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            componentCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            componentCollection.topAnchor.constraint(equalTo: topAnchor),
            componentCollection.bottomAnchor.constraint(equalTo: bottomAnchor),

        ])
        
    }
    
    private func setupBackgroundView() {
        emptyView = EmptyBackgroundView(frame: .zero, data: EmptyBackgroundViewData(labelPackData: LabelPackComponentData(title: "Warning", subtitle: "Please login to system to retrive some data from marvel!")))
        componentCollection.backgroundView = emptyView
    }
    
    private func emptyViewActivationControl() {
        emptyView.activationManager(by: ((delegate?.getNumberOfItem(in: 0) ?? 0) <= 0))
    }
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.emptyViewActivationControl()
            self.componentCollection.reloadData()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ItemCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getNumberOfItem(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if isLoadingCell(for: indexPath) {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingCellView.identifier, for: indexPath) as? LoadingCellView else { fatalError() }
            return cell
        } else {
            guard let data = delegate?.getData(at: indexPath.row) else { fatalError("Please provide at least one item!") }
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionCellView.identifier, for: indexPath) as? ItemCollectionCellView else { fatalError("Please provide  registered cell items") }
            cell.setData(by: data)
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.isUserInteractionEnabled = false
        cell?.startTappedAnimation(with: { [weak self] finish in
            if finish {
                self?.delegate?.selectedItem(at: indexPath.row)
                cell?.isUserInteractionEnabled = true
            }
        })
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ItemCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = (UIScreen.main.bounds.width - 50) / 3
        return CGSize(width: width, height: 250)
        
    }
    
}
