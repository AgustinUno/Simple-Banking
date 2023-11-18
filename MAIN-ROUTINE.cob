       IDENTIFICATION DIVISION.
           PROGRAM-ID.      Basic-Banking.
           AUTHOR.          AgustinUno
      *-----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                SELECT INFILE        
       ASSIGN TO "/home/lloyd/Desktop/Code/Student-Data.txt".


                SELECT OUTFILE
       ASSIGN TO "/home/lloyd/Desktop/Code/Output-Data.txt"
                ACCESS MODE IS SEQUENTIAL.     *> BY LINE, FROM START 

      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
       FD INFILE RECORDING MODE F.
       01  IN-RECORD.
           05 IN-STD-ID PIC 9(8).
      *    05 SPC-01 PIC X(12).
           05 IN-STD-NAME PIC X(24).
      *    05 SPC-02 PIC X(4).
           05 IN-CODE PIC A(1).
           05 IN-STD-CASH PIC 9(6).

       FD OUTFILE RECORDING MODE F.    *> F = FIXED LENGTH 
       01  OUT-RECORD.
           05 OUT-STD-ID PIC 9(8).
      *    05 SPC-011 PIC X(12).
           05 OUT-STD-NAME PIC X(24).
      *    05 SPC-022 PIC X(4) .
           05 OUT-CODE PIC A(1).
           05 OUT-STD-CASH PIC 9(6).

       WORKING-STORAGE SECTION.
       01 SCTR PIC 9(3) VALUE 0.
       01 EOF-SWITCH PIC A(1) VALUE 'N'.
      *01 FRMT-VAL PIC $$$$,$$$,$$9.99. CURRENCY FORMAT

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
                            WRITE OUT-RECORD FROM IN-RECORD  
               END-READ
           END-PERFORM.
                           DISPLAY "TRANSFER SUCCESS".  *>DEBUGGER 
                           
