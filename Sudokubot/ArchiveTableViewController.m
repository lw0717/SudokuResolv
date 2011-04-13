//
//  ArchiveTableViewController.m
//  Sudokubot
//
//  Created by Haoest on 4/12/11.
//  Copyright 2011 none. All rights reserved.
//

#import "ArchiveTableViewController.h"
#import "AppConfig.h"
#import "ArchiveEntry.h"

@implementation ArchiveTableViewController

@synthesize archiveContents;

- (void)dealloc
{
    [super dealloc];
}


+(ArchiveTableViewController*) archiveTableViewControllerFromDefaultArchive{
    ArchiveTableViewController* rv = [[ArchiveTableViewController alloc] initWithStyle:UITableViewStylePlain];
    rv.archiveContents = [ArchiveEntry loadArchive];
    return rv;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rv = [archiveContents count]; // exclude last row
    return rv;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSString *rowId = [NSString stringWithFormat:@"myRowId_%d", indexPath.row];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rowId];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rowId] autorelease];
	}
    ArchiveEntry *archiveEntry = [archiveContents objectAtIndex:indexPath.row];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:[NSString stringWithCString:archiveDateFormat encoding:NSASCIIStringEncoding]];
	NSString *label = [NSString stringWithFormat:@"%@ : %@", [dateFormatter stringFromDate:archiveEntry.creationDate], archiveEntry.comments ];
    [dateFormatter release];
	cell.textLabel.text = label;
	return cell;
}

-(void) tableview: (UITableView*) tableview didSelectRowAtIndexPath:(NSIndexPath*) indexPath{
//    BoardViewController* boardViewController = [[BoardViewController boardWithSolution:[]
    return;
}
@end