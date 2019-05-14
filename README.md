# AON_Homework

## Overview

This is a sample project for AON.  It implements a system that stores a collection of named value pairs. Users can query the system for values and also set new values.  Currently, it only supports text and integer values.  The commands supported are:

### Get - Returns value of a variable

For example, to get the value of the variable 'X', the command:
```
get X
```
Returns
```
'X' = 'value'
>
```
To output all values currently stored, use the asterisk (i.e. '*'):
```
get *
```
Returns
```
'y' = 1234
'x' = 'asdfasdf'
>
```

Note: String values are quoted (i.e. 'This is a string') whereas integers are not)


### Set - Assigns a value to a variable
The Set command stores integers or strings. The commands:
```
set y=1234
set x=asdfasdf
get *
```
Returns
```
'y' = 1234
'x' = 'asdfasdf'
```
>

## System Requirements
This project is implented with Swift 5 as a command line appliction and requires Xcode v.10.2 to compile and run. As a command line applicaton it only does standard i/o and is run in a terminal window.  No OS-specific interface is used.

## Main Classes
Although the language used is Swift, it is simple enough that most programmers can understand.  One exception is the use of the Regular Expression classes which is particular to the Swift runtime. The regular expression themselves are standard regex constructs and are easily verified (see unit tests and also see any regex parser on the net like: https://regex101.com

Here are the primary classes that comprise this project:
* Main Program
* Command Processor
* CommandBase
* Get Command
* Set Command
* ObjectModel

### Main Program
The main program class implements the user input loop.  It receives user input,  sends it to the CommandProcessor for processing.  Once the input has been processed, it prompts the user ('>') for another command.  This continues until the user enters 'quit'.

### Command Processor

The CommandProcessor is responsible for determining which command is entered and executing the command.  The class also defines 'dataStore' collection where all values are stored.  The dataStore is a dictionary of ObjectModel objects with the variable name as the key.

### CommandBase
  
The CommandBase class is the superclass to all commands. It defines two abstract methods:
    
    1. Execute()
    The Execute() method is an abstract method. All command subclasses my implement in order to define the action it performs. 
    
    2. Parse()
    The Parse() method is an abstract method.  All command subclasses my implement in order to determine if input is one of its own commands.  
  
  Additionally, it defines CommandParseResult enum values used for parsing results.
  

### Command Objects
The command objects rely on regular expressions to parse the command lines.  This simplifies the parsing logic.  But note that when new command sublasses are added, they can parse the command any way that is required beside regex.

#### Get Command
The get command provides a way for the user to see what is currently stored. It uses Regex to determine whether or not it get command and extract varible name paramater
    
#### Set Command
The is similar to the Get command class in thast it uses regex to verify that it is a set command and extracts the variable name and value.  It overrides Execute( to save the new values to storage.

### ObjectModel
The ObjectModel class stroes the particulars of each value object:
* Name - The name of the variable and is used for the key into the dataStore dictoinary.
* Value - All values are stored as strings.  When outputted, string values are single-quoted.
* Type - Values are either a striung or a number.
On initialization type is determined and set.


## Example Session
```
usage:
AONCommandLine

SET <property name> = <value>
  Will set the value of <property name>
  If <property name> does not exists it is created.
 
GET <property name>
  Will return the value of <property name>
 
GET *
  Will return the all property names and their values define in no specific order.
>
get *
No values stored
> 
geeet *
Command error: Parse_Error_General
> 
get X
variable 'X' does not exist.
> 
set x=123
> 
get x
x = 123
> 
set y=Mytesting
> 
get *
'x' = 123
'y' = 'Mytesting'
> 
quit
exiting...
Program ended with exit code: 0
```

## Unit Tests
The unit tests are run against the following classes:
* GetCommand
* SetCommand
* CommandProcessor
* ObjectModel

Unit test results: ```Test Suite 'All tests' passed at 2019-05-14 14:00:17.633.```
```
Test Suite 'All tests' started at 2019-05-14 14:00:17.513
Test Suite 'UnitTests.xctest' started at 2019-05-14 14:00:17.514
Test Suite 'TestCommandProcessor' started at 2019-05-14 14:00:17.515
Test Case '-[UnitTests.TestCommandProcessor testProcess]' started.
No values stored
Test Case '-[UnitTests.TestCommandProcessor testProcess]' passed (0.103 seconds).
Test Case '-[UnitTests.TestCommandProcessor testProcess_Error]' started.
Test Case '-[UnitTests.TestCommandProcessor testProcess_Error]' passed (0.001 seconds).
Test Suite 'TestCommandProcessor' passed at 2019-05-14 14:00:17.619.
	 Executed 2 tests, with 0 failures (0 unexpected) in 0.103 (0.105) seconds
Test Suite 'TestGetCommand' started at 2019-05-14 14:00:17.620
Test Case '-[UnitTests.TestGetCommand testGetCmd]' started.
Test Case '-[UnitTests.TestGetCommand testGetCmd]' passed (0.001 seconds).
Test Case '-[UnitTests.TestGetCommand testGetCommand_WhiteSpace]' started.
Test Case '-[UnitTests.TestGetCommand testGetCommand_WhiteSpace]' passed (0.001 seconds).
Test Case '-[UnitTests.TestGetCommand testInvalidCommand]' started.
Test Case '-[UnitTests.TestGetCommand testInvalidCommand]' passed (0.001 seconds).
Test Suite 'TestGetCommand' passed at 2019-05-14 14:00:17.623.
	 Executed 3 tests, with 0 failures (0 unexpected) in 0.002 (0.003) seconds
Test Suite 'TestObjectModel' started at 2019-05-14 14:00:17.623
Test Case '-[UnitTests.TestObjectModel testObjectModel_describe]' started.
Test Case '-[UnitTests.TestObjectModel testObjectModel_describe]' passed (0.001 seconds).
Test Case '-[UnitTests.TestObjectModel testObjectModel_init]' started.
Test Case '-[UnitTests.TestObjectModel testObjectModel_init]' passed (0.000 seconds).
Test Suite 'TestObjectModel' passed at 2019-05-14 14:00:17.625.
	 Executed 2 tests, with 0 failures (0 unexpected) in 0.001 (0.002) seconds
Test Suite 'TestSetCommand' started at 2019-05-14 14:00:17.626
Test Case '-[UnitTests.TestSetCommand testSetCommand_Parse]' started.
Test Case '-[UnitTests.TestSetCommand testSetCommand_Parse]' passed (0.005 seconds).
Test Case '-[UnitTests.TestSetCommand testSetCommand_WhiteSpace]' started.
Test Case '-[UnitTests.TestSetCommand testSetCommand_WhiteSpace]' passed (0.001 seconds).
Test Suite 'TestSetCommand' passed at 2019-05-14 14:00:17.632.
	 Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds
Test Suite 'UnitTests.xctest' passed at 2019-05-14 14:00:17.632.
	 Executed 9 tests, with 0 failures (0 unexpected) in 0.112 (0.118) seconds
Test Suite 'All tests' passed at 2019-05-14 14:00:17.633.
	 Executed 9 tests, with 0 failures (0 unexpected) in 0.112 (0.119) seconds
Program ended with exit code: 0
```

## Possible Improvements
* Tighter regular expressions for improved syntax verification.
* Better value recognition to support floating point numbers.
