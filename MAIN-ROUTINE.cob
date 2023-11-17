      *------------------------
      * logically based on lecture example by Ms. Nayre
      * BSIT 2-2
      *------------------------
       IDENTIFICATION DIVISION.
      *------------------------
       PROGRAM-ID.      Rural-Banking-01.
       AUTHOR.          Agustin

      *--------------
       DATA DIVISION.
      *--------------
       FILE SECTION.
       FD INFILE

       FD OUTFILE

       WORKING-STORAGE SECTION.
       01  Counter           PIC 9(3) VALUE 0.

       PROCEDURE DIVISION.
      * Main Procedure
           READ PROCEDURE.

           DISPLAY 'Hello, World!'.

      * Perform a loop to display numbers 1 to 10.
           PERFORM VARYING Counter FROM 1 BY 1 UNTIL Counter > 10
               DISPLAY 'Counter is ' Counter
           END-PERFORM.

      * End the program.
           STOP RUN.
