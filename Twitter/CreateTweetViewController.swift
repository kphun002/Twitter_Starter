//
//  CreateTweetViewController.swift
//  Twitter
//
//  Created by Karol Phung on 10/10/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class CreateTweetViewController: UIViewController {
    
    @IBOutlet weak var tweetContent: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetContent.becomeFirstResponder()
    }
    
    @IBAction func didCancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTweetButton(_ sender: Any) {
        if !tweetContent.text.isEmpty {
            TwitterAPICaller.client?.postTweet(tweetString: tweetContent.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("There was an error \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }
        else {
            self.dismiss(animated: true, completion: nil)
        }
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
