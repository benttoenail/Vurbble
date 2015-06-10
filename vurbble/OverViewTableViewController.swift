//
//  OverViewTableViewController.swift
//  vurbble
//
//  Created by Max Rose on 6/5/15.
//  Copyright (c) 2015 Max Rose. All rights reserved.
//

import UIKit

class OverViewTableViewController: UITableViewController {

    @IBOutlet weak var logOutButton: UIBarButtonItem!
    @IBOutlet weak var ChooseFriendButton: UIBarButtonItem!
    
    var rooms = [PFObject]()
    var users = [PFUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setLeftBarButtonItem(logOutButton, animated: false)
        self.navigationItem.setRightBarButtonItem(ChooseFriendButton, animated: false)
      
    }
    
    override func viewWillAppear(animated: Bool) {
        
        if PFUser.currentUser() != nil {
            loadData()
        }
        
    }
    
    func loadData(){
        rooms = [PFObject]()
        users = [PFUser]()
        
        self.tableView.reloadData()
        
        let pred = NSPredicate(format: "user1 = %@ OR user2 = %@", PFUser.currentUser()!, PFUser.currentUser()!)

        let roomQuery = PFQuery(className: "Room", predicate: pred)
        roomQuery.includeKey("user1")
        roomQuery.includeKey("user2")
        
        roomQuery.findObjectsInBackgroundWithBlock { (results:[AnyObject]?, error:NSError?) -> Void in
            if error == nil{
                self.rooms = results as! [PFObject]
                
                for room in self.rooms {
                    let user1 = room.objectForKey("user1") as! PFUser
                    let user2 = room["user2"] as! PFUser
                    
                    if user1.objectId != PFUser.currentUser()?.objectId{
                        self.users.append(user1)
                    }
                    
                    if user2.objectId != PFUser.currentUser()?.objectId{
                        self.users.append(user2)
                    }
                }
                
                self.tableView.reloadData()
            }
        }
        
        
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // Return the number of rows in the section.
        return rooms.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! OverViewTableViewCell

        // Configure the cell...
        let targetUser = users[indexPath.row]
        
        cell.nameLabel.text = targetUser.username

        return cell
    }
    
    
    @IBAction func logOut(sender: AnyObject) {
        
        PFUser.logOut()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
