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
           LABEL RECORDS ARE OMITTED
           RECORDING MODE F  /* Fixed recording mode */
           RECORD CONTAINS 80 CHARACTERS
           DATA RECORD IS IN-RECORD.

       01 IN-RECORD PIC X(80).

       FD OUTFILE
           LABEL RECORDS ARE OMITTED
           RECORDING MODE F  /* Fixed recording mode */
           RECORD CONTAINS 80 CHARACTERS
           DATA RECORD IS OUT-RECORD.

       01 OUT-RECORD PIC X(80).

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
