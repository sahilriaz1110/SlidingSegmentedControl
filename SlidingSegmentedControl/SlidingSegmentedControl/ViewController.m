//
//  ViewController.m
//  SlidingSegmentedControl
//
//  Created by Sahil Riaz on 12/12/13.
//  Copyright (c) 2013 Impressico Business Solutions. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    journals = [[NSMutableArray alloc]init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 49, 320, 29)];
    self.segmentedControl.frame = CGRectMake(0, 0, 640, 29);
    
    scrollView.contentSize = CGSizeMake(self.segmentedControl.frame.size.width, self.segmentedControl.frame.size.height -1);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    self.segmentedControl.selectedSegmentIndex = 0;
    
    [scrollView addSubview:self.segmentedControl];
    [self.view addSubview:scrollView];
    
    [self fillJournals];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *staticIdentifier = @"JournalCell";
    
    JournalCell *cell = (JournalCell*)[tableView dequeueReusableCellWithIdentifier:staticIdentifier forIndexPath:indexPath];
    
    cell.journalLabel.text = [journals objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)fillJournals
{
    [journals removeAllObjects];
    
    NSString *segmentName = [self.segmentedControl titleForSegmentAtIndex:self.segmentedControl.selectedSegmentIndex];
    
    for (int i=0; i<5; i++) {
        [journals addObject:[NSString stringWithFormat:@"%@ %d",segmentName,i+1]];
    }
}

- (IBAction)categoryDidChange:(id)sender
{
    [self fillJournals];
    [self.tableView reloadData];
}

@end
