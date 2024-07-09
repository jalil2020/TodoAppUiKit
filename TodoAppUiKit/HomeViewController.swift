//
//  HomeViewController.swift
//  TodoAppUiKit
//
//  Created by macbook pro on 09/07/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,TaskTableViewCellDelegate {
   
    
   
    

    @IBOutlet weak var tableView: UITableView!
     let vm = MainViewModel()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(TaskTableViewCell.nib(), forCellReuseIdentifier: TaskTableViewCell.indentifier)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func openCreateTaskScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let createTaskController = storyboard.instantiateViewController(identifier: "create_task_controller") as! CreateTaskScreenController
        createTaskController.vm = vm
        
        self.navigationController?.pushViewController(createTaskController, animated: true)
    
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.tempList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = vm.tempList[indexPath.row]
        let cell  = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.indentifier, for: indexPath) as!TaskTableViewCell
        
        cell.titleTask.text = task.title
        cell.descriptionTask.text = task.descreption
        cell.imageTask?.image = task.image
        cell.isCheckedd = task.status == StatusData.COMPLECTED
        cell.idd = task.id
        cell.delegate = self
        
      
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello \(indexPath) ")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("home viewWillAppear \(vm.tempList)")
    }
    override func viewDidAppear(_ animated: Bool) {
        vm.filterAndSort()
        tableView.reloadData()
    }
    
//    func coplectedButtonClick(in id: String, isChecked: Bool) {
//        vm.changeTaskStatus(b: !isChecked, id: id)
//        print("coplectedButtonClick\(isChecked)")
//        tableView.reloadRows(at: [IndexPath(row: index!, section: 0)], with: UITableViewRowAnimation.none)
//    }
    
    func coplectedButtonClick(in index: Int?, id: String, isChecked: Bool) {
        vm.changeTaskStatus(b: !isChecked, id: id)
        print("coplectedButtonClick\(isChecked)")
        tableView.reloadRows(at: [IndexPath(row: index ?? 0, section: 0)], with: UITableView.RowAnimation.none)

        viewDidLoad()
    }
}
