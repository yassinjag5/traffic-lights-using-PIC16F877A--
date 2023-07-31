#line 1 "D:/summer training/summer 2/projectt/projecttttt.c"
void lights(int i){
 int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 16, 17, 18, 19, 20, 21, 22, 23,24,25,32, 33, 34, 35};
 for (; i>0; i--){
 portb=arr[i];
 delay_ms(110);
 }
}
void main(){
 int arr[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 16, 17, 18, 19, 20, 21, 22, 23,24,25,32, 33, 34, 35};

 trisb = 0;
 trisc = 0;
 trisd = 0;
 trisa = 0;
 portd = 0;
 porta.B4 = 0;
 portc = 0b00001111;
 while (1){
 while (porta.B4)
 { int i=23, j=15;
 if (porta.B4){portd.B3=1;portd.B4=0; portd.B5=0;portd.B1=0;portd.B0=0;}
 for (; i>0 && porta.B4; i--){
 if (i>3){portd.B2=1;}
 else {portd.B2=0; portd.B1=1;}
 portb=arr[i];
 delay_ms(100);
 }
 if (porta.B4){
 portd.B3=0;
 portd.B1=0;
 portd.B0=1;
 portd.B5=1;}
 for (; j>0 && porta.B4; j--){
 if (j<=3){portd.B5=0; portd.B4=1;}
 portb=arr[j];
 delay_ms(100);
 }
 if (porta.B4){
 portd.B0=0;
 portd.B4=0;}
 }
 while (!porta.B4){
 int k = 3;
 portb=0;
 if (portc.B4 && !porta.B4){
 portd=0;
 portd.B2=0;
 portd.B0=1;
 portd.B4=1;
 for (; k>0 && portc.B4 && !porta.B4; k--){
 portb=arr[k];
 delay_ms(100);
 }
 portd.B0=0;
 portd.B2=1;
 portb=0;
 portd.B4=0;
 while (portc.B4 && !porta.B4){portd.B3=1; delay_ms(100);}
 }
 else if (!portc.B4 && !porta.B4){
 portd=0;
 portd.B5=0;
 portd.B3=1;
 portd.B1=1;
 for (; k>0 && !portc.B4 && !porta.B4; k--){
 portb=arr[k];
 delay_ms(100);
 }
 portd.B5=1;
 portd.B3=0;
 portb=0;
 portd.B1=0;
 while (!portc.B4 && !porta.B4){portd.B0=1; delay_ms(100);}
 }
 }
 }
}
