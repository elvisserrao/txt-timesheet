

Txt-timesheet [![Gem Version](https://badge.fury.io/rb/txt_timesheet.svg)](https://badge.fury.io/rb/txt_timesheet)
====================

Timesheet calculator for .txt files.

Installation
------------
	gem install txt_timesheet

How it works
------------

Given 3 files like these

`file1.txt`: 


    ## Timesheet
    
    morning: 09:13
    brb lunch: 12:03
    back: 13:56
    leaving: 20:53
    
    ## What Happened?
    

`file2.txt`: 

    ## Timesheet

    morning: 09:59
    brb lunch: 12:07
    back: 13:40
    brb: 18:41
    back: 20:53
    leaving: 22:53
    
    ## Daily report
    
    Leaving:

`file3.txt`:

    ## Timesheet
    
    morning: 09:45
    brb lunch: 12:28
    back: 13:31
    brb: 18:07
    back: 23:11
    leaving: 23:11
    
    ## Daily report
    
    Leaving:
    - syncs with Flávia, and with Iago and Arthur
    - started working on CRM side to create user with password in authenticator

   
Your output should be like this:

    $ timesheet file1.txt file2.txt file3.txt     
    
    REPORT:
    file1.txt: 09:47 hours
    file2.txt: 09:09 hours
    file3.txt: 07:19 hours
    Total Hours: 26:15 hours

