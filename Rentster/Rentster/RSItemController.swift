//
//  RSItemControllerViewController.swift
//  Rentster
//
//  Created by Apple Club on 15/11/5.
//  Copyright © 2015年 Shepard Wang. All rights reserved.
//

import UIKit

class RSItemController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    let scrollWidth = UIScreen.mainScreen().bounds.width
    var currentY:CGFloat = 0
    //i dont know why, we need to set the Y of CGRect to -65 to let it lie on the top
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Item Detail"
        
        let itemImage = UIImage(named: "pic0")
        let picHeight = itemImage!.size.height * CGFloat(scrollWidth) / itemImage!.size.width
        let itemPicView = UIImageView(frame: CGRectMake(20, 0 , scrollWidth-40 , picHeight))
        itemPicView.image = itemImage
        scrollView.addSubview(itemPicView)
    
        currentY += picHeight
        
//        UIFont *font = [UIFont fontWithName:@"Arial" size:12];
//        //设置一个行高上限
//        CGSize size = CGSizeMake(320,2000);
//        //计算实际frame大小，并将label的frame变成实际大小
//        CGSize labelsize = [s sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];
//        [label setFrame:CGRectMake:(0,0, labelsize.width, labelsize.height)];
        currentY += 10
        let nameLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
        nameLabel.numberOfLines = 0
        nameLabel.text = "Ktm Bicycle, chrome tires, extra light"
        nameLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        nameLabel.font = UIFont.systemFontOfSize(42)
        let maxSize = CGSize(width: scrollWidth , height: 2000)
        var actualSize = nameLabel.sizeThatFits(maxSize)
        nameLabel.frame = CGRectMake(20, CGFloat(currentY), actualSize.width , actualSize.height)
        scrollView.addSubview(nameLabel)
        currentY += actualSize.height
        
        currentY += 10
        let priceLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
        priceLabel.numberOfLines = 0
        priceLabel.text = "25 RMB/Hour"
        priceLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        priceLabel.font = UIFont.systemFontOfSize(30)
        actualSize = priceLabel.sizeThatFits(maxSize)
        priceLabel.frame = CGRectMake(20, CGFloat(currentY), actualSize.width , actualSize.height)
        scrollView.addSubview(priceLabel)
        currentY += actualSize.height
        
        let safetyLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
        safetyLabel.numberOfLines = 0
        safetyLabel.text = "Safety deposit"
        safetyLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        safetyLabel.font = UIFont.systemFontOfSize(19)
        actualSize = safetyLabel.sizeThatFits(maxSize)
        safetyLabel.frame = CGRectMake(20, CGFloat(currentY), actualSize.width , actualSize.height)
        safetyLabel.textColor = UIColor.lightGrayColor()
        scrollView.addSubview(safetyLabel)
        
        let safetyNumberLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
        safetyNumberLabel.numberOfLines = 0
        safetyNumberLabel.text = "250RMB"
        safetyNumberLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        safetyNumberLabel.font = UIFont.systemFontOfSize(19)
        actualSize = safetyNumberLabel.sizeThatFits(maxSize)
        safetyNumberLabel.frame = CGRectMake(safetyLabel.frame.width+25, CGFloat(currentY), actualSize.width , actualSize.height)
        safetyNumberLabel.textColor = UIColor.lightGrayColor()
        scrollView.addSubview(safetyNumberLabel)
        currentY += actualSize.height
        
        currentY += 4
        var line1 = UIView(frame: CGRectMake(20, currentY, scrollWidth, 1))
        line1.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        scrollView.addSubview(line1)
        currentY += 8
        
        let pickLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
        pickLabel.numberOfLines = 0
        pickLabel.text = "Pickup date"
        pickLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        pickLabel.font = UIFont.systemFontOfSize(19)
        actualSize = pickLabel.sizeThatFits(maxSize)
        pickLabel.textAlignment = NSTextAlignment.Center
        pickLabel.frame = CGRectMake(0, CGFloat(currentY), scrollWidth/2 , actualSize.height)
        scrollView.addSubview(pickLabel)
        let dropLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
        dropLabel.numberOfLines = 0
        dropLabel.text = "Drop off date"
        dropLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        dropLabel.font = UIFont.systemFontOfSize(19)
        actualSize = dropLabel.sizeThatFits(maxSize)
        dropLabel.textAlignment = NSTextAlignment.Center
        dropLabel.frame = CGRectMake(scrollWidth/2, CGFloat(currentY), scrollWidth/2 , actualSize.height)
        scrollView.addSubview(dropLabel)
        
        let line2 = UIView(frame: CGRectMake(scrollWidth/2, currentY, 1, actualSize.height))
        line2.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        scrollView.addSubview(line2)
        currentY += actualSize.height
        
        let pickDateLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
        pickDateLabel.numberOfLines = 0
        pickDateLabel.text = "Nov 5th-10th"
        pickDateLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        pickDateLabel.font = UIFont.systemFontOfSize(19)
        pickDateLabel.textColor = UIColor.lightGrayColor()
        actualSize = pickDateLabel.sizeThatFits(maxSize)
        pickDateLabel.textAlignment = NSTextAlignment.Center
        pickDateLabel.frame = CGRectMake(0, CGFloat(currentY), scrollWidth/2 , actualSize.height)
        scrollView.addSubview(pickDateLabel)
        let dropDateLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
        dropDateLabel.numberOfLines = 0
        dropDateLabel.text = "Nov 15th"
        dropDateLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        dropDateLabel.font = UIFont.systemFontOfSize(19)
        dropDateLabel.textColor = UIColor.lightGrayColor()
        actualSize = dropDateLabel.sizeThatFits(maxSize)
        dropDateLabel.textAlignment = NSTextAlignment.Center
        dropDateLabel.frame = CGRectMake(scrollWidth/2, CGFloat(currentY), scrollWidth/2 , actualSize.height)
        scrollView.addSubview(dropDateLabel)
        
        let line3 = UIView(frame: CGRectMake(scrollWidth/2, currentY, 1, actualSize.height))
        line3.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        scrollView.addSubview(line3)
        currentY += actualSize.height
    
        
        currentY += 3
        
        let line4 = UIView(frame: CGRectMake(0, currentY, scrollWidth, 7))
        line4.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        scrollView.addSubview(line4)
        currentY += 20
        
        let detailKeys = ["Condition","Quantity","EAN","Case","UPC","Band Material","MPN","Band Color","Brand","Metal","Model"]
        let detailValues = ["New","2","Does Not Apply","42mm","Does Not Apply","Silicone/Rubber","MJ3T2ZP/A","Black","KTM","Iron,Aluminium","KTM MX-345"]
        for(var i = 0 ; i < detailKeys.count ; i = i + 1) {
            let detailKeyLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
            detailKeyLabel.numberOfLines = 0
            detailKeyLabel.text = detailKeys[i]
            detailKeyLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            detailKeyLabel.font = UIFont.systemFontOfSize(19)
            actualSize = detailKeyLabel.sizeThatFits(maxSize)
            detailKeyLabel.frame = CGRectMake(20, CGFloat(currentY), actualSize.width , actualSize.height)
            detailKeyLabel.textColor = UIColor.lightGrayColor()
            scrollView.addSubview(detailKeyLabel)
            
            let detailValueLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
            detailValueLabel.numberOfLines = 0
            detailValueLabel.text = detailValues[i]
            detailValueLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
            detailValueLabel.font = UIFont.systemFontOfSize(19)
            actualSize = detailValueLabel.sizeThatFits(maxSize)
            detailValueLabel.frame = CGRectMake(scrollWidth*2/5, CGFloat(currentY), actualSize.width , actualSize.height)
//            detailValueLabel.textColor = UIColor.lightGrayColor()
            scrollView.addSubview(detailValueLabel)
            
            currentY += actualSize.height + 8
        }
        
        let aboutLabel = UILabel(frame: CGRectMake(0, currentY, scrollWidth, 40))
        aboutLabel.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        aboutLabel.text = "    About the Renter"
        aboutLabel.font = UIFont.systemFontOfSize(19)
        scrollView.addSubview(aboutLabel)
        currentY += aboutLabel.frame.height
        
        let contactKeys = ["Wechat","Phone Number","Email"]
        for(var i=0 ; i < contactKeys.count ; i = i + 1 ){
            let contactButton = UIButton(frame: CGRectMake(20, currentY, scrollWidth, 45))
            contactButton.setTitle(contactKeys[i], forState: UIControlState.Normal)
            contactButton.titleLabel?.font = UIFont.systemFontOfSize(19)
//            contactButton.titleLabel?.textAlignment = NSTextAlignment.Left
            contactButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            contactButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
            contactButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            
            contactButton.addTarget(self, action: Selector("touchContact:") , forControlEvents: UIControlEvents.TouchUpInside)
            
            scrollView.addSubview(contactButton)
            currentY += contactButton.frame.height
            
            var line = UIView(frame: CGRectMake(0, currentY, scrollWidth, 1))
            line.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
            scrollView.addSubview(line)
        }
        
        scrollView.contentSize = CGRectMake(0, 0, scrollWidth, currentY).size
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
    }

    func touchContact(button:UIButton) {
        print(button.titleLabel?.text)
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
