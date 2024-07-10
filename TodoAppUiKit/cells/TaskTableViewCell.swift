//
//  TaskTableViewCell.swift
//  TodoAppUiKit
//
//  Created by macbook pro on 09/07/24.
//

import UIKit

protocol TaskTableViewCellDelegate: AnyObject {
    func coplectedButtonClick(in index:IndexPath, id: String, isChecked:Bool)
}

class TaskTableViewCell: UITableViewCell {

    weak var delegate: TaskTableViewCellDelegate?
    
    var idd:String!
    var isCheckedd:Bool!
    var index:IndexPath!
    @IBOutlet weak var imageTask: UIImageView!
    @IBOutlet weak var titleTask: UILabel!
    @IBOutlet weak var descriptionTask: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBOutlet weak var date: UILabel!
    static let indentifier = "TaskTableViewCell"
    
    
    override func prepareForReuse() {
        imageTask.image = nil
        titleTask.text = ""
        idd = ""
        descriptionTask.text = ""
        isCheckedd = false
        checkButton.setImage(nil, for: .normal)
    }
    
   static func nib() ->  UINib{
       return UINib(nibName: "TaskTableViewCell", bundle: nil )
    }
    
    

    
    @objc func complectedCheckButtonClick(_ sender: Any) {
        if index == nil {return}
            
        delegate?.coplectedButtonClick(in: index, id: idd,isChecked: isCheckedd)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkButton.addTarget(self, action: #selector(complectedCheckButtonClick), for: .touchUpInside)
        
        print("awakeFromNib")
//        if let a = isCheckedd {
//            checkButton.setImage(UIImage(systemName:"square"),for: .normal)
//                }
//                else {
//            checkButton.setImage( UIImage(systemName:"square.fill"),for: .normal)
//            }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkButtonClick(_ sender: Any) {
        print("checkButtonClick")
    }
}
