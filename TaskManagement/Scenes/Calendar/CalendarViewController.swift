//
//  HomeViewController.swift
//  TaskManagement
//
//  Created by BS00484 on 11/7/24.
//

import Foundation
import UIKit

var selectedDate = Date()

class CalendarViewController: UIViewController {
    
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var tableView: UITableView!
    
    var totalSquares = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(CalendarDataSource().dayMonthYearString(date: selectedDate))
        
        self.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: UIImage(named: "calendar-selected"))
        
        setMonthView()
        setUpCollectionView()
        setUpTableView()
        scrollToSelectedDate()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
        tableView.reloadData()
        scrollToSelectedDate()
    }
    
    private func setMonthView(){
        totalSquares.removeAll()
        
        var current = CalendarDataSource().sundayForDate(date: selectedDate)
        let nextSunday = CalendarDataSource().addDays(date: current, days: 7)
        
        while(current < nextSunday){
            totalSquares.append(current)
            current = CalendarDataSource().addDays(date: current, days: 1)
        }

        monthLabel.text = CalendarDataSource().monthString(date: selectedDate)
        + " " + CalendarDataSource().yearString(date: selectedDate)
        
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    private func setUpCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCollectionViewLayout()
        
        let nib = UINib(nibName: "CalendarCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CalendarCell")
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "EventCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EventCell")
        
    }
    
    private func scrollToSelectedDate() {
        guard let selectedIndex = totalSquares.firstIndex(of: selectedDate) else { return }
        let indexPath = IndexPath(item: selectedIndex, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    
    @IBAction func previousWeek(_ sender: Any){
        selectedDate = CalendarDataSource().addDays(date: selectedDate, days: -7)
        setMonthView()

    }
    @IBAction func nextWeek(_ sender: Any){
        selectedDate = CalendarDataSource().addDays(date: selectedDate, days: 7)
        setMonthView()
    }
}

extension CalendarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
            cell.day.textColor = UIColor.white
            cell.date.textColor = UIColor.white
            cell.day.textColor = UIColor.white
        } else {
            cell.backgroundColor = UIColor.systemGray6
            cell.day.textColor = UIColor.black
            cell.date.textColor = UIColor.black
            cell.day.textColor = UIColor.black
        }
        
        cell.date.text = CalendarDataSource().currentDateString(date: totalSquares[indexPath.row])
        cell.day.text = CalendarDataSource().dayString(date: totalSquares[indexPath.row])
        cell.layer.cornerRadius = 8
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquares[indexPath.row]
        print(selectedDate)
        collectionView.reloadData()
        tableView.reloadData()
    }
    
}



extension CalendarViewController: UICollectionViewDelegateFlowLayout {
    
    private func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {(section, _) ->
            
            NSCollectionLayoutSection? in
            if section == 0 {
                let item = NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1/7), heightDimension: .fractionalHeight(1)
                    )
                )
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(80)), subitem: item, count: 7)
                
                group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                
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

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Event().eventsForDate(date: selectedDate).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
        let event = Event().eventsForDate(date: selectedDate)[indexPath.row]
        print(event.dueDate)
        cell.eventTitle.text = event.title
        cell.time.text = CalendarDataSource().timeString(date: event.dueDate)
        cell.clockImage.image = UIImage(named: "clock.fill")
        cell.isCompleted.text = event.isCompleted == true ? "Done" : "In Progress"
        cell.isCompleted.layer.cornerRadius = 10
        cell.isCompleted.tintColor = .systemPurple
        return cell
    }
    
    
}
