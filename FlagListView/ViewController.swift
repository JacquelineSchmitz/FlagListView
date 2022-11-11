//
//  ViewController.swift
//  FlagListView
//
//  Created by Jacqueline Schmitz on 11.11.22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let laender = ["Qatar", "Ecuador", "Senegal", "Netherlands", "England", "Iran", "USA", "Wales", "Argentina", "Saudi Arabia", "Mexico", "Poland", "France", "Australia", "Denmark", "Tunisia", "Spain", "Costa Rica", "Germany", "Japan", "Belgium", "Canada", "Morocco", "Croatia", "Brazil", "Serbia", "Switzerland", "Cameroon", "Portugal", "Ghana", "Uruguay", "South Korea",]
  var imagesToShow = [String]()
  var toDelete = [Int]()
  
    @IBAction func hinzufügen(_ sender: Any) {
        imagesToShow.append(laender.randomElement()!)
        imageView.reloadData()
      }
    @IBOutlet weak var imageView: UICollectionView!
  @IBAction func deleteRows(_ sender: Any) {
    if let selectedRows = imageView.indexPathsForSelectedItems {
      _ = [String]()
      for indexPath in selectedRows {
        imagesToShow.remove(at: indexPath.row)
      }
    }
    imagesToShow = []
    imageView.reloadData()
    }
    override func viewDidLoad() {
      super.viewDidLoad()
      imageView.dataSource = self
      imageView.delegate = self
    }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    toDelete.append(indexPath.row)
    print(toDelete)
  }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)-> Int{
      return imagesToShow.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
      let cell = imageView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath)
      var background = cell.defaultBackgroundConfiguration()
      background.image = UIImage(named: imagesToShow[indexPath.row])
      cell.backgroundConfiguration = background
      return cell
    }
  }
