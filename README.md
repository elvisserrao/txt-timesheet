

Txt-timesheet [![Gem Version](https://badge.fury.io/rb/txt_timesheet.svg)](https://badge.fury.io/rb/txt_timesheet)
====================

Timesheet calculator for .txt files.

Installation
------------
	gem install txt_timesheet

How to use
------------
Create a file named timesheet.rb on your root folder.

    $ touch timesheet.rb

Create a folder named "assets" on the root folder of your project

    $ mkdir assets
    
The root folder of your project should look like this:
    
    $ ls
    assets/  timesheet.rb

Then put your .txt files on assets folder.
    
In your timesheet.rb file:
   
    require 'txt_timesheet'
    
    timesheetObject = Txt_timesheet.new
    
    timesheetObject.run
    
Then, run timesheet.rb and pass the files as parameters:

    $ timesheet.rb file1.txt file2.txt file3.txt      

    

Your output should be like this:

    $ timesheet.rb file1.txt file2.txt file3.txt     
    
    REPORT:
    file1.txt: 09:47 hours
    file2.txt: 09:09 hours
    file3.txt: 07:19 hours
    Total Hours: 26:15 hours

