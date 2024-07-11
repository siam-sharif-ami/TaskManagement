//
//  HomeViewController.swift
//  TaskManagement
//
//  Created by BS00484 on 11/7/24.
//

import Foundation
import UIKit

var selectedDate = Date()

class HomeViewController: UIViewController {
    
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    var totalSquares = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMonthView()
        setUpCollectionView()
    }
    
    private func setMonthView(){
        totalSquares.removeAll()
        
        let daysInMonth = CalendarDataSource().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarDataSource().firstOfMonth(date: selectedDate)
        let toBeAdded = CalendarDataSource().addDays(date: firstDayOfMonth, days: daysInMonth)
        
        var current = firstDayOfMonth
        while (current <= toBeAdded - 1) {
            totalSquares.append(current)
            current = CalendarDataSource().addDays(date: current, days: 1)
        }

        monthLabel.text = CalendarDataSource().monthString(date: selectedDate)
        + " " + CalendarDataSource().yearString(date: selectedDate)
        collectionView.reloadData()
    }
    
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCollectionViewLayout()
        
        let nib = UINib(nibName: "CalendarCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CalendarCell")
    }
    
    @IBAction func previousMonth(_ sender: Any){
        selectedDate = CalendarDataSource().minusMonth(date: selectedDate)
        setMonthView()

    }
    @IBAction func nextMonth(_ sender: Any){
        selectedDate = CalendarDataSource().plusMonth(date: selectedDate)
        setMonthView()
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        totalSquares.count
        //        return section == 1 ? 1: 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        let date = totalSquares[indexPath.row]
        
        if (date == selectedDate){
            cell.backgroundColor = UIColor.blue
            cell.month.textColor = UIColor.white
            cell.date.textColor = UIColor.white
            cell.day.textColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.systemGray6
            cell.month.textColor = UIColor.black
            cell.date.textColor = UIColor.black
            cell.day.textColor = UIColor.black
        }
        
        cell.month.text = CalendarDataSource().monthString(date: totalSquares[indexPath.row])
        cell.date.text = CalendarDataSource().currentDateString(date: totalSquares[indexPath.row])
        cell.day.text = CalendarDataSource().dayString(date: totalSquares[indexPath.row])
        cell.layer.cornerRadius = 8
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquares[indexPath.row]
        collectionView.reloadData()
    }
    
}



extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {(section, _) ->
            
            NSCollectionLayoutSection? in
            if section == 0 {
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1/5), heightDimension: .fractionalHeight(1)
                    )
                )
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(140)), subitem: item, count: 5)
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                
                return section
            }
            
            if section == 1 {
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(65)), subitem: item, count: 3)
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
                
                return section
            }
            
            return nil
        }
    }
}
