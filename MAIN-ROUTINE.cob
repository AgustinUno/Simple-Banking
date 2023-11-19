       IDENTIFICATION DIVISION.
           PROGRAM-ID.      Basic-Banking.
           AUTHOR.          AgustinUno
      *-----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                SELECT INFILE        
       ASSIGN TO "/home/lloyd/Desktop/Code/Student-Data.dat".

                SELECT OUTFILE
       ASSIGN TO "/home/lloyd/Desktop/Code/Output-Data.dat".
                  
      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
       FD INFILE.
       01  IN-RECORD.
           05 IN-STD-ID PIC X(8).
           05 IN-STD-NAME PIC X(24).
           05 IN-CODE PIC X(1).
           05 IN-STD-CASH PIC 9(6)V99.

       FD OUTFILE.    
       01 REC-OUT.
       02 OUT-RECORD.
           05 OUT-STD-ID PIC X(8).
           05 OUT-STD-NAME PIC X(24).
           05 OUT-CODE PIC X(1).
           05 OUT-STD-CASH PIC 9(6)V99.

       WORKING-STORAGE SECTION.
       01 EOF-SWITCH PIC A(1) VALUE 'N'.

      *-----------------------------------------------------------------
       PROCEDURE DIVISION.
         MAIN-ROUTINE.
           OPEN INPUT INFILE
           OPEN OUTPUT OUTFILE.

           PERFORM READ-PROCEDURE.

           CLOSE INFILE
           CLOSE OUTFILE.
           STOP RUN.

       READ-PROCEDURE.
           PERFORM UNTIL EOF-SWITCH = 'Y'
               READ INFILE
                   AT END
                            MOVE 'Y' TO EOF-SWITCH
                   NOT AT END
				            MOVE IN-STD-ID TO OUT-STD-ID
                            MOVE IN-STD-CASH TO OUT-STD-CASH
                            MOVE IN-STD-NAME TO OUT-STD-NAME
                            MOVE IN-CODE TO OUT-CODE
                            WRITE REC-OUT FROM OUT-RECORD 
               END-READ
           END-PERFORM.
      *                    DISPLAY "TRANSFER SUCCESS".  *>DEBUGGER 
                           