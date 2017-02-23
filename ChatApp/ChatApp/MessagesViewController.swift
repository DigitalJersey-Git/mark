//
//  MessagesViewController.swift
//  ChatApp
//
//  Created by Mark Stephenson on 23/02/2017.
//  Copyright © 2017 Mark Stephenson. All rights reserved.
//

import UIKit 

class MessagesViewController: UIViewController {
    @IBOutlet weak var tblMessagesTable: UITableView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomeLabel.text = "Welcome \(defaults.value(forKey: "username") as! String)"
        
        // Table
        
        let tableView = UITableView(frame: view.bounds)
        view.addSubview(tableView)
        self.tblMessagesTable = tableView
        
        tableView.dataSource = self
        tableView.delegate = self

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension MessagesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Getting the right element
        let message = messageData[indexPath.row]
        
        // Trying to reuse a cell
        let cellIdentifier = "MessageCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        
        // Adding the right informations
        cell.textLabel?.text = message.from
        cell.detailTextLabel?.text = message.content
        
        // Returning the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
