# Formatting-C-Code

## Table of Contents

1. [Overview](#Overview)
2. [Purpose and Functionality](#Purpose-and-Functionality)
  - assign2.bash
  - command1.sed
  - command2.sed
  - inputProgram.c
  - outputProgram.c
3. [Setup Instructions](#Setup-Instructions)
4. [Usage Instructions](#Usage-Instructions)
5. [Example Output](#Example-Output)
6. [Conclusion](#Conclusion)

## Overview

This project provides a simple Bash script to format C code. The script utilizes **sed** to perform text manipulations, ensuring consistent formatting of C source code files. The project includes the Bash script **assign2.bash** and two **sed** scripts **command1.sed** and **command2.sed**  .

The main goal of this project is to clean up and format C source code using a Bash script that calls sed scripts. The formatting includes:

- Replacing multiple spaces with a single space.
- Removing trailing whitespace.
- Adding spaces around binary operators.
- Removing extra spaces inside parentheses in conditional statements.

## Purpose and Functionality

### assign2.bash

This Bash script takes a C source file as input, applies formatting using **sed** scripts, and outputs the formatted code.

```
#!/bin/bash

# Check if the input file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

input_file="$1"

# Define temporary file names
temp_file1=$(mktemp)
temp_file2=$(mktemp)

# Perform formatting using sed scripts
sed -f command1.sed "$input_file" > "$temp_file1"
sed -f command2.sed "$temp_file1" > "$temp_file2"

# Output the result to stdout
cat "$temp_file2"

# Clean up temporary files
rm "$temp_file1" "$temp_file2"
```

### command1.bash

This **sed** script performs initial formatting tasks such as replacing multiple spaces with a single space, removing trailing whitespace, and adding spaces around binary operators.

```
# Replace multiple spaces with a single space
s/  */ /g

# Remove trailing whitespace at the end of lines
s/[[:space:]]*$//

# Add spaces around binary operators
s/\([^[:alnum:][:space:]]\)\([+*\/=-]\)\([^[:alnum:][:space:]]\)/\1 \2 \3/g
```

### command2.sed

This **sed** script removes unnecessary spaces immediately inside parentheses in conditional statements.

```
# Remove whitespace immediately inside parentheses in conditions
s/\(if\s*([^[:space:]]*\)[[:space:]]\+\([^[:space:]]\)/\1\2/g
s/\(else\s*if\s*([^[:space:]]*\)[[:space:]]\+\([^[:space:]]\)/\1\2/g
```

### inputProgram.c

This is a sample input C source file to be formatted.

```
/**
*author:     some student
**/
#include <stdio.h>

int main() {
	int numberIn;

	printf("Enter a number: ");

	scanf("%d", &numberIn);  

	if ( numberIn > 10 ) {
	//    add  two
	    return numberIn + 2;
    } else   if    (numberIn<5){
    //    subtract two   
        return  numberIn - 2;

    return  numberIn*2;
}
```

### outputProgram.c

This is the expected output C source file after formatting.

```
/**
author:     some student
**/
#include <stdio.h>

int main() {
    int numberIn;

    printf("Enter a number: ");

    scanf("%d", &numberIn);

    if (numberIn > 10) {
    //    add two
        return numberIn + 2;
    } else if (numberIn < 5){
    //    subtract two   
        return numberIn - 2;

    return numberIn * 2;
}
```

## Setup Instructions

1. Clone or download the project repository.
2. Ensure you have **sed** installed on your system. This is usually pre-installed on Unix-based
systems.

## Usage Instructions

1. Place your C source file (e.g., **inputProgram.c**) in the same directory as the script files.
2. Run the script **assign2.bash** with the C source file as an argument:

```
./assign2.bash inputProgram.c
```

3. The formatted output will be displayed in the terminal.

## Example Output

Given the sample input file **inputProgram.c**, the script will produce the following output:

```
/**
author:     some student
**/
#include <stdio.h>

int main() {
    int numberIn;

    printf("Enter a number: ");

    scanf("%d", &numberIn);

    if (numberIn > 10) {
    //    add two
        return numberIn + 2;
    } else if (numberIn < 5){
    //    subtract two   
        return numberIn - 2;

    return numberIn * 2;
}
```

**Note: The exact output will depend on the contents of your input file and the applied formatting rules.**

## Conclusion

The Formatting C Code project provides an automated way to clean up and standardize C source code formatting using a combination of Bash and sed scripts. The approach ensures consistency in code style, making the code more readable and maintainable. The project can be further extended by adding more sed scripts for additional formatting rules or by integrating with other formatting tools for more complex requirements.
