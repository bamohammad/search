//
//  ViewController.m
//  SearchWithTextField
//
//  Created by ClickappsUser3 on 21/06/16.
//  Copyright © 2016 ClickappsUser3. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
NSMutableArray *countries;
NSArray *searchArray;
BOOL isFilter,empty;
NSString *searchTextString;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    countries=[NSMutableArray new];
    [countries addObject:@"Yemen"];
    [countries addObject:@"Yello"];
    [countries addObject:@"India"];
    [countries addObject:@"Oman"];
    [countries addObject:@"Qater"];
    [countries addObject:@"KSA"];
    [countries addObject:@"UAE"];
    [self.txtSerch addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


-(void)textFieldDidChange:(UITextField *)textField
{
    if(_txtSerch.text!=nil)
    {
    searchTextString=_txtSerch.text;
        empty=NO;
    }else{
        empty=YES;
    }
    [self updateSearchArray:searchTextString];
}
-(void)updateSearchArray:(NSString *)searchText
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH [c] %@", searchText];
    searchArray = [countries filteredArrayUsingPredicate:resultPredicate];
    isFilter=YES;
    [self.mytableVew reloadData];
}
#pragma mark - UITableView DataSource & Delegate Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    if(isFilter && [searchArray count]>0 &&  !empty)
    {
        return [searchArray count];
    }
    else
        return  [countries count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if(isFilter && [searchArray count]>0 )
    {
        cell.textLabel.text=[searchArray objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text=[countries objectAtIndex:indexPath.row];
    }
    
    return cell;
}

@end
