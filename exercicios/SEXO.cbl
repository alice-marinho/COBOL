      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SEXO.
       Installation. IFSP-Cubatao.
       Security.     EXEMPLO DE CODIFICACAO COBOL
                     Arquivo texto.

       Environment Division.
      *----------------------------------------------------*
       Configuration Section.
      *---------------------*
       Source-Computer.     IBM-PC.
       Object-Computer.     IBM-PC.
       Special-Names.
              Decimal-Point Is Comma.

       Input-Output Section.
       File-Control.
           Select ARQUIVO-PROVA Assign to DISK
           Organization Is Line SEQUENTIAL
           Access Mode Is SEQUENTIAL
           File Status Is ERRO.


       DATA DIVISION.
       FILE SECTION.
       FD  ARQUIVO-PROVA
           Label Record Is Standard
           Record Contains 46 Characters
           Block Contains 10 Records
           Data Record Is REGISTRO
           Value Of File-Id "C:\Users\aluno\Downloads\PROVAS.TXT".

       01  REGISTRO.
           05  CODIGO  PIC 9(5).
           05  NOME    PIC X(30).
           05  SEXO    PIC X.
           05  P1      PIC 99V9.
           05  P2      PIC 99V9.

       WORKING-STORAGE SECTION.

       77  ERRO        Pic X(02) Value "00".
       77  FIM         Pic X(02) Value Spaces.
       77  PROVAS      Pic 9(5).

       01  REGISTRO-AUX.
           05  CODIGO-AUX  PIC 9(5).
           05  NOME-AUX    PIC X(30).
           05  SEXO-AUX    PIC X.
               88 SEXO-OK Value "f", "F", "M", "m".
               88 MACHO   Value "m", "M".
           05  P1-AUX      PIC 99V9.
           05  P2-AUX      PIC 99V9.

       PROCEDURE DIVISION.
       INICIO.
           Perform ABRIR.
           PERFORM ENTRAR-CODIGO.
           Perform CADASTRAR Until FIM = "OK".
           Perform FECHAR.
           Stop Run.

       ABRIR.
           Move Spaces To FIM.
           Open OUTPUT ARQUIVO-PROVA.

       CADASTRAR.
           Move CODIGO-AUX To CODIGO.

           Move Spaces to NOME-AUX.
           Move Zeros To SEXO-AUX, P1-AUX, P2-AUX.

           Perform ENTRAR-NOME UNTIL NOME-AUX Not = Spaces.
           Perform ENTRAR-SEXO UNTIL SEXO-OK.
           Perform ENTRAR-P1 UNTIL P1-AUX > Zeros.
           Perform ENTRAR-P2 UNTIL P2-AUX > Zeros.

           Add 1 To PROVAS.

           MOVE REGISTRO-AUX to REGISTRO.
           WRITE REGISTRO.

           PERFORM ENTRAR-CODIGO.


       ENTRAR-CODIGO.
           DISPLAY "*-----------------------*"
           Display "Digite o codigo : ".
           Accept CODIGO-AUX.
           If CODIGO-AUX = Zeros
              Move "OK" To FIM.



       ENTRAR-NOME.
           Display "Nome do cliente : ".
           Accept NOME-AUX.
           If NOME-AUX = Spaces
              Display "Nao pode ficar em branco !".

       ENTRAR-SEXO.
           Display "Sexo.....: ".
           Accept SEXO-AUX.
           If SEXO-OK
              If MACHO
                 Move "M" To SEXO-AUX
              Else
                 Move "F" To SEXO-AUX
           Else
              Display "Sexo incorreto !".

       ENTRAR-P1.
           DISPLAY "P1: "
           ACCEPT P1-AUX.

       ENTRAR-P2.
           DISPLAY "P2: "
           ACCEPT P2-AUX.

       FECHAR.
              If PROVAS > Zeros
                Display "Clientes cadastrados : ", PROVAS

              Close ARQUIVO-PROVA.

       END-OF-JOB.
