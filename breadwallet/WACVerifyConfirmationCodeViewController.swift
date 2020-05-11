//
//  WACVerifyConfirmationCodeViewController.swift
//  test3
//
//  Created by Gardner von Holt on 4/29/20.
//  Copyright © 2020 Gardner von Holt. All rights reserved.
//

import UIKit
import WacSDK

class WACVerifyConfirmationCodeViewController: UIViewController {
    @IBOutlet weak var confirmationCode: UITextField!

    var client: WAC?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func confirm(_ sender: Any) {

        
        client?.checkCodeStatus(confirmationCode.text!, completion: { (response: CodeStatusResponse) in
            if response.result == "error" {
                let message = response.error?.message
                self.showAlert("Error", message: message!)
            } else {
                self.showAlert("Result", message: response.result)
            }
        })

    }
}

extension WACVerifyConfirmationCodeViewController: LoginProtocol {

    func onLogin(_ sessionKey: String) {
        print(sessionKey)
        clientSessionKey = sessionKey
    }

    func onError(_ errorMessage: String?) {
        showAlert("Error", message: errorMessage!)
    }

}
