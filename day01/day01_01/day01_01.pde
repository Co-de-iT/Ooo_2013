
/* 
 
 Oo° - Object Oriented Ornament
 P5 Co-de-iT workshop Cava dei Tirreni - 22>24 November 2013
 tutor: Alessio Erioli
 
 The very beginning - :)
 
 */


// questo è un commento

/*

questo è
un commento
multilinea

*/

// molti dati (es. colore) vanno da 0 a 255. Perché?
// I dati in questione sono memorizzati in bytes
// 1 byte = 8 bits - 1 bit: unità elementare di informazione
// che può assumere valore 0 o 1
// ad esempio:
//
// 00001100 = 0*2^0+0*2^1+1*2^2+1*2^3 =  12
// 00000000 = 0 - 11111111 = 255

int i=3;         // tipo integer - numeri interi
float f=6.84567; // tipo floating point
boolean b= true; // tipo boolean true/false

println(b);      // stampa dati nella console

b = i>f;         // la disequazione da' true o false

println(b);      // ri-stampa dati nella console

