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
    
    let scrollWidth = UIScreen.mainScreen().bounds.width-40
    let topBase:CGFloat = -65
    var currentY:CGFloat = 0
    //i dont know why, we need to set the Y of CGRect to -65 to let it lie on the top
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentY = topBase
        // Do any additional setup after loading the view.
        //        these are for catalog
//        for(var i = 0 ; i<1 ; i++){
//            var itemPicView = UIImageView(frame: CGRectMake(0, scrollWidth*3/4 * CGFloat(i) + CGFloat(topBase), scrollWidth , scrollWidth*3/4))
//            itemPicView.contentMode = UIViewContentMode.ScaleAspectFill
//            itemPicView.image = UIImage(named: "pic0")
//            scrollView.addSubview(itemPicView)
//        }
        
        let itemImage = UIImage(named: "pic0")
        let picHeight = itemImage!.size.height * CGFloat(scrollWidth) / itemImage!.size.width
        let itemPicView = UIImageView(frame: CGRectMake(0, CGFloat(topBase), scrollWidth , picHeight))
//        itemPicView.contentMode = UIViewContentMode.ScaleAspectFill
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
        nameLabel.frame = CGRectMake(0, CGFloat(currentY), actualSize.width , actualSize.height)
        scrollView.addSubview(nameLabel)
        currentY += actualSize.height
        
        currentY += 15
        let priceLabel = UILabel(frame: CGRectMake(0, CGFloat(currentY), scrollWidth , 110))
        priceLabel.numberOfLines = 0
        priceLabel.text = "25 RMB/Hour"
        priceLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        priceLabel.font = UIFont.systemFontOfSize(30)
        actualSize = priceLabel.sizeThatFits(maxSize)
        priceLabel.frame = CGRectMake(0, CGFloat(currentY), actualSize.width , actualSize.height)
        scrollView.addSubview(priceLabel)
        currentY += actualSize.height
        
        scrollView.contentSize = CGRectMake(0, 0, scrollWidth, 970).size
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
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
