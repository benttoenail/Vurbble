//
//  MessagesViewController.swift
//  vurbble
//
//  Created by Max Rose on 6/7/15.
//  Copyright (c) 2015 Max Rose. All rights reserved.
//

import UIKit

class MessagesViewController: JSQMessagesViewController {

    var room :PFObject!
    var incomingUser : PFUser!
    var users = [PFUser]()
    
    var messages = [JSQMessage]()
    var messageObjects = [PFObject]()
    
    var outgoingBubbleImage = JSQMessagesBubbleImage()
    var incomingBubbleImage = JSQMessagesBubbleImage()
    
    var selfAvatar = JSQMessagesAvatarImage()
    var incomingAvatar = JSQMessagesAvatarImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Messages"
        self.senderId = PFUser.currentUser()?.objectId
        self.senderDisplayName = PFUser.currentUser()?.username
        
        let selfUsername = PFUser.currentUser()!.username as! NSString
        let incomingUserName = incomingUser!.username as! NSString
        
        //create the bubble shapes
        selfAvatar = JSQMessagesAvatarImageFactory.avatarImageWithUserInitials(selfUsername.substringWithRange(NSMakeRange(0, 2)), backgroundColor: UIColor.blackColor(), textColor: UIColor.whiteColor(), font: UIFont.systemFontOfSize(14), diameter: UInt(kJSQMessagesCollectionViewAvatarSizeDefault))
        
        incomingAvatar = JSQMessagesAvatarImageFactory.avatarImageWithUserInitials(incomingUserName.substringWithRange(NSMakeRange(0, 2)), backgroundColor: UIColor.blackColor(), textColor: UIColor.whiteColor(), font: UIFont.systemFontOfSize(14), diameter: UInt(kJSQMessagesCollectionViewAvatarSizeDefault))
        
        let bubbleFactory = JSQMessagesBubbleImageFactory()
        
        outgoingBubbleImage = bubbleFactory.outgoingMessagesBubbleImageWithColor(UIColor.lightGrayColor())
        incomingBubbleImage = bubbleFactory.incomingMessagesBubbleImageWithColor(UIColor.darkGrayColor())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
