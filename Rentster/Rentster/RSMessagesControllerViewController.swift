//
//  MessagesControllerViewController.swift
//  Rentster
//
//  Created by Remi Robert on 02/10/15.
//  Copyright © 2015 Shepard Wang. All rights reserved.
//

import UIKit
import JSQMessagesViewController

class RSMessagesControllerViewController: JSQMessagesViewController {
    
    var messages = Array<JSQMessage>()
    
    func initRandomMessages() {
        messages.append(JSQMessage(senderId: "remi", displayName: "remi", text: "Hi"))
        messages.append(JSQMessage(senderId: "remi", displayName: "remi", text: "Hello"))
        messages.append(JSQMessage(senderId: "remi", displayName: "remi", text: "Goodbye"))
        self.finishReceivingMessage()
    }

    func sendMessage(text: String!, sender: String!) {
        messages.append(JSQMessage(senderId: "remirobert", displayName: "remirobert", text: text))
        self.finishSendingMessage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.senderId = "remirobert"
        self.senderDisplayName = "remirobert"
        
        initRandomMessages()
        automaticallyScrollsToMostRecentMessage = true
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
    }
}

//MARK: -

//MARK: JSQMessages delegate

extension RSMessagesControllerViewController {
    override func didPressSendButton(button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: NSDate!) {
        sendMessage(text, sender: senderId)
    }
}

//MARK: JSQMessages collection view delegate

extension RSMessagesControllerViewController {
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        return nil
    }
}

//MARK: JSQMessages collection view datasource

extension RSMessagesControllerViewController {
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        
        let currentMessage = messages[indexPath.row]
        cell.textView?.text = currentMessage.text
        cell.textView?.textColor = UIColor.blackColor()
        cell.messageBubbleContainerView?.backgroundColor = UIColor.orangeColor()
        return cell
    }
}
