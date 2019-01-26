# OCR
a command line tool that act as solution for : https://ccd-school.de/en/coding-dojo/application-katas/bankocr/

### Tools and Language
xCode 10 and Objective-c.

### How the program works
By running the application it will ask for a file path (as specified in the task description URL), the application will scan through each line and print all digits included in it, in case any line included any error in any of it's digits the program will print an error message for the whole line.

### Sample File
Inside the project folder there is Sample file for running and testing that can be used.  `ocr-sample.txt`

<br/>
<br/>
<br/>

## Search Algorithm

Like any character recognition software this program need to search the found objects thorugh a pre-defined set of data in order to idetify them, instead of looping through all items normally I wanted to make it run faster, here is a short description of how it works

Each identified digit is transformed to a mathematical matrix with the size specified (normally in this task is 3x3), but this can be configured anyway in the project.

Each cell in the matrix represents a cell in the real file, and the real namespace ('empty space',I,_) is replaced with numbers (1,2,3).
NOTE:The name space can be configured so we later can add more or if needed replace a character with other.

To search any digit (matrix) in database first a 'matrixNumberRepresesntation' is calculated which is a double number that is obtained by simply serilizing the matrix by looping through cells (row first) and adding the numbers in the same order.

the 'matrixNumberRepresesntation' is then used to search through database which is associated to it's the real number(Digit).

In this way effort is done only creating the database and the search process is speeded up, and the project can work well with larger datasets.

<br/>
<br/>
<br/>

### Database

Due to that this a Terminal app and ther is no Bundle available like in normal mac and iOS apps to save any resources, there were no way to store data in JSON or XML(.PLIST) files, and for the sake of simplefying the process a normal .h file is used as a resource file to contain the data. `Resources.h`


### Changing and Extending the project
