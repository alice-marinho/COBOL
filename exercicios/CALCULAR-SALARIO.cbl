      ******************************************************************
      * Author: Alice Marinho
      * Date: 20-08-2025
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULAR-SALARIO.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-PC-AT-486-DX2-66MHZ.
       OBJECT-COMPUTER. IBM-PC-AT-486-DX2-66MHZ.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       77  horas Pic 9(02)V9 VALUE ZEROS.
       77  valorHora Pic 9(02)V9 VALUE ZEROS.
       77  salarioBruto Pic 9(05)V99 VALUE ZEROS.
       77  salarioLiquido Pic 9(05)V99 VALUE ZEROS.
       77  MASCARA Pic ZZZZ9,9.
       
       PROCEDURE DIVISION.
       INICIO.
            DISPLAY "Digite a quantidade de horas: ".
            ACCEPT horas.
            DISPLAY "Digite o valor da hora: ".
            ACCEPT valorHora.
            
            COMPUTE salarioBruto = horas * valorHora * 5,25.
            DISPLAY salarioBruto.
            
           IF salarioBruto <= 2260
               COMPUTE salarioLiquido = salarioBruto
           ELSE IF salarioBruto > 2260 AND salarioBruto < 2826
               COMPUTE salarioLiquido = salarioBruto - (salarioBruto 
                   * 0,075)
           ELSE IF salarioBruto >= 2826 AND salarioBruto < 3751
               COMPUTE salarioLiquido = salarioBruto - (salarioBruto 
                   * 0,15)
           ELSE IF salarioBruto >= 3751 AND salarioBruto < 4664
               COMPUTE salarioLiquido = salarioBruto - (salarioBruto 
                   * 0,225)
           ELSE
               COMPUTE salarioLiquido = salarioBruto - (salarioBruto 
                   * 0,275)
           END-IF

                            
                           
           DISPLAY "Salario bruto é " salarioBruto
           DISPLAY "Salario liquido é " salarioLiquido
                
           STOP RUN.
       END PROGRAM CALCULAR-SALARIO.

