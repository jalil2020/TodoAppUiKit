//
//  TaskTableViewCell.swift
//  TodoAppUiKit
//
//  Created by macbook pro on 09/07/24.
//

import UIKit

protocol TaskTableViewCellDelegate: AnyObject {
    func coplectedButtonClick(in index:Int?, id: String, isChecked:Bool)
}

class TaskTableViewCell: UITableViewCell {

    weak var delegate: TaskTableViewCellDelegate?
    
    var idd:String!
    var isCheckedd:Bool!
    var index:Int!
    @IBOutlet weak var imageTask: UIImageView!
    @IBOutlet weak var titleTask: UILabel!
    @IBOutlet weak var descriptionTask: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
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
        delegate?.coplectedButtonClick(in: index, id: idd,isChecked: isCheckedd)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        checkButton.addTarget(self, action: #selector(complectedCheckButtonClick), for: .touchUpInside)
        
        if let a = isCheckedd {
            checkButton.setImage(UIImage(systemName:"square"),for: .normal)
                }
                else {
            checkButton.setImage( UIImage(systemName:"square.fill"),for: .normal)
            }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func checkButtonClick(_ sender: Any) {
        print("checkButtonClick")
//        if let a = isCheckedd {
//            checkButton.setImage(UIImage(systemName:"square"),for: .normal)
//            isCheckedd = false
//                }
//                else {
//            checkButton.setImage( UIImage(systemName:"square.fill"),for: .normal)
//                    isCheckedd = true
//            }
    }
}
