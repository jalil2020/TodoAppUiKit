//
//  SettingsController.swift
//  TodoAppUiKit
//
//  Created by macbook pro on 09/07/24.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var switchSort: UISwitch!
    
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var sortStatusButton: UIButton!
    let vm = MainViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSortOptions()
        setupFilterOptions()
        initSwitch()
        
    }
  
    
    func initSwitch(){
        switchSort.isOn = self.vm.isDescendingSort
    }
    
    @IBAction func changeSwitchSort(_ sender: Any) {
        let sw =  sender as? UISwitch
        self.vm.setIsDescendingSort(b: sw?.isOn ?? false)
    }
    func setupFilterOptions(){
        let actionClosure = { (action: UIAction) in
            print(action.title)
            self.vm.setFilter(status: action.title)
        }

     let menuChildren: [UIMenuElement] = [
         UIAction(title: StatusData.ALL.rawValue, state: self.vm.filter == StatusData.ALL.rawValue ? .on : .off, handler: actionClosure),
         UIAction(title: StatusData.PENDING.rawValue,state:  self.vm.filter == StatusData.PENDING.rawValue ? .on : .off, handler: actionClosure),
         UIAction(title: StatusData.COMPLECTED.rawValue, state:  self.vm.filter == StatusData.COMPLECTED.rawValue ? .on : .off, handler: actionClosure),
     ]
     
        
        filterButton.menu = UIMenu(options: .displayInline, children: menuChildren)
        filterButton.showsMenuAsPrimaryAction = true
        filterButton.changesSelectionAsPrimaryAction = true
        filterButton.frame = CGRect(x: 150, y: 200, width: 100, height: 40)
     
    }
    
    func setupSortOptions(){
        let actionClosure = { (action: UIAction) in
            print(action.title)
            self.vm.setComplectedSort(status: action.title)
        }

     let menuChildren: [UIMenuElement] = [
         UIAction(title: StatusData.ALL.rawValue, state: self.vm.complectedSort == StatusData.ALL.rawValue ? .on : .off, handler: actionClosure),
         UIAction(title: StatusData.PENDING.rawValue,state:  self.vm.complectedSort == StatusData.PENDING.rawValue ? .on : .off, handler: actionClosure),
         UIAction(title: StatusData.COMPLECTED.rawValue, state:  self.vm.complectedSort == StatusData.COMPLECTED.rawValue ? .on : .off, handler: actionClosure),
     ]
     
        
     sortStatusButton.menu = UIMenu(options: .displayInline, children: menuChildren)
     sortStatusButton.showsMenuAsPrimaryAction = true
     sortStatusButton.changesSelectionAsPrimaryAction = true
     sortStatusButton.frame = CGRect(x: 150, y: 200, width: 100, height: 40)
     
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
