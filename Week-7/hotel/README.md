# Hotel Database

Your task is to read in a CSV, construct a database for the data, and allow
users to query the data for information about hotels.

## Example

    What property? > Wombat Inn

    Phone number: (342) 469-9891
    Location: Quincy
    Number of rooms: 175

    What property? > non existent

    No property found

    What property? >

## Steps

1. Read in the data and print out the names of every hotel you find
2. Allow the user to query for hotels, and return the hotel they found
3. Handle the case in which a user types in a hotel that is not in the database.
   (Hint: Use a NullObject)
4. Display information for the hotel that was found
5. Use the Adapter Pattern to clean data from the CSV file up front

## Constraints

1. You may *not* edit the file.
1. You may *not* use any conditionals, such as `if` or `case` statements.
