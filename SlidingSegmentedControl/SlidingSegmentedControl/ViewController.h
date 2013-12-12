//
//  ViewController.h
//  SlidingSegmentedControl
//
//  Created by Sahil Riaz on 12/12/13.
//  Copyright (c) 2013 Impressico Business Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JournalCell.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *journals;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
- (IBAction)categoryDidChange:(id)sender;

@end
