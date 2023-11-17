       IDENTIFICATION DIVISION.
           PROGRAM-ID.      Basic-Banking.
           AUTHOR.          AgustinUno
      *-----------------------------------------------------------------
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
                SELECT INFILE
       ASSIGN TO "/home/lloyd/Desktop/Code/Student-Data.txt" 
           ORGANIZATION IS LINE SEQUENTIAL.
       
                SELECT OUTFILE
       ASSIGN TO "/home/lloyd/Desktop/Code/Output-Data.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
      *-----------------------------------------------------------------
       DATA DIVISION.
       FILE SECTION.
       FD INFILE.
       01  IN-RECORD.
           05 IN-STD-ID PIC 9(4).
           05 SPC-01 PIC X(12).
           05 IN-STD-NAME PIC X(20).
      
       FD OUTFILE.
       01  OUT-RECORD.
           05 OUT-STD-ID PIC 9(4).
           05 OUT-STD-NAME PIC X(20).

       WORKING-STORAGE SECTION.
       01 SCTR PIC 9(3) VALUE 0.
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
                       DISPLAY IN-STD-ID, "     ", IN-STD-NAME
                       
               END-READ
           END-PERFORM.
     