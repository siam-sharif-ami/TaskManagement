//
//  HomeViewController.swift
//  TaskManagement
//
//  Created by BS00484 on 14/7/24.
//

import Foundation
import UIKit


class HomeViewController: UIViewController {
    
    
    @IBOutlet var doneLabel: UILabel!
    @IBOutlet var inprogressLabel:UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var pendingTaskLabel: UILabel!
    @IBOutlet var searchIconView: UIImageView!
    @IBOutlet var profileIconView: UIImageView!
    @IBOutlet var collectionView: UICollectionView!
    
    var monthsPendingItems: [Event] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateAllPreviews()
        setUpCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateAllPreviews()
        collectionView.reloadData()
    }
    
    private func updateAllPreviews(){
        monthsPendingItems = Event().thisMonthsPendingEvents(date: Date.now)
        inprogressLabel.text = "\(monthsPendingItems.count)"
        pendingTaskLabel.text = "\(monthsPendingItems.count) Tasks are pending"
        
        dateLabel.text = CalendarDataSource().dayMonthYearString(date: Date.now)
    }
    
    private func setUpCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCollectionViewLayout()
        //collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        let nib = UINib(nibName: "PendingTaskCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "PendingTaskCell")
    }
    
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        monthsPendingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PendingTaskCell", for: indexPath) as! PendingTaskCell
        cell.titleLabel.text = monthsPendingItems[indexPath.row].title
        cell.taskLabel.text = "Unknown"
        cell.timeLabel.text = CalendarDataSource().timeString(date: monthsPendingItems[indexPath.row].dueDate)
        cell.progressLabel.text = "Pending"
        cell.layer.cornerRadius = 20
        return cell
    }
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {(section, _) ->
            
            NSCollectionLayoutSection? in
            if section == 0 {
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)
                    )
                )
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)), subitems: [item] )
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                
                return section
            }
            
            return nil
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width, height: 150)
//    }
    
    
}
