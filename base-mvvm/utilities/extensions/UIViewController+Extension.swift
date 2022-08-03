import UIKit

extension UIViewController {
    
    func addLogoutButton() {
        let rightButtonItem = UIBarButtonItem.init(
              title: "Logout",
              style: .done,
              target: self,
              action: #selector(rightButtonAction(sender:))
        )
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem) {
       let logInViewcontroller = LoginViewController(nibName: "LoginViewController", bundle: nil)
        logInViewcontroller.modalPresentationStyle = .fullScreen
        self.navigationController?.present(logInViewcontroller, animated: true, completion: nil)
    }
}
