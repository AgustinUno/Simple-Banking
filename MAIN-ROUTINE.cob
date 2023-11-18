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
           05 SPC-02 PIC X(4).
           05 IN-CODE PIC A(1).
           05 IN-STD-CASH PIC 9(5)V99.
      *     05 IN-STD-CASH PIC 9(5)V99.

       FD OUTFILE.
       01  OUT-RECORD.
           05 OUT-STD-ID PIC 9(4).
           05 OUT-STD-NAME PIC X(20).

       WORKING-STORAGE SECTION.
       01 SCTR PIC 9(3) VALUE 0.
       01 EOF-SWITCH PIC A(1) VALUE 'N'.
       01 FRMT-VAL PIC $$$$,$$$,$$9.99.

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
                        MOVE IN-STD-CASH TO FRMT-VAL
                       DISPLAY IN-STD-ID, "  ", IN-STD-NAME
                                 ,"  ", FRMT-VAL
											WRITE OUT-RECORD
               END-READ
           END-PERFORM.
        