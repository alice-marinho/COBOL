      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. INCLUSAO-ROTINA.


       Environment Division.

       Configuration Section.
       Source-Computer. IBM PC.
       Object-Computer. IBM PC.
       Special-Names.
           Decimal-Point Is Comma.
       Input-OutPut Section.
       File-Control.
              Select ARQUIVO-INCLUSAO Assign To "PRODUTO.DAT"
                Organization Is Indexed
                Access Mode Is Dynamic
                Record Key Is CODIGO
                File Status Is ERRO.

       DATA DIVISION.
       FILE SECTION.
       FD  ARQUIVO-INCLUSAO
           Label Record Is Standard
           Record Contains 42 Characters
           Block Contains 11 Records
           Data Record Is REGISTRO-PRODUTO.
           

       01  REGISTRO-PRODUTO.
           05 CODIGO                      Pic 9(05).
           05 PRODUTO                     Pic X(30).
           05 PRECO                       Pic 9(05)V99.

       Working-Storage Section.
       77  ERRO                           Pic X(02) Value "00".
       77  FIM                            Pic X(02) Value Spaces.


       PROCEDURE DIVISION.
       INICIO.
           Perform ABRIR.
           Perform LEITURA.
           Perform CADASTRAR Until FIM = "OK".
           Perform FECHAR.
           Stop Run.

       ABRIR.
           Move Zeros To PRECO.
           Move Spaces To PRODUTO, FIM.
           Open OUTPUT ARQUIVO-INCLUSAO.


       CADASTRAR.
           PERFORM ENTRAR-PRODUTO.
           PERFORM ENTRAR-PRECO.

           WRITE REGISTRO-PRODUTO
               INVALID KEY
                   DISPLAY "Erro"
               NOT INVALID KEY
                   DISPLAY "SUCESSO"
           END-WRITE.

           PERFORM LEITURA.

       LEITURA.
           DISPLAY "*-----------------------*"
           Display "Digite o codigo (00000 para sair): ".
           Accept CODIGO.
           If CODIGO = Zeros
              Move "OK" To FIM.


       ENTRAR-PRODUTO.
           DISPLAY "Nome do produto: "
           ACCEPT PRODUTO
           If PRODUTO = Spaces
              Display "Nao pode ficar em branco !".

       ENTRAR-PRECO.
           DISPLAY "Preco: "
           ACCEPT PRECO
           If PRECO = Zeros
              Display "Nao pode ficar em branco !".

       FECHAR.
           If PRODUTO > Zeros
                Display "PRODUTOS cadastrados : ", PRODUTO

              Close ARQUIVO-INCLUSAO.
       END PROGRAM INCLUSAO-ROTINA.
