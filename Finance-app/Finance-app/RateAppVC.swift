//
//  RateAppVC.swift
//  Finance-app
//
//  Created by Fazil P on 28/09/2022.
//

import UIKit

class RateAppVC: UIViewController {
    
    
    @IBOutlet var Ratingimage1: UIImageView!
    @IBOutlet var Ratingimage2: UIImageView!
    @IBOutlet var Ratingimage3: UIImageView!
    @IBOutlet var Ratingimage4: UIImageView!
    @IBOutlet var Ratingimage5: UIImageView!
    
    @IBOutlet var RateLabel: UILabel!
    @IBOutlet var RateInfoLabel: UILabel!
    @IBOutlet var CommonttextView: UITextView!
    
    
    private var placeHolderLabel = UILabel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.prefersLargeTitles = false
        
        placeHolderLabel.text = "Comment"
        placeHolderLabel.font = UIFont.systemFont(ofSize: CommonttextView.font!.pointSize)
        placeHolderLabel.sizeToFit()
        placeHolderLabel.frame.origin = CGPoint(x: 5, y: CommonttextView.font!.pointSize / 2)
        placeHolderLabel.textColor = UIColor.label
        placeHolderLabel.isHidden = !CommonttextView.text.isEmpty
        CommonttextView.addSubview(placeHolderLabel)
       
        loadData()
        
        
    }

    
    func loadData() {
        
        Ratingimage1.tintColor = AppColor.Theme
        Ratingimage2.tintColor = AppColor.Theme
        Ratingimage3.tintColor = AppColor.Theme
        Ratingimage4.tintColor = AppColor.Theme
        Ratingimage5.tintColor = UIColor.systemGray
        RateLabel.text = "4.0"
        RateInfoLabel.text = "It's Good"
    }
    
    
    @IBAction func actionCancel(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func actionDone(_ sender: Any) {
        
        print(#function)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionRating1(_ sender: Any) {
        
        print(#function)
        Ratingimage1.tintColor = AppColor.Theme
        Ratingimage2.tintColor = UIColor.systemGray
        Ratingimage3.tintColor = UIColor.systemGray
        Ratingimage4.tintColor = UIColor.systemGray
        Ratingimage5.tintColor = UIColor.systemGray
    }
    
    @IBAction func actionRating2(_ sender: Any) {
        
        print(#function)
        Ratingimage1.tintColor = AppColor.Theme
        Ratingimage2.tintColor = AppColor.Theme
        Ratingimage3.tintColor = UIColor.systemGray
        Ratingimage4.tintColor = UIColor.systemGray
        Ratingimage5.tintColor = UIColor.systemGray
    }
    
    @IBAction func actionRating3(_ sender: Any) {
        
        print(#function)
        Ratingimage1.tintColor = AppColor.Theme
        Ratingimage2.tintColor = AppColor.Theme
        Ratingimage3.tintColor = AppColor.Theme
        Ratingimage4.tintColor = UIColor.systemGray
        Ratingimage5.tintColor = UIColor.systemGray
    }
    @IBAction func actionRating4(_ sender: Any) {
        
        print(#function)
        Ratingimage1.tintColor = AppColor.Theme
        Ratingimage2.tintColor = AppColor.Theme
        Ratingimage3.tintColor = AppColor.Theme
        Ratingimage4.tintColor = AppColor.Theme
        Ratingimage5.tintColor = UIColor.systemGray
    }
    @IBAction func actionRating5(_ sender: Any) {
        
        print(#function)
        Ratingimage1.tintColor = AppColor.Theme
        Ratingimage2.tintColor = AppColor.Theme
        Ratingimage3.tintColor = AppColor.Theme
        Ratingimage4.tintColor = AppColor.Theme
        Ratingimage5.tintColor = AppColor.Theme
    }
    
    
}



extension RateAppVC: UITextViewDelegate {

    //-------------------------------------------------------------------------------------------------------------------------------------------
    func textViewDidChange(_ textView: UITextView) {

        placeHolderLabel.isHidden = !textView.text.isEmpty
    }
}


// MARK: -

// This for only testing purpose ... github
