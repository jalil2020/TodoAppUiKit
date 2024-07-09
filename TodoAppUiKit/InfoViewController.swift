//
//  InfoViewController.swift
//  TodoAppUiKit
//
//  Created by macbook pro on 09/07/24.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var titleText: UILabel!
    
    @IBOutlet weak var descriptionText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dateText: UILabel!
    
    var data:TaskData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        titleText.text = data?.title
        descriptionText.text = data?.descreption
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        let formattedDate = dateFormatter.string(from: data?.date ?? Date.now)
        dateText.text = formattedDate
        imageView.image = data?.image
        
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
