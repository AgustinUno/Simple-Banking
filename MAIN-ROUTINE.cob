       IDENTIFICATION DIVISION.
       PROGRAM-ID.      Basic-Banking.
       AUTHOR.          AgustinUno

       DATA DIVISION.
       FILE SECTION.
       FD INFILE
           LABEL RECORDS ARE OMITTED
           RECORDING MODE F
           RECORD CONTAINS 40 CHARACTERS
           DATA RECORD IS IN-RECORD.

       01 IN-RECORD.
          05 IN-STUDENT-CODE  PIC 9(4).
          05 FILLER             PIC X(11).
          05 IN-STUDENT-NAME  PIC X(25).

       FD OUTFILE
           LABEL RECORDS ARE OMITTED
           RECORDING MODE F
           RECORD CONTAINS 40 CHARACTERS
           DATA RECORD IS OUT-RECORD.

       01 OUT-RECORD.
          05 OUT-STUDENT-CODE  PIC 9(4).
          05 FILLER              PIC X(11).
          05 OUT-STUDENT-NAME  PIC X(25).

       WORKING-STORAGE SECTION.
       01 Counter PIC 9(3) VALUE 0.

       PROCEDURE DIVISION.
           OPEN INPUT INFILE
           OPEN OUTPUT OUTFILE.

           PERFORM UNTIL Counter > 10
               READ INFILE
               AT END
                   EXIT PERFORM
               END-READ.

               MOVE IN-STUDENT-CODE TO OUT-STUDENT-CODE
               MOVE IN-STUDENT-NAME TO OUT-STUDENT-NAME
               WRITE OUT-RECORD.
               ADD 1 TO Counter.

           END-PERFORM.     

           CLOSE INFILE
           CLOSE OUTFILE
          
           STOP RUN.

