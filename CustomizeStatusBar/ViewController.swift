//
//  ViewController.swift
//  CustomizeStatusBar
//
//  Created by Nilam Monpura on 25/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
      //  self.SetStatusBar()
        self.statusBarColorChange()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool)
    {
        
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    func First() -> Void
    {
        let nav = self.navigationController?.navigationBar
        nav?.barTintColor = .yellow
        nav?.tintColor = .blue
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        setNeedsStatusBarAppearanceUpdate()
    }
    func SetStatusBar() -> Void
    {
        let statusBarView = UIView()
        view.addSubview(statusBarView)
        statusBarView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statusBarView.topAnchor.constraint(equalTo: view.topAnchor),
            statusBarView.leftAnchor.constraint(equalTo: view.leftAnchor),
            statusBarView.rightAnchor.constraint(equalTo: view.rightAnchor),
            statusBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        statusBarView.backgroundColor = .blue
    }
    func Third() -> Void
    {
      
    }
}

extension UIViewController {

  func statusBarColorChange() {

    if #available(iOS 13.0, *) {

        let statusBar = UIView(frame: UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero)
        statusBar.backgroundColor = .yellow
        self.navigationController?.navigationBar.barTintColor =  .brown
     //   self.navigationController?.navigationBar.tintColor = .green
            statusBar.tag = 100
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBar)

    } else {

            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = .yellow

        }
    } }
