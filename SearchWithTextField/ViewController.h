//
//  ViewController.h
//  SearchWithTextField
//
//  Created by ClickappsUser3 on 21/06/16.
//  Copyright © 2016 ClickappsUser3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mytableVew;
@property (weak, nonatomic) IBOutlet UITextField *txtSerch;


@end

