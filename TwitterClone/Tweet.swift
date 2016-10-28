//
//  Tweet.swift
//  TwitterClone
//
//  Created by Zachary West Guo on 10/20/16.
//  Copyright © 2016 zechariah. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text:NSString?
    var timestamp:NSDate?
    var retweet_count:Int = 0
    var favorite_count:Int = 0
    var author:User?
    
    init(dictionary:NSDictionary){
        text = dictionary["text"] as? String
        //if 'text' doesnt exist, the cast will fail and text will be nil
        
        let userDictionary = dictionary["user"] as! NSDictionary
        author = User(dictionary: userDictionary)
        
        retweet_count = (dictionary["retweet_count"] as? Int ) ?? 0
        //if retweet count doesnt exist, it will crash
        //so catch, if it doesn't exist, use 0
        favorite_count = (dictionary["favourites_count"] as? Int) ?? 0
        
        let timeStampString = dictionary["created_at"] as? String
        if let timeStampString = timeStampString{
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timeStampString)
        }
        
        
        
    }
    
    class func tweetsWithArray(dictionaries:[NSDictionary]) -> [Tweet]{
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
        
    }
}
