# AON_Homework

## Overview

This is a sample project for AON.  It implements a system that stores a collection of named value pairs. Users can query the system for values and also set new values.  As currently implemented, it suppors only text and integer values.  The commands supported are:

Get - Returns value of a variable

For example, to get the value of the variable 'X'
```
>
get X
'X' = 'value'
>
```
To output all values currently stored, use the asterisk (i.e. '*')
```
>
get *
'y' = 1234
'x' = 'asdfasdf'
>
```

Note: String values are quoted (i.e. 'This is a string') whereas integers are not)


Set - Assigns a value to a variable
The Set command stores integers or strings.
```
set y=1234
> 
get *
'y' = 1234
'x' = 'asdfasdf'
```
>

## System Requirements
This project is implented with Swift 5 as a command line appliction and requires Xcode v.10.2 to compile and run. As a command line applicaton it only does standard io and is run in a terminal window.  No OS-specific interfacew is used.

## Main Classes
* Command Processor

The CommandProcessor is responsible for determining which command is entered and executing the command.  

* Commands
  * CommandBase
  
  The CommandBase class is the superclass to all commands. It defines two abstract methods:
    1. Execute()
    
         The Execute() method is an abstract method. All command subclasses my implement in order to define the action it performs. 
    2. Parse()
    
         The Parse() method is an abstract method.  All command subclasses my implement in order to determine if input is one of its own commands.  
  
  
  Additionally, it defines CommandParseResult values used for parsing results.
  
  * Get Command
  
    The get command provides a way for the user to see what is currently stored. It uses Regex to determine whether or not it get command and extract varible name paramater
    
  * Set Command
  
## Command Objects
* Get Command

* Set Command

## Example Session


## Optimizations

### Individual Command Regular Expressions

### Unit Test Improvements
* better value recognition
