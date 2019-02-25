parameter bytes;
storage (pair (map address mutez) (pair string (pair string nat)));
code { DUP;
       CDR;
       NIL operation;
       PAIR;
       SWAP;
       CAR;
       DUP;
       PUSH nat 4;
       PUSH nat 0;
       SLICE;
       IF_NONE { PUSH nat 100;
                 FAILWITH } 
               {  } ;
       DUP;
       PUSH bytes 0x19308cc0;
       COMPARE;
       EQ;
       IF { DROP;
            DUP;
            SIZE;
            PUSH nat 4;
            SWAP;
            SUB;
            DUP;
            GT;
            IF {  } 
               { PUSH nat 102;
                 FAILWITH } ;
            ABS;
            PUSH nat 4;
            SLICE;
            IF_NONE { PUSH nat 101;
                      FAILWITH } 
                    {  } ;
            UNPACK (pair address (pair mutez (option bytes)));
            IF_NONE { PUSH nat 103;
                      FAILWITH } 
                    {  } ;
            PAIR;
            NONE mutez;
            PAIR;
            SENDER;
            DIP { DUP;
                  CDDDAR } ;
            MEM;
            DIP { PUSH bool True } ;
            COMPARE;
            EQ;
            IF {  } 
               { PUSH string "Failed assert";
                 FAILWITH } ;
            SENDER;
            DIP { DUP;
                  CDDDAR } ;
            GET;
            IF_NONE { PUSH string "Key not found in map";
                      FAILWITH } 
                    {  } ;
            SWAP;
            SET_CAR;
            DUP;
            CAR;
            DIP { DUP;
                  CDADAR } ;
            COMPARE;
            GE;
            IF {  } 
               { PUSH string "Failed assert";
                 FAILWITH } ;
            SENDER;
            DIP { DUP;
                  CAR;
                  DIP { DUP;
                        CDADAR } ;
                  SUB;
                  SOME } ;
            DIIP { DUP;
                   CDDDAR } ;
            UPDATE;
            SWAP;
            SET_CDDDAR;
            PUSH mutez 0;
            SWAP;
            SET_CAR;
            DUP;
            CDAAR;
            DIP { DUP;
                  CDDDAR } ;
            MEM;
            DIP { PUSH bool True } ;
            COMPARE;
            EQ;
            IF { DUP;
                 CDAAR;
                 DIP { DUP;
                       CDDDAR } ;
                 GET;
                 IF_NONE { PUSH string "Key not found in map";
                           FAILWITH } 
                         {  } ;
                 SWAP;
                 SET_CAR } 
               {  } ;
            DUP;
            CDAAR;
            DIP { DUP;
                  CAR;
                  DIP { DUP;
                        CDADAR } ;
                  ADD;
                  SOME } ;
            DIIP { DUP;
                   CDDDAR } ;
            UPDATE;
            SWAP;
            SET_CDDDAR;
            DUP;
            CDADDR;
            IF_NONE { PUSH bool False } 
                    { DROP;
                      PUSH bool True } ;
            DIP { PUSH bool True } ;
            COMPARE;
            EQ;
            IF { DUP;
                 CDADDR;
                 IF_NONE { PUSH string "Optional value is empty";
                           FAILWITH } 
                         {  } ;
                 DIP { DUP;
                       CDADAR } ;
                 SWAP;
                 PAIR;
                 DIP { SENDER } ;
                 SWAP;
                 PAIR;
                 DIP { PUSH mutez 0 } ;
                 DIIP { DUP;
                        CDAAR;
                        CONTRACT (pair address (pair mutez bytes));
                        IF_NONE { PUSH string "Invalid contract";
                                  FAILWITH } 
                                {  }  } ;
                 TRANSFER_TOKENS;
                 DIP { DUP;
                       CDDAR } ;
                 CONS;
                 SWAP;
                 SET_CDDAR } 
               {  } ;
            CDDR } 
          { DROP;
            PUSH nat 400;
            FAILWITH }  } 
