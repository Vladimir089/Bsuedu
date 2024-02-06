//
//  CollectionViewController.swift
//  IceRock
//
//  Created by Владимир on 06.02.2024.
//

import UIKit

private let reuseIdentifier = "Cell"

var infoArray = [String]()

class CollectionViewController: UICollectionViewController {
    
    init() {
            let layout = UICollectionViewFlowLayout()
            super.init(collectionViewLayout: layout)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoArray.append("Укажите место входа ИЛИ кабинет, от когорого нужно проложить маршрут")
        infoArray.append("Выберите номер корпуса, где расположен кабинет, этаж и номер кабинета.")
        
        infoArray.append("Далее укажите кабинет, к которому нужно проложить маршрут.")
        infoArray.append("Dыберите номер корпуса, где расположен кабинет, этаж и номер кабинета.")
        infoArray.append("Как только будут выполнены эти действия, нажмите на кнопку Построить маршрут.")
        infoArray.append("Profit!")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
        collectionView.layer.cornerRadius = 20

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        
    }

    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print(infoArray.count)
        return infoArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.layer.cornerRadius = 15
        cell.backgroundColor = UIColor(named: "twoTopView")
        
        let view = UIView()
        cell.addSubview(view)
        view.backgroundColor = UIColor(red: 51/255.0, green: 102/255.0, blue: 51/255.0, alpha: 1.0)
        view.frame = CGRect(x: 10, y: 10, width: 30, height: 30)
        view.layer.cornerRadius = 15
        
        
        let labelMain = UILabel()
        labelMain.text = infoArray[indexPath.row]
        labelMain.font = .systemFont(ofSize: 15, weight: .light)
        cell.addSubview(labelMain)
        labelMain.frame = CGRect(x: 50, y: 0, width: 320, height: 50)
        labelMain.numberOfLines = 4
        return cell
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 370, height: 50)
    }
}





func addItemsForArray() {
    
    
}
