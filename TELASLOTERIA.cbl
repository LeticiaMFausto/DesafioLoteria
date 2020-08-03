      $set sourceformat"free"
      *>Divisão de identificação do programa
       identification division.
       program-id. "TELASLOTERIA".
       author. "LetíciaFausto".
       installation. "PC".
       date-written. 17/07/2020.
       date-compiled. 17/07/2020.



      *>Divisão para configuração do ambiente
       environment Division.
       configuration Section.
           special-names. decimal-point is comma.

      *>-----Declaração dos recursos externos
       input-output Section.
       file-control.
       i-O-control.

      *>Declaração de variáveis
       data division.

      *>----Variaveis de arquivos
       File Section.


      *>----Variaveis de trabalho
       working-storage section.

                                                                          *>variávais de controle
       01 wk-tela-inicial.
           05  wk-sair                             pic x(01).
           05  wk-continuar                        pic x(01).

       01 wk-tela-entrada.                                                 *>numeros que o jogador vai inserir
           05 wk-num-1                             pic 9(02) value zero.
           05 wk-num-2                             pic 9(02) value zero.
           05 wk-num-3                             pic 9(02) value zero.
           05 wk-num-4                             pic 9(02) value zero.
           05 wk-num-5                             pic 9(02) value zero.
           05 wk-num-6                             pic 9(02) value zero.
           05 wk-num-7                             pic 9(02) value zero.
           05 wk-num-8                             pic 9(02) value zero.
           05 wk-num-9                             pic 9(02) value zero.
           05 wk-num-10                            pic 9(02) value zero.
           05 wk-num-11                            pic 9(02) value zero.
           05 wk-num-12                            pic 9(02) value zero.
           05 wk-num-13                            pic 9(02) value zero.
           05 wk-num-14                            pic 9(02) value zero.
           05 wk-num-15                            pic 9(02) value zero.

                                                                           *>numeros que o programa vai sortear
       01 wk-num-sorteados.
           05 wk-num_sort1                        pic 9(02).
           05 wk-num_sort2                        pic 9(02).
           05 wk-num_sort3                        pic 9(02).
           05 wk-num_sort4                        pic 9(02).
           05 wk-num_sort5                        pic 9(02).
           05 wk-num_sort6                        pic 9(02).
           05 wk-num_sort7                        pic 9(02).
           05 wk-num_sort8                        pic 9(02).
           05 wk-num_sort9                        pic 9(02).
           05 wk-num_sort10                       pic 9(02).
           05 wk-num_sort11                       pic 9(02).
           05 wk-num_sort12                       pic 9(02).
           05 wk-num_sort13                       pic 9(02).
           05 wk-num_sort14                       pic 9(02).
           05 wk-num_sort15                       pic 9(02).


                                                                          *> variáveis de sorteio
       01 sorteio.
           05 semente                              pic 9(08).
           05 semente1                             pic 9(08).

       77  wk-decidir                              pic  x(01).
           88 wk-decisao                           value "S" "S".
                                                                         *>variáveis de informação
       01 wk-contadores.
           05 wk-contador                          pic 9(05) value zero.
           05 wk-contador2                         pic 9(05) value zero.

       01 wk-hora.
           05 wk-hora-inicio                       pic 9(08).
           05 wk-hora-final                        pic 9(08).
           05 wk-hora-total                        pic 9(08).



      *>----Variaveis para comunicação entre programas
       linkage section.


      *>----Declaração de tela
       screen section.


       01  tela-inicial.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair     ".
           05 line 03 col 01 value "                                                                                 ".
           05 line 04 col 01 value "                    ****************************************                     ".
           05 line 05 col 01 value "                    ****************************************                     ".
           05 line 06 col 01 value "                    **          DESAFIO LOTERIA           **                     ".
           05 line 07 col 01 value "                    **                                    **                     ".
           05 line 08 col 01 value "                    **        Uma aposta deve conter      **                     ".
           05 line 09 col 01 value "                    ** 15 números compreendidos no sub-   **                     ".
           05 line 10 col 01 value "                    ** conjunto dos números inteiros no   **                     ".
           05 line 11 col 01 value "                    ** intervalo de 1 a 60.               **                     ".
           05 line 12 col 01 value "                    **                                    **                     ".
           05 line 13 col 01 value "                    **         Deseja Continuar?          **                     ".
           05 line 14 col 01 value "                    ****************************************                     ".
           05 line 15 col 01 value "                    ****************************************                     ".
           05 line 18 col 01 value "                                [ ]Continuar                                     ".



           05 sc-sair-inicial            line 01  col 71 pic x(01)               using wk-sair foreground-color 12.
           05 sc-continuar-inicial       line 18  col 34 pic x(01)               using wk-continuar foreground-color 12.




       01  tela-entrada.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair     ".
           05 line 02 col 01 value "                   ENTRE COM A QUANTIDADE DE NÚMEROS DESEJADA                    ".
           05 line 03 col 01 value "                   -Ao terminar sua aposta, marque Continuar-                    ".
           05 line 04 col 01 value "                    ****************************************                     ".
           05 line 05 col 01 value "                    ****************************************                     ".
           05 line 06 col 01 value "                    **  1°:  [  ]                         **                     ".
           05 line 07 col 01 value "                    **  2°:  [  ]                         **                     ".
           05 line 08 col 01 value "                    **  3°:  [  ]                         **                     ".
           05 line 09 col 01 value "                    **  4°:  [  ]                         **                     ".
           05 line 10 col 01 value "                    **  5°:  [  ]                         **                     ".
           05 line 11 col 01 value "                    **  6°:  [  ]                         **                     ".
           05 line 12 col 01 value "                    **  7°:  [  ]                         **                     ".
           05 line 13 col 01 value "                    **  8°:  [  ]                         **                     ".
           05 line 14 col 01 value "                    **  9°:  [  ]                         **                     ".
           05 line 15 col 01 value "                    **  10°: [  ]                         **                     ".
           05 line 16 col 01 value "                    **  11°: [  ]                         **                     ".
           05 line 17 col 01 value "                    **  12°: [  ]                         **                     ".
           05 line 18 col 01 value "                    **  13°: [  ]                         **                     ".
           05 line 19 col 01 value "                    **  14°: [  ]                         **                     ".
           05 line 20 col 01 value "                    **  15°: [  ]                         **                     ".
           05 line 21 col 01 value "                    ****************************************                     ".
           05 line 22 col 01 value "                    ****************************************                     ".
           05 line 24 col 01 value "                                [ ]Continuar                                     ".



           05 sc-sair-entrada            line 01  col 71 pic x(01)               using wk-sair foreground-color 12.
           05 sc-num-1                   line 06  col 31 pic 9(02)               using wk-num-1 foreground-color 12.
           05 sc-num-2                   line 07  col 31 pic 9(02)               using wk-num-2 foreground-color 12.
           05 sc-num-3                   line 08  col 31 pic 9(02)               using wk-num-3 foreground-color 12.
           05 sc-num-4                   line 09  col 31 pic 9(02)               using wk-num-4 foreground-color 12.
           05 sc-num-5                   line 10  col 31 pic 9(02)               using wk-num-5 foreground-color 12.
           05 sc-num-6                   line 11  col 31 pic 9(02)               using wk-num-6 foreground-color 12.
           05 sc-num-7                   line 12  col 31 pic 9(02)               using wk-num-7 foreground-color 12.
           05 sc-num-8                   line 13  col 31 pic 9(02)               using wk-num-8 foreground-color 12.
           05 sc-num-9                   line 14  col 31 pic 9(02)               using wk-num-9 foreground-color 12.
           05 sc-num-10                  line 15  col 31 pic 9(02)               using wk-num-10 foreground-color 12.
           05 sc-num-11                  line 16  col 31 pic 9(02)               using wk-num-11 foreground-color 12.
           05 sc-num-12                  line 17  col 31 pic 9(02)               using wk-num-12 foreground-color 12.
           05 sc-num-13                  line 18  col 31 pic 9(02)               using wk-num-13 foreground-color 12.
           05 sc-num-14                  line 19  col 31 pic 9(02)               using wk-num-14 foreground-color 12.
           05 sc-num-15                  line 20  col 31 pic 9(02)               using wk-num-15 foreground-color 12.
           05 sc-continuar-entrada       line 24  col 34 pic x(01)               using wk-continuar foreground-color 12.


       01  tela-acerto.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair     ".
           05 line 03 col 01 value "                                                                                 ".
           05 line 04 col 01 value "                    ****************************************                     ".
           05 line 05 col 01 value "                    ****************************************                     ".
           05 line 06 col 01 value "                    **            PARABENS!!!!!!!         **                     ".
           05 line 06 col 01 value "                    **        VOCE ESTA RICO!!!!!!!       **                     ".
           05 line 14 col 01 value "                    ****************************************                     ".
           05 line 15 col 01 value "                    ****************************************                     ".



           05 sc-sair-acerto            line 01  col 71 pic x(01)               using wk-sair foreground-color 12.



       01  tela-final.
      *>                                0    1    1    2    2    3    3    4    4    5    5    6    6    7    7    8
      *>                                5    0    5    0    5    0    5    0    5    0    5    0    5    0    5    0
      *>                            ----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+
           05 blank screen.
           05 line 01 col 01 value "                                                                     [ ]Sair     ".
           05 line 03 col 01 value "                                                                                 ".
           05 line 04 col 01 value "                ****************************************                         ".
           05 line 05 col 01 value "                ****************************************                         ".
           05 line 06 col 01 value "                          DESAFIO LOTERIA                                        ".
           05 line 07 col 01 value "                                                                                 ".
           05 line 08 col 01 value "               Quantidade de tentativas até o acerto: [     ]                    ".
           05 line 09 col 01 value "                  Tempo gasto até acertar aposta                                 ".
           05 line 10 col 01 value "                           [            ]                                        ".
           05 line 11 col 01 value "                                                                                 ".
           05 line 12 col 01 value "                                                                                 ".
           05 line 14 col 01 value "                ****************************************                         ".
           05 line 15 col 01 value "                ****************************************                         ".



           05 sc-sair-final            line 01  col 71 pic x(01)               using wk-sair foreground-color 12.
           05 sc-acertos               line 08  col 56 pic 9(05)               from wk-contador2 foreground-color 12.
           05 sc-hora-final            line 10  col 29 pic x(08)               from wk-hora-total foreground-color 12.


       77 wk-contador                              pic 9(05) value zero.




      *>Declaração do corpo do programa
       procedure Division.

           perform inicializa.
           perform processamento.
           perform finaliza.

      *>------------------------------------------------------------------------
      *>                   Procedimentos de Inicialização
      *>------------------------------------------------------------------------
       inicializa section.


           .
       inicializa-exit.
           exit.

      *>------------------------------------------------------------------------
      *>                        Processamento Principal
      *>------------------------------------------------------------------------
       processamento section.



           perform until wk-sair = "X"
                      or wk-sair = "x"

                move   space  to  wk-continuar
                move   space  to  wk-sair

                display tela-inicial
                accept tela-inicial

                if wk-continuar = "X"
                or wk-continuar = "x" then
                       perform aceitar-num
                end-if

           end-perform



           .
       processamento-exit.
           exit.


      *>------------------------------------------------------------------------
      *> ENTRANDO COM O NUMEROS
      *>------------------------------------------------------------------------
       aceitar-num section.

           perform until wk-sair = "V"
                      or wk-sair = "v"

                move   space  to  wk-continuar
                move   space  to  wk-sair

                display tela-entrada
                accept tela-entrada

                if wk-continuar = "X"
                or wk-continuar = "x" then
                       perform consistencia
                end-if




          end-perform

           .
       aceitar-num-exit.
           exit.



      *>------------------------------------------------------------------------
      *> CONSISTENCIA DOS NUMEROS INFORMADOS
      *>------------------------------------------------------------------------

       consistencia section.

           display erase
           if wk-num-1 > 0
           and wk-num-1 <= 60 then
               if wk-num-1 <> wk-num-2
               and wk-num-1 <> wk-num-3
               and wk-num-1 <> wk-num-4
               and wk-num-1 <> wk-num-5
               and wk-num-1 <> wk-num-6
               and wk-num-1 <> wk-num-7
               and wk-num-1 <> wk-num-8
               and wk-num-1 <> wk-num-9
               and wk-num-1 <> wk-num-10
               and wk-num-1 <> wk-num-11
               and wk-num-1 <> wk-num-12
               and wk-num-1 <> wk-num-13
               and wk-num-1 <> wk-num-14
               and wk-num-1 <> wk-num-15
                   if wk-num-2 > 0
                   and wk-num-2 <= 60 then
                       if wk-num-2 <> wk-num-3
                       and wk-num-2 <> wk-num-4
                       and wk-num-2 <> wk-num-5
                       and wk-num-2 <> wk-num-6
                       and wk-num-2 <> wk-num-7
                       and wk-num-2 <> wk-num-8
                       and wk-num-2 <> wk-num-9
                       and wk-num-2 <> wk-num-10
                       and wk-num-2 <> wk-num-11
                       and wk-num-2 <> wk-num-12
                       and wk-num-2 <> wk-num-13
                       and wk-num-2 <> wk-num-14
                       and wk-num-2 <> wk-num-15
                           if wk-num-3 > 0
                           and wk-num-3 <= 60 then
                               if wk-num-3 <> wk-num-4
                               and wk-num-3 <> wk-num-5
                               and wk-num-3 <> wk-num-6
                               and wk-num-3 <> wk-num-7
                               and wk-num-3 <> wk-num-8
                               and wk-num-3 <> wk-num-9
                               and wk-num-3 <> wk-num-10
                               and wk-num-3 <> wk-num-11
                               and wk-num-3 <> wk-num-12
                               and wk-num-3 <> wk-num-13
                               and wk-num-3 <> wk-num-14
                               and wk-num-3 <> wk-num-15
                                   if wk-num-4 > 0
                                   and wk-num-4 <= 60 then
                                       if wk-num-4 <> wk-num-5
                                       and wk-num-4 <> wk-num-6
                                       and wk-num-4 <> wk-num-7
                                       and wk-num-4 <> wk-num-8
                                       and wk-num-4 <> wk-num-9
                                       and wk-num-4 <> wk-num-10
                                       and wk-num-4 <> wk-num-11
                                       and wk-num-4 <> wk-num-12
                                       and wk-num-4 <> wk-num-13
                                       and wk-num-4 <> wk-num-14
                                       and wk-num-4 <> wk-num-15
                                           if wk-num-5 > 0
                                           and wk-num-5 <= 60 then
                                               if wk-num-5 <> wk-num-6
                                               and wk-num-5 <> wk-num-7
                                               and wk-num-5 <> wk-num-8
                                               and wk-num-5 <> wk-num-9
                                               and wk-num-5 <> wk-num-10
                                               and wk-num-5 <> wk-num-11
                                               and wk-num-5 <> wk-num-12
                                               and wk-num-5 <> wk-num-13
                                               and wk-num-5 <> wk-num-14
                                               and wk-num-5 <> wk-num-15
                                                   if wk-num-6 > 0
                                                   and wk-num-6 <= 60 then
                                                       if wk-num-6 <> wk-num-7
                                                       and wk-num-6 <> wk-num-8
                                                       and wk-num-6 <> wk-num-9
                                                       and wk-num-6 <> wk-num-10
                                                       and wk-num-6 <> wk-num-11
                                                       and wk-num-6 <> wk-num-12
                                                       and wk-num-6 <> wk-num-13
                                                       and wk-num-6 <> wk-num-14
                                                       and wk-num-6 <> wk-num-15
                                                           if wk-num-7 > 0
                                                           and wk-num-7 <= 60 then
                                                               if wk-num-7 <> wk-num-8
                                                               and wk-num-7 <> wk-num-9
                                                               and wk-num-7 <> wk-num-10
                                                               and wk-num-7 <> wk-num-11
                                                               and wk-num-7 <> wk-num-12
                                                               and wk-num-7 <> wk-num-13
                                                               and wk-num-7 <> wk-num-14
                                                               and wk-num-7 <> wk-num-15
                                                                   if wk-num-8 > 0
                                                                   and wk-num-8 <= 60 then
                                                                       if wk-num-8 <> wk-num-9
                                                                       and wk-num-8 <> wk-num-10
                                                                       and wk-num-8 <> wk-num-11
                                                                       and wk-num-8 <> wk-num-12
                                                                       and wk-num-8 <> wk-num-13
                                                                       and wk-num-8 <> wk-num-14
                                                                       and wk-num-8 <> wk-num-15
                                                                           if wk-num-9 > 0
                                                                           and wk-num-9 <= 60 then
                                                                               if wk-num-9 <> wk-num-10
                                                                               and wk-num-9 <> wk-num-11
                                                                               and wk-num-9 <> wk-num-12
                                                                               and wk-num-9 <> wk-num-13
                                                                               and wk-num-9 <> wk-num-14
                                                                               and wk-num-9 <> wk-num-15
                                                                                   if wk-num-10 > 0
                                                                                   and wk-num-10 <= 60 then
                                                                                       if wk-num-10 <> wk-num-11
                                                                                       and wk-num-10 <> wk-num-12
                                                                                       and wk-num-10 <> wk-num-13
                                                                                       and wk-num-10 <> wk-num-14
                                                                                       and wk-num-10 <> wk-num-15
                                                                                           if wk-num-11 > 0
                                                                                           and wk-num-11 <= 60 then
                                                                                               if wk-num-11 <> wk-num-12
                                                                                               and wk-num-11 <> wk-num-13
                                                                                               and wk-num-11 <> wk-num-14
                                                                                               and wk-num-11 <> wk-num-15
                                                                                                   if wk-num-12 > 0
                                                                                                   and wk-num-12 <= 60 then
                                                                                                       if wk-num-12 <> wk-num-13
                                                                                                       and wk-num-12 <> wk-num-14
                                                                                                       and wk-num-12 <> wk-num-15
                                                                                                           if wk-num-13 > 0
                                                                                                           and wk-num-13 <= 60 then
                                                                                                               if wk-num-13 <> wk-num-14
                                                                                                               and wk-num-13 <> wk-num-15
                                                                                                                   if wk-num-14 > 0
                                                                                                                   and wk-num-14 <= 60 then
                                                                                                                       if wk-num-14 <> wk-num-15 then
                                                                                                                           perform controle-prog
                                                                                                                       end-if
                                                                                                                   else
                                                                                                                       display "Num 14°, Eh Invalido"
                                                                                                                       perform finaliza
                                                                                                                   end-if
                                                                                                               end-if
                                                                                                           else
                                                                                                               display "Num 13°, Eh Invalido"
                                                                                                               perform finaliza
                                                                                                           end-if
                                                                                                       end-if
                                                                                                   else
                                                                                                       display "Num 12°, Eh Invalido"
                                                                                                       perform finaliza
                                                                                                   end-if
                                                                                               end-if
                                                                                           else
                                                                                               display "Num 11°, Eh Invalido"
                                                                                               perform finaliza
                                                                                           end-if
                                                                                       end-if
                                                                                   else
                                                                                       display "Num 10°, Eh Invalido"
                                                                                       perform finaliza
                                                                                   end-if
                                                                               end-if
                                                                           else
                                                                               display "Num 9°, Eh Invalido"
                                                                               perform finaliza
                                                                           end-if
                                                                       end-if
                                                                   else
                                                                       display "Num 8°, Eh Invalido"
                                                                       perform finaliza
                                                                   end-if
                                                               end-if
                                                           else
                                                               display "Num 7°, Eh Invalido"
                                                               perform finaliza
                                                           end-if
                                                       end-if
                                                   else
                                                       display "Num 6°, Eh Invalido"
                                                       perform finaliza
                                                   end-if
                                               end-if
                                           else
                                               display "Num 5°, Eh Invalido"
                                               perform finaliza
                                           end-if
                                       end-if
                                   else
                                       display "Num 4°, Eh Invalido"
                                       perform finaliza
                                   end-if
                               end-if
                           else
                               display "Num 3°, Eh Invalido"
                               perform finaliza
                           end-if
                       end-if
                   else
                       display "Num 2°, Eh Invalido"
                       perform finaliza
                   end-if
               end-if
           else
               display "Num 1°, Eh Invalido"
               perform finaliza
           end-if


           .
       consistencia-exit.
           exit.



       controle-prog section.

           accept wk-hora-inicio from time


           move 'N' to wk-decidir

           perform until wk-decidir = 'S'

               perform geranum

                   if (wk-num-1 = wk-num_sort1)
                   or (wk-num-2 = wk-num_sort1)
                   or (wk-num-3 = wk-num_sort1)
                   or (wk-num-3 = wk-num_sort1)
                   or (wk-num-4 = wk-num_sort1)
                   or (wk-num-5 = wk-num_sort1)
                   or (wk-num-6 = wk-num_sort1)
                   or (wk-num-7 = wk-num_sort1)
                   or (wk-num-8 = wk-num_sort1)
                   or (wk-num-9 = wk-num_sort1)
                   or (wk-num-10 = wk-num_sort1)
                   or (wk-num-11 = wk-num_sort1)
                   or (wk-num-12 = wk-num_sort1)
                   or (wk-num-13 = wk-num_sort1)
                   or (wk-num-14 = wk-num_sort1)
                   or (wk-num-15 = wk-num_sort1)then
                       if (wk-num-1 = wk-num_sort2)
                       or (wk-num-2 = wk-num_sort2)
                       or (wk-num-3 = wk-num_sort2)
                       or (wk-num-3 = wk-num_sort2)
                       or (wk-num-4 = wk-num_sort2)
                       or (wk-num-5 = wk-num_sort2)
                       or (wk-num-6 = wk-num_sort2)
                       or (wk-num-7 = wk-num_sort2)
                       or (wk-num-8 = wk-num_sort2)
                       or (wk-num-9 = wk-num_sort2)
                       or (wk-num-10 = wk-num_sort2)
                       or (wk-num-11 = wk-num_sort2)
                       or (wk-num-12 = wk-num_sort2)
                       or (wk-num-13 = wk-num_sort2)
                       or (wk-num-14 = wk-num_sort2)
                       or (wk-num-15 = wk-num_sort2)then
                           if (wk-num-1 = wk-num_sort3)
                           or (wk-num-2 = wk-num_sort3)
                           or (wk-num-3 = wk-num_sort3)
                           or (wk-num-3 = wk-num_sort3)
                           or (wk-num-4 = wk-num_sort3)
                           or (wk-num-5 = wk-num_sort3)
                           or (wk-num-6 = wk-num_sort3)
                           or (wk-num-7 = wk-num_sort3)
                           or (wk-num-8 = wk-num_sort3)
                           or (wk-num-9 = wk-num_sort3)
                           or (wk-num-10 = wk-num_sort3)
                           or (wk-num-11 = wk-num_sort3)
                           or (wk-num-12 = wk-num_sort3)
                           or (wk-num-13 = wk-num_sort3)
                           or (wk-num-14 = wk-num_sort3)
                           or (wk-num-15 = wk-num_sort3)then
                               if (wk-num-1 = wk-num_sort4)
                               or (wk-num-2 = wk-num_sort4)
                               or (wk-num-3 = wk-num_sort4)
                               or (wk-num-3 = wk-num_sort4)
                               or (wk-num-4 = wk-num_sort4)
                               or (wk-num-5 = wk-num_sort4)
                               or (wk-num-6 = wk-num_sort4)
                               or (wk-num-7 = wk-num_sort4)
                               or (wk-num-8 = wk-num_sort4)
                               or (wk-num-9 = wk-num_sort4)
                               or (wk-num-10 = wk-num_sort4)
                               or (wk-num-11 = wk-num_sort4)
                               or (wk-num-12 = wk-num_sort4)
                               or (wk-num-13 = wk-num_sort4)
                               or (wk-num-14 = wk-num_sort4)
                               or (wk-num-15 = wk-num_sort4)then
                                   if (wk-num-1 = wk-num_sort5)
                                   or (wk-num-2 = wk-num_sort5)
                                   or (wk-num-3 = wk-num_sort5)
                                   or (wk-num-3 = wk-num_sort5)
                                   or (wk-num-4 = wk-num_sort5)
                                   or (wk-num-5 = wk-num_sort5)
                                   or (wk-num-6 = wk-num_sort5)
                                   or (wk-num-7 = wk-num_sort5)
                                   or (wk-num-8 = wk-num_sort5)
                                   or (wk-num-9 = wk-num_sort5)
                                   or (wk-num-10 = wk-num_sort5)
                                   or (wk-num-11 = wk-num_sort5)
                                   or (wk-num-12 = wk-num_sort5)
                                   or (wk-num-13 = wk-num_sort5)
                                   or (wk-num-14 = wk-num_sort5)
                                   or (wk-num-15 = wk-num_sort5)then
                                       if (wk-num-1 = wk-num_sort6)
                                       or (wk-num-2 = wk-num_sort6)
                                       or (wk-num-3 = wk-num_sort6)
                                       or (wk-num-3 = wk-num_sort6)
                                       or (wk-num-4 = wk-num_sort6)
                                       or (wk-num-5 = wk-num_sort6)
                                       or (wk-num-6 = wk-num_sort6)
                                       or (wk-num-7 = wk-num_sort6)
                                       or (wk-num-8 = wk-num_sort6)
                                       or (wk-num-9 = wk-num_sort6)
                                       or (wk-num-10 = wk-num_sort6)
                                       or (wk-num-11 = wk-num_sort6)
                                       or (wk-num-12 = wk-num_sort6)
                                       or (wk-num-13 = wk-num_sort6)
                                       or (wk-num-14 = wk-num_sort6)
                                       or (wk-num-15 = wk-num_sort6)then
                                           if (wk-num-1 = wk-num_sort7)
                                           or (wk-num-2 = wk-num_sort7)
                                           or (wk-num-3 = wk-num_sort7)
                                           or (wk-num-3 = wk-num_sort7)
                                           or (wk-num-4 = wk-num_sort7)
                                           or (wk-num-5 = wk-num_sort7)
                                           or (wk-num-6 = wk-num_sort7)
                                           or (wk-num-7 = wk-num_sort7)
                                           or (wk-num-8 = wk-num_sort7)
                                           or (wk-num-9 = wk-num_sort7)
                                           or (wk-num-10 = wk-num_sort7)
                                           or (wk-num-11 = wk-num_sort7)
                                           or (wk-num-12 = wk-num_sort7)
                                           or (wk-num-13 = wk-num_sort7)
                                           or (wk-num-14 = wk-num_sort7)
                                           or (wk-num-15 = wk-num_sort7)then
                                               if (wk-num-1 = wk-num_sort8)
                                               or (wk-num-2 = wk-num_sort8)
                                               or (wk-num-3 = wk-num_sort8)
                                               or (wk-num-3 = wk-num_sort8)
                                               or (wk-num-4 = wk-num_sort8)
                                               or (wk-num-5 = wk-num_sort8)
                                               or (wk-num-6 = wk-num_sort8)
                                               or (wk-num-7 = wk-num_sort8)
                                               or (wk-num-8 = wk-num_sort8)
                                               or (wk-num-9 = wk-num_sort8)
                                               or (wk-num-10 = wk-num_sort8)
                                               or (wk-num-11 = wk-num_sort8)
                                               or (wk-num-12 = wk-num_sort8)
                                               or (wk-num-13 = wk-num_sort8)
                                               or (wk-num-14 = wk-num_sort8)
                                               or (wk-num-15 = wk-num_sort8)then
                                                   if (wk-num-1 = wk-num_sort9)
                                                   or (wk-num-2 = wk-num_sort9)
                                                   or (wk-num-3 = wk-num_sort9)
                                                   or (wk-num-3 = wk-num_sort9)
                                                   or (wk-num-4 = wk-num_sort9)
                                                   or (wk-num-5 = wk-num_sort9)
                                                   or (wk-num-6 = wk-num_sort9)
                                                   or (wk-num-7 = wk-num_sort9)
                                                   or (wk-num-8 = wk-num_sort9)
                                                   or (wk-num-9 = wk-num_sort9)
                                                   or (wk-num-10 = wk-num_sort9)
                                                   or (wk-num-11 = wk-num_sort9)
                                                   or (wk-num-12 = wk-num_sort9)
                                                   or (wk-num-13 = wk-num_sort9)
                                                   or (wk-num-14 = wk-num_sort9)
                                                   or (wk-num-15 = wk-num_sort9)then
                                                       if (wk-num-1 = wk-num_sort10)
                                                       or (wk-num-2 = wk-num_sort10)
                                                       or (wk-num-3 = wk-num_sort10)
                                                       or (wk-num-3 = wk-num_sort10)
                                                       or (wk-num-4 = wk-num_sort10)
                                                       or (wk-num-5 = wk-num_sort10)
                                                       or (wk-num-6 = wk-num_sort10)
                                                       or (wk-num-7 = wk-num_sort10)
                                                       or (wk-num-8 = wk-num_sort10)
                                                       or (wk-num-9 = wk-num_sort10)
                                                       or (wk-num-10 = wk-num_sort10)
                                                       or (wk-num-11 = wk-num_sort10)
                                                       or (wk-num-12 = wk-num_sort10)
                                                       or (wk-num-13 = wk-num_sort10)
                                                       or (wk-num-14 = wk-num_sort10)
                                                       or (wk-num-15 = wk-num_sort10)then
                                                           if (wk-num-1 = wk-num_sort11)
                                                           or (wk-num-2 = wk-num_sort11)
                                                           or (wk-num-3 = wk-num_sort11)
                                                           or (wk-num-3 = wk-num_sort11)
                                                           or (wk-num-4 = wk-num_sort11)
                                                           or (wk-num-5 = wk-num_sort11)
                                                           or (wk-num-6 = wk-num_sort11)
                                                           or (wk-num-7 = wk-num_sort11)
                                                           or (wk-num-8 = wk-num_sort11)
                                                           or (wk-num-9 = wk-num_sort11)
                                                           or (wk-num-10 = wk-num_sort11)
                                                           or (wk-num-11 = wk-num_sort11)
                                                           or (wk-num-12 = wk-num_sort11)
                                                           or (wk-num-13 = wk-num_sort11)
                                                           or (wk-num-14 = wk-num_sort11)
                                                           or (wk-num-15 = wk-num_sort11)then
                                                               if (wk-num-1 = wk-num_sort12)
                                                               or (wk-num-2 = wk-num_sort12)
                                                               or (wk-num-3 = wk-num_sort12)
                                                               or (wk-num-3 = wk-num_sort12)
                                                               or (wk-num-4 = wk-num_sort12)
                                                               or (wk-num-5 = wk-num_sort12)
                                                               or (wk-num-6 = wk-num_sort12)
                                                               or (wk-num-7 = wk-num_sort12)
                                                               or (wk-num-8 = wk-num_sort12)
                                                               or (wk-num-9 = wk-num_sort12)
                                                               or (wk-num-10 = wk-num_sort12)
                                                               or (wk-num-11 = wk-num_sort12)
                                                               or (wk-num-12 = wk-num_sort12)
                                                               or (wk-num-13 = wk-num_sort12)
                                                               or (wk-num-14 = wk-num_sort12)
                                                               or (wk-num-15 = wk-num_sort12)then
                                                                   if (wk-num-1 = wk-num_sort13)
                                                                   or (wk-num-2 = wk-num_sort13)
                                                                   or (wk-num-3 = wk-num_sort13)
                                                                   or (wk-num-3 = wk-num_sort13)
                                                                   or (wk-num-4 = wk-num_sort13)
                                                                   or (wk-num-5 = wk-num_sort13)
                                                                   or (wk-num-6 = wk-num_sort13)
                                                                   or (wk-num-7 = wk-num_sort13)
                                                                   or (wk-num-8 = wk-num_sort13)
                                                                   or (wk-num-9 = wk-num_sort13)
                                                                   or (wk-num-10 = wk-num_sort13)
                                                                   or (wk-num-11 = wk-num_sort13)
                                                                   or (wk-num-12 = wk-num_sort13)
                                                                   or (wk-num-13 = wk-num_sort13)
                                                                   or (wk-num-14 = wk-num_sort13)
                                                                   or (wk-num-15 = wk-num_sort13)then
                                                                       if (wk-num-1 = wk-num_sort14)
                                                                       or (wk-num-2 = wk-num_sort14)
                                                                       or (wk-num-3 = wk-num_sort14)
                                                                       or (wk-num-3 = wk-num_sort14)
                                                                       or (wk-num-4 = wk-num_sort14)
                                                                       or (wk-num-5 = wk-num_sort14)
                                                                       or (wk-num-6 = wk-num_sort14)
                                                                       or (wk-num-7 = wk-num_sort14)
                                                                       or (wk-num-8 = wk-num_sort14)
                                                                       or (wk-num-9 = wk-num_sort14)
                                                                       or (wk-num-10 = wk-num_sort14)
                                                                       or (wk-num-11 = wk-num_sort14)
                                                                       or (wk-num-12 = wk-num_sort14)
                                                                       or (wk-num-13 = wk-num_sort14)
                                                                       or (wk-num-14 = wk-num_sort14)
                                                                       or (wk-num-15 = wk-num_sort14)then
                                                                           if (wk-num-1 = wk-num_sort15)
                                                                           or (wk-num-2 = wk-num_sort15)
                                                                           or (wk-num-3 = wk-num_sort15)
                                                                           or (wk-num-3 = wk-num_sort15)
                                                                           or (wk-num-4 = wk-num_sort15)
                                                                           or (wk-num-5 = wk-num_sort15)
                                                                           or (wk-num-6 = wk-num_sort15)
                                                                           or (wk-num-7 = wk-num_sort15)
                                                                           or (wk-num-8 = wk-num_sort15)
                                                                           or (wk-num-9 = wk-num_sort15)
                                                                           or (wk-num-10 = wk-num_sort15)
                                                                           or (wk-num-11 = wk-num_sort15)
                                                                           or (wk-num-12 = wk-num_sort15)
                                                                           or (wk-num-13 = wk-num_sort15)
                                                                           or (wk-num-14 = wk-num_sort15)
                                                                           or (wk-num-15 = wk-num_sort15)then
                                                                               accept wk-hora-final from time
                                                                               set wk-decisao to true
                                                                           end-if
                                                                       end-if
                                                                   end-if
                                                               end-if
                                                           end-if
                                                       end-if
                                                   end-if
                                               end-if
                                           end-if
                                       end-if
                                   end-if
                               end-if
                           end-if
                       end-if
                   end-if

           end-perform


           perform fim-programa


           .
       controle-prog-exit.
           exit.



      *>------------------------------------------------------------------------
      *> SORTEIO DOS NUMEROS
      *>------------------------------------------------------------------------


       geranum section.



               perform semente-delay
               compute  wk-num_sort1 =  function random(semente) * 60

      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort2 =  function random(semente + wk-num_sort1) * 60
                   if wk-num_sort2 = 00
                   or wk-num_sort2 = wk-num_sort1 then
                       perform semente-delay
                       compute  wk-num_sort2 =  function random(semente + wk-num_sort1) * 60
                   end-if

      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort3 =  function random(semente + wk-num_sort2) * 60
                   if wk-num_sort3 = 00
                   or wk-num_sort3 = wk-num_sort1
                   or wk-num_sort3 = wk-num_sort2 then
                       perform semente-delay
                       compute  wk-num_sort3 =  function random(semente + wk-num_sort2) * 60
                   end-if

      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort4 =  function random(semente + wk-num_sort3) * 60
                   if wk-num_sort4 = 00
                   or wk-num_sort4 = wk-num_sort1
                   or wk-num_sort4 = wk-num_sort2
                   or wk-num_sort4 = wk-num_sort3 then
                       perform semente-delay
                       compute  wk-num_sort4 =  function random(semente + wk-num_sort3) * 60
                   end-if


      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort5 =  function random(semente + wk-num_sort4) * 60
                   if wk-num_sort5 = 00
                   or wk-num_sort5 = wk-num_sort1
                   or wk-num_sort5 = wk-num_sort2
                   or wk-num_sort5 = wk-num_sort3
                   or wk-num_sort5 = wk-num_sort4 then
                       perform semente-delay
                       compute  wk-num_sort5 =  function random(semente + wk-num_sort4) * 60
                   end-if


      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort6 =  function random(semente + wk-num_sort5) * 60
                   if wk-num_sort6 = 00
                   or wk-num_sort6 = wk-num_sort1
                   or wk-num_sort6 = wk-num_sort2
                   or wk-num_sort6 = wk-num_sort3
                   or wk-num_sort6 = wk-num_sort4
                   or wk-num_sort6 = wk-num_sort5 then
                       perform semente-delay
                       compute  wk-num_sort6 =  function random(semente + wk-num_sort5) * 60
                   end-if


               perform semente-delay
               compute  wk-num_sort7 =  function random(semente + wk-num_sort6) * 60
                   if wk-num_sort7 = 00
                   or wk-num_sort7 = wk-num_sort1
                   or wk-num_sort7 = wk-num_sort2
                   or wk-num_sort7 = wk-num_sort3
                   or wk-num_sort7 = wk-num_sort4
                   or wk-num_sort7 = wk-num_sort5
                   or wk-num_sort7 = wk-num_sort6 then
                       perform semente-delay
                       compute  wk-num_sort7 =  function random(semente + wk-num_sort6) * 60
                   end-if


      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort8 =  function random(semente + wk-num_sort7) * 60
                   if wk-num_sort8 = 00
                   or wk-num_sort8 = wk-num_sort1
                   or wk-num_sort8 = wk-num_sort2
                   or wk-num_sort8 = wk-num_sort3
                   or wk-num_sort8 = wk-num_sort4
                   or wk-num_sort8 = wk-num_sort5
                   or wk-num_sort8 = wk-num_sort6
                   or wk-num_sort8 = wk-num_sort7 then
                       perform semente-delay
                       compute  wk-num_sort8 =  function random(semente + wk-num_sort7) * 60
                   end-if


      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort9 =  function random(semente + wk-num_sort8) * 60
                   if wk-num_sort9 = 00
                   or wk-num_sort9 = wk-num_sort1
                   or wk-num_sort9 = wk-num_sort2
                   or wk-num_sort9 = wk-num_sort3
                   or wk-num_sort9 = wk-num_sort4
                   or wk-num_sort9 = wk-num_sort5
                   or wk-num_sort9 = wk-num_sort6
                   or wk-num_sort9 = wk-num_sort7
                   or wk-num_sort9 = wk-num_sort8 then
                       perform semente-delay
                       compute  wk-num_sort9 =  function random(semente + wk-num_sort8) * 60
                   end-if


      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort10 =  function random(semente + wk-num_sort9) * 60
                   if wk-num_sort10 = 00
                   or wk-num_sort10 = wk-num_sort1
                   or wk-num_sort10 = wk-num_sort2
                   or wk-num_sort10 = wk-num_sort3
                   or wk-num_sort10 = wk-num_sort4
                   or wk-num_sort10 = wk-num_sort5
                   or wk-num_sort10 = wk-num_sort6
                   or wk-num_sort10 = wk-num_sort7
                   or wk-num_sort10 = wk-num_sort8
                   or wk-num_sort10 = wk-num_sort9 then
                       perform semente-delay
                       compute  wk-num_sort10 =  function random(semente + wk-num_sort9) * 60
                   end-if


      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort11 =  function random(semente + wk-num_sort10) * 60
                   if wk-num_sort11 = 00
                   or wk-num_sort11 = wk-num_sort1
                   or wk-num_sort11 = wk-num_sort2
                   or wk-num_sort11 = wk-num_sort3
                   or wk-num_sort11 = wk-num_sort4
                   or wk-num_sort11 = wk-num_sort5
                   or wk-num_sort11 = wk-num_sort6
                   or wk-num_sort11 = wk-num_sort7
                   or wk-num_sort11 = wk-num_sort8
                   or wk-num_sort11 = wk-num_sort9
                   or wk-num_sort11 = wk-num_sort10 then
                       perform semente-delay
                       compute  wk-num_sort11 =  function random(semente + wk-num_sort10) * 60
                   end-if



      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort12 =  function random(semente + wk-num_sort11) * 60
                   if wk-num_sort12 = 00
                   or wk-num_sort12 = wk-num_sort1
                   or wk-num_sort12 = wk-num_sort2
                   or wk-num_sort12 = wk-num_sort3
                   or wk-num_sort12 = wk-num_sort4
                   or wk-num_sort12 = wk-num_sort5
                   or wk-num_sort12 = wk-num_sort6
                   or wk-num_sort12 = wk-num_sort7
                   or wk-num_sort12 = wk-num_sort8
                   or wk-num_sort12 = wk-num_sort9
                   or wk-num_sort12 = wk-num_sort10
                   or wk-num_sort12 = wk-num_sort11 then
                       perform semente-delay
                       compute  wk-num_sort12 =  function random(semente + wk-num_sort11) * 60
                   end-if


      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort13 =  function random(semente + wk-num_sort12) * 60
                   if wk-num_sort13 = 00
                   or wk-num_sort13 = wk-num_sort1
                   or wk-num_sort13 = wk-num_sort2
                   or wk-num_sort13 = wk-num_sort3
                   or wk-num_sort13 = wk-num_sort4
                   or wk-num_sort13 = wk-num_sort5
                   or wk-num_sort13 = wk-num_sort6
                   or wk-num_sort13 = wk-num_sort7
                   or wk-num_sort13 = wk-num_sort8
                   or wk-num_sort13 = wk-num_sort9
                   or wk-num_sort13 = wk-num_sort10
                   or wk-num_sort13 = wk-num_sort11
                   or wk-num_sort13 = wk-num_sort12 then
                       perform semente-delay
                       compute  wk-num_sort13 =  function random(semente + wk-num_sort12) * 60
                   end-if


      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort14 =  function random(semente + wk-num_sort13) * 60
                   if wk-num_sort14 = 00
                   or wk-num_sort14 = wk-num_sort1
                   or wk-num_sort14 = wk-num_sort2
                   or wk-num_sort14 = wk-num_sort3
                   or wk-num_sort14 = wk-num_sort4
                   or wk-num_sort14 = wk-num_sort5
                   or wk-num_sort14 = wk-num_sort6
                   or wk-num_sort14 = wk-num_sort7
                   or wk-num_sort14 = wk-num_sort8
                   or wk-num_sort14 = wk-num_sort9
                   or wk-num_sort14 = wk-num_sort10
                   or wk-num_sort14 = wk-num_sort11
                   or wk-num_sort14 = wk-num_sort12
                   or wk-num_sort14 = wk-num_sort13 then
                       perform semente-delay
                       compute  wk-num_sort14 =  function random(semente + wk-num_sort13) * 60
                   end-if



      *>    accept semente from time
               perform semente-delay
               compute  wk-num_sort15 =  function random(semente + wk-num_sort14) * 60
                   if wk-num_sort15 = 00
                   or wk-num_sort15 = wk-num_sort1
                   or wk-num_sort15 = wk-num_sort2
                   or wk-num_sort15 = wk-num_sort3
                   or wk-num_sort15 = wk-num_sort4
                   or wk-num_sort15 = wk-num_sort5
                   or wk-num_sort15 = wk-num_sort6
                   or wk-num_sort15 = wk-num_sort7
                   or wk-num_sort15 = wk-num_sort8
                   or wk-num_sort15 = wk-num_sort9
                   or wk-num_sort15 = wk-num_sort10
                   or wk-num_sort15 = wk-num_sort11
                   or wk-num_sort15 = wk-num_sort12
                   or wk-num_sort15 = wk-num_sort13
                   or wk-num_sort15 = wk-num_sort14 then
                       perform semente-delay
                       compute  wk-num_sort15 =  function random(semente + wk-num_sort14) * 60
                   end-if


               display wk-num_sort1 " - " wk-num_sort2 " - " wk-num_sort3 " - " wk-num_sort4 " - " wk-num_sort5 " - " wk-num_sort6 " - " wk-num_sort7 " - " wk-num_sort8 " - " wk-num_sort9
                       " - " wk-num_sort10 " - " wk-num_sort11 " - " wk-num_sort12 " - " wk-num_sort13 " - " wk-num_sort14 " - " wk-num_sort15

              *> add 1 to wk-contador

           .
       geranum-exit.
           exit.

       semente-delay section.  *> delay de 1 centésimo de segundo
           perform 10 times
               accept semente1 from time *>aceitando a semente direto da hora, direto do pc
               move semente1    to semente  *>dando algum conteudo pra semente e as duas tem o mesmo valor agora
               perform until semente > semente1   *> E aqui eu performo até que a semente seja "diferente de semente1
                   accept semente from time
               end-perform
           end-perform
           .
       semente-delay-exit.
           exit.


       fim-programa section.

           perform calculo-hora
           move wk-contador to wk-contador2

           if wk-contador2 <> 1 then
               display tela-final
               accept tela-final
           else
               display tela-acerto
               accept tela-acerto
           end-if

           .
       fim-programa-exit.
           exit.

       calculo-hora section.

           subtract wk-hora-inicio from wk-hora-final giving wk-hora-total

           .
       calculo-hora-exit.
           exit.

      *>------------------------------------------------------------------------
      *>                       Finalização
      *>------------------------------------------------------------------------
       finaliza section.

           stop run
           .
       finaliza-exit.
           exit.












