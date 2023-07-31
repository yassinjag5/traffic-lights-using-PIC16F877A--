
_lights:

;projecttttt.c,1 :: 		void lights(int i){
;projecttttt.c,2 :: 		int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 16, 17, 18, 19, 20, 21, 22, 23,24,25,32, 33, 34, 35};
	MOVLW      ?ICSlights_arr_L0+0
	MOVWF      ___DoICPAddr+0
	MOVLW      hi_addr(?ICSlights_arr_L0+0)
	MOVWF      ___DoICPAddr+1
	MOVLW      lights_arr_L0+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      R0+0
	CALL       ___CC2DW+0
;projecttttt.c,3 :: 		for (; i>0; i--){
L_lights0:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_lights_i+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lights66
	MOVF       FARG_lights_i+0, 0
	SUBLW      0
L__lights66:
	BTFSC      STATUS+0, 0
	GOTO       L_lights1
;projecttttt.c,4 :: 		portb=arr[i];
	MOVF       FARG_lights_i+0, 0
	MOVWF      R0+0
	MOVF       FARG_lights_i+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      lights_arr_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;projecttttt.c,5 :: 		delay_ms(110);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      30
	MOVWF      R12+0
	MOVLW      179
	MOVWF      R13+0
L_lights3:
	DECFSZ     R13+0, 1
	GOTO       L_lights3
	DECFSZ     R12+0, 1
	GOTO       L_lights3
	DECFSZ     R11+0, 1
	GOTO       L_lights3
	NOP
	NOP
;projecttttt.c,3 :: 		for (; i>0; i--){
	MOVLW      1
	SUBWF      FARG_lights_i+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_lights_i+1, 1
;projecttttt.c,6 :: 		}
	GOTO       L_lights0
L_lights1:
;projecttttt.c,7 :: 		}
L_end_lights:
	RETURN
; end of _lights

_main:

;projecttttt.c,8 :: 		void main(){
;projecttttt.c,9 :: 		int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 16, 17, 18, 19, 20, 21, 22, 23,24,25,32, 33, 34, 35};
	MOVLW      ?ICSmain_arr_L0+0
	MOVWF      ___DoICPAddr+0
	MOVLW      hi_addr(?ICSmain_arr_L0+0)
	MOVWF      ___DoICPAddr+1
	MOVLW      main_arr_L0+0
	MOVWF      FSR
	MOVLW      48
	MOVWF      R0+0
	CALL       ___CC2DW+0
;projecttttt.c,11 :: 		trisb = 0;
	CLRF       TRISB+0
;projecttttt.c,12 :: 		trisc = 0;
	CLRF       TRISC+0
;projecttttt.c,13 :: 		trisd = 0;
	CLRF       TRISD+0
;projecttttt.c,14 :: 		trisa = 0;
	CLRF       TRISA+0
;projecttttt.c,15 :: 		portd = 0;
	CLRF       PORTD+0
;projecttttt.c,16 :: 		porta.B4 = 0;
	BCF        PORTA+0, 4
;projecttttt.c,17 :: 		portc = 0b00001111;
	MOVLW      15
	MOVWF      PORTC+0
;projecttttt.c,18 :: 		while (1){
L_main4:
;projecttttt.c,19 :: 		while (porta.B4)
L_main6:
	BTFSS      PORTA+0, 4
	GOTO       L_main7
;projecttttt.c,20 :: 		{     int i=23, j=15;
	MOVLW      23
	MOVWF      main_i_L2+0
	MOVLW      0
	MOVWF      main_i_L2+1
	MOVLW      15
	MOVWF      main_j_L2+0
	MOVLW      0
	MOVWF      main_j_L2+1
;projecttttt.c,21 :: 		if (porta.B4){portd.B3=1;portd.B4=0; portd.B5=0;portd.B1=0;portd.B0=0;}
	BTFSS      PORTA+0, 4
	GOTO       L_main8
	BSF        PORTD+0, 3
	BCF        PORTD+0, 4
	BCF        PORTD+0, 5
	BCF        PORTD+0, 1
	BCF        PORTD+0, 0
L_main8:
;projecttttt.c,22 :: 		for (; i>0 && porta.B4; i--){
L_main9:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVF       main_i_L2+0, 0
	SUBLW      0
L__main68:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
	BTFSS      PORTA+0, 4
	GOTO       L_main10
L__main64:
;projecttttt.c,23 :: 		if (i>3){portd.B2=1;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVF       main_i_L2+0, 0
	SUBLW      3
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
	BSF        PORTD+0, 2
	GOTO       L_main15
L_main14:
;projecttttt.c,24 :: 		else {portd.B2=0; portd.B1=1;}
	BCF        PORTD+0, 2
	BSF        PORTD+0, 1
L_main15:
;projecttttt.c,25 :: 		portb=arr[i];
	MOVF       main_i_L2+0, 0
	MOVWF      R0+0
	MOVF       main_i_L2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_arr_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;projecttttt.c,26 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
;projecttttt.c,22 :: 		for (; i>0 && porta.B4; i--){
	MOVLW      1
	SUBWF      main_i_L2+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L2+1, 1
;projecttttt.c,27 :: 		}
	GOTO       L_main9
L_main10:
;projecttttt.c,28 :: 		if (porta.B4){
	BTFSS      PORTA+0, 4
	GOTO       L_main17
;projecttttt.c,29 :: 		portd.B3=0;
	BCF        PORTD+0, 3
;projecttttt.c,30 :: 		portd.B1=0;
	BCF        PORTD+0, 1
;projecttttt.c,31 :: 		portd.B0=1;
	BSF        PORTD+0, 0
;projecttttt.c,32 :: 		portd.B5=1;}
	BSF        PORTD+0, 5
L_main17:
;projecttttt.c,33 :: 		for (; j>0 && porta.B4; j--){
L_main18:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_j_L2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVF       main_j_L2+0, 0
	SUBLW      0
L__main70:
	BTFSC      STATUS+0, 0
	GOTO       L_main19
	BTFSS      PORTA+0, 4
	GOTO       L_main19
L__main63:
;projecttttt.c,34 :: 		if (j<=3){portd.B5=0; portd.B4=1;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_j_L2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main71
	MOVF       main_j_L2+0, 0
	SUBLW      3
L__main71:
	BTFSS      STATUS+0, 0
	GOTO       L_main23
	BCF        PORTD+0, 5
	BSF        PORTD+0, 4
L_main23:
;projecttttt.c,35 :: 		portb=arr[j];
	MOVF       main_j_L2+0, 0
	MOVWF      R0+0
	MOVF       main_j_L2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_arr_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;projecttttt.c,36 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
;projecttttt.c,33 :: 		for (; j>0 && porta.B4; j--){
	MOVLW      1
	SUBWF      main_j_L2+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_j_L2+1, 1
;projecttttt.c,37 :: 		}
	GOTO       L_main18
L_main19:
;projecttttt.c,38 :: 		if (porta.B4){
	BTFSS      PORTA+0, 4
	GOTO       L_main25
;projecttttt.c,39 :: 		portd.B0=0;
	BCF        PORTD+0, 0
;projecttttt.c,40 :: 		portd.B4=0;}
	BCF        PORTD+0, 4
L_main25:
;projecttttt.c,41 :: 		}
	GOTO       L_main6
L_main7:
;projecttttt.c,42 :: 		while (!porta.B4){
L_main26:
	BTFSC      PORTA+0, 4
	GOTO       L_main27
;projecttttt.c,43 :: 		int k = 3;
	MOVLW      3
	MOVWF      main_k_L2+0
	MOVLW      0
	MOVWF      main_k_L2+1
;projecttttt.c,44 :: 		portb=0;
	CLRF       PORTB+0
;projecttttt.c,45 :: 		if (portc.B4 && !porta.B4){
	BTFSS      PORTC+0, 4
	GOTO       L_main30
	BTFSC      PORTA+0, 4
	GOTO       L_main30
L__main62:
;projecttttt.c,46 :: 		portd=0;
	CLRF       PORTD+0
;projecttttt.c,47 :: 		portd.B2=0;
	BCF        PORTD+0, 2
;projecttttt.c,48 :: 		portd.B0=1;
	BSF        PORTD+0, 0
;projecttttt.c,49 :: 		portd.B4=1;
	BSF        PORTD+0, 4
;projecttttt.c,50 :: 		for (; k>0 && portc.B4 && !porta.B4; k--){
L_main31:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_k_L2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVF       main_k_L2+0, 0
	SUBLW      0
L__main72:
	BTFSC      STATUS+0, 0
	GOTO       L_main32
	BTFSS      PORTC+0, 4
	GOTO       L_main32
	BTFSC      PORTA+0, 4
	GOTO       L_main32
L__main61:
;projecttttt.c,51 :: 		portb=arr[k];
	MOVF       main_k_L2+0, 0
	MOVWF      R0+0
	MOVF       main_k_L2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_arr_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;projecttttt.c,52 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	DECFSZ     R11+0, 1
	GOTO       L_main36
	NOP
;projecttttt.c,50 :: 		for (; k>0 && portc.B4 && !porta.B4; k--){
	MOVLW      1
	SUBWF      main_k_L2+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_k_L2+1, 1
;projecttttt.c,53 :: 		}
	GOTO       L_main31
L_main32:
;projecttttt.c,54 :: 		portd.B0=0;
	BCF        PORTD+0, 0
;projecttttt.c,55 :: 		portd.B2=1;
	BSF        PORTD+0, 2
;projecttttt.c,56 :: 		portb=0;
	CLRF       PORTB+0
;projecttttt.c,57 :: 		portd.B4=0;
	BCF        PORTD+0, 4
;projecttttt.c,58 :: 		while (portc.B4 && !porta.B4){portd.B3=1; delay_ms(100);}
L_main37:
	BTFSS      PORTC+0, 4
	GOTO       L_main38
	BTFSC      PORTA+0, 4
	GOTO       L_main38
L__main60:
	BSF        PORTD+0, 3
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
	NOP
	GOTO       L_main37
L_main38:
;projecttttt.c,59 :: 		}
	GOTO       L_main42
L_main30:
;projecttttt.c,60 :: 		else if (!portc.B4 && !porta.B4){
	BTFSC      PORTC+0, 4
	GOTO       L_main45
	BTFSC      PORTA+0, 4
	GOTO       L_main45
L__main59:
;projecttttt.c,61 :: 		portd=0;
	CLRF       PORTD+0
;projecttttt.c,62 :: 		portd.B5=0;
	BCF        PORTD+0, 5
;projecttttt.c,63 :: 		portd.B3=1;
	BSF        PORTD+0, 3
;projecttttt.c,64 :: 		portd.B1=1;
	BSF        PORTD+0, 1
;projecttttt.c,65 :: 		for (; k>0 && !portc.B4 && !porta.B4; k--){
L_main46:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_k_L2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVF       main_k_L2+0, 0
	SUBLW      0
L__main73:
	BTFSC      STATUS+0, 0
	GOTO       L_main47
	BTFSC      PORTC+0, 4
	GOTO       L_main47
	BTFSC      PORTA+0, 4
	GOTO       L_main47
L__main58:
;projecttttt.c,66 :: 		portb=arr[k];
	MOVF       main_k_L2+0, 0
	MOVWF      R0+0
	MOVF       main_k_L2+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_arr_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;projecttttt.c,67 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main51:
	DECFSZ     R13+0, 1
	GOTO       L_main51
	DECFSZ     R12+0, 1
	GOTO       L_main51
	DECFSZ     R11+0, 1
	GOTO       L_main51
	NOP
;projecttttt.c,65 :: 		for (; k>0 && !portc.B4 && !porta.B4; k--){
	MOVLW      1
	SUBWF      main_k_L2+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_k_L2+1, 1
;projecttttt.c,68 :: 		}
	GOTO       L_main46
L_main47:
;projecttttt.c,69 :: 		portd.B5=1;
	BSF        PORTD+0, 5
;projecttttt.c,70 :: 		portd.B3=0;
	BCF        PORTD+0, 3
;projecttttt.c,71 :: 		portb=0;
	CLRF       PORTB+0
;projecttttt.c,72 :: 		portd.B1=0;
	BCF        PORTD+0, 1
;projecttttt.c,73 :: 		while (!portc.B4 && !porta.B4){portd.B0=1; delay_ms(100);}
L_main52:
	BTFSC      PORTC+0, 4
	GOTO       L_main53
	BTFSC      PORTA+0, 4
	GOTO       L_main53
L__main57:
	BSF        PORTD+0, 0
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main56:
	DECFSZ     R13+0, 1
	GOTO       L_main56
	DECFSZ     R12+0, 1
	GOTO       L_main56
	DECFSZ     R11+0, 1
	GOTO       L_main56
	NOP
	GOTO       L_main52
L_main53:
;projecttttt.c,74 :: 		}
L_main45:
L_main42:
;projecttttt.c,75 :: 		}
	GOTO       L_main26
L_main27:
;projecttttt.c,76 :: 		}
	GOTO       L_main4
;projecttttt.c,77 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
