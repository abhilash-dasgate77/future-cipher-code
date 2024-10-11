#include "config.h"
#include <xc.h>


void Sbox16bit(int *inp) {
    /*fetching bits - one way*/
	int y0,y1,y2,y3;
    int t0,t1,t2,t3;
    int index,sh,mask_or;
    short mask_and;
    int bit;
    int index_q, index_r;
    unsigned int mask;


    for (int i = 0; i < 4; i++){
        /*bit extraction*/
        bit = 4* i + 0;
        index_q = bit >> 2;//0
        index_r = bit & 3;//0


        y3 = 0x000f & ((inp[index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
        y3 = 0x1 & (y3 >> (3 - index_r));


        bit = 4* i + 1;
        index_q = bit >> 2;//0
        index_r = bit & 3;//0
        y2 = 0x000f & ((inp[index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
        y2 = 0x1 & (y2 >> (3 - index_r));


        bit = 4* i + 2;
        index_q = bit >> 2;//0
        index_r = bit & 3;//0
        y1 = 0x000f & ((inp[index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
        y1 = 0x1 & (y1 >> (3 - index_r));


        bit = 4* i + 3;
        index_q = bit >> 2;//0
        index_r = bit & 3;//0
        y0 = 0x000f & ((inp[index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
        y0 = 0x1 & (y0 >> (3 - index_r));


        // modification


        t3 = y0 & y1 & y3 ^ y0 & y2 ^ y3;
        t2 = y1 & y3 ^ y2;
        t1 = y0 & y2 & y3 ^ y0 & y2 ^ y0 ^ y1 & y2 ^ y2;
        t0 = y0 & y1 & y3 ^ y0 & y2 ^ y0 & y3 ^ y1 ^ 1;


        /*assigning*/
        bit = 4* i + 0;
        index = bit >> 4;//0
        sh = bit & 15;//0
        mask_or = t3 << (15 - sh);
        mask = 0xfffe;
        mask_and = (mask << (15 - sh)) | (mask >> (16 - (15 - sh))) ;
        inp[index] = ((inp[index] & mask_and) | mask_or);//0x0001 or 0x0000


        bit = 4* i + 1;
        index = bit >> 4;//0
        sh = bit & 15;//0
        mask_or = t2 << (15 - sh);
        mask = 0xfffe;
        mask_and = (mask << (15 - sh)) | (mask >> (16 - (15 - sh))) ;
        inp[index] = ((inp[index] & mask_and) | mask_or);//0x0001 or 0x0000


        bit = 4* i + 2;
        index = bit >> 4;//0
        sh = bit & 15;//0
        mask_or = t1 << (15 - sh);
        mask = 0xfffe;
        mask_and = (mask << (15 - sh)) | (mask >> (16 - (15 - sh))) ;
        inp[index] = ((inp[index] & mask_and) | mask_or);//0x0001 or 0x0000


        bit = 4* i + 3;
        index = bit >> 4;//0
        sh = bit & 15;//0
        mask_or = t0 << (15 - sh);
        mask = 0xfffe;
        mask_and = (mask << (15 - sh)) | (mask >> (16 - (15 - sh))) ;
        inp[index] = ((inp[index] & mask_and) | mask_or);//0x0001 or 0x0000
    }
}

void Mx16bit(int *inp) {
    int c[16];  // Temporary array to hold results
    int b[16];
    int index,sh,mask_or;
    short mask_and;
    int bit;
    int index_q, index_r;
    unsigned int mask;
    /* bit extraction */


    for (int bit = 0 ;bit < 16 ; bit++){
        index_q = bit >> 2;//0
        index_r = bit & 3;//0
        b[bit] = 0x000f & ((inp[index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
        b[bit] = 0x1 & (b[bit] >> (3 - index_r));
    }


    // Calculate new values for 'c' based on the logic in the original function
    c[0]  = (*(b+0) + *(b+12) + *(b+15) + *(b+3)  + *(b+7)  + *(b+8)) & 1;
    c[1]  = (*(b+0) + *(b+1)  + *(b+12) + *(b+13) + *(b+4)  + *(b+9)) & 1;
    c[2]  = (*(b+1) + *(b+10) + *(b+13) + *(b+14) + *(b+2)  + *(b+5)) & 1;
    c[3]  = (*(b+11) + *(b+14) + *(b+2)  + *(b+6)  + *(b+7)) & 1;
    c[4]  = (*(b+0) + *(b+1)  + *(b+11) + *(b+15) + *(b+5)) & 1;
    c[5]  = (*(b+1) + *(b+12) + *(b+2)  + *(b+6)  + *(b+8)) & 1;
    c[6]  = (*(b+0) + *(b+13) + *(b+2)  + *(b+3)  + *(b+4)  + *(b+7) + *(b+9)) & 1;
    c[7]  = (*(b+0) + *(b+10) + *(b+11) + *(b+14) + *(b+15) + *(b+3) + *(b+4)) & 1;
    c[8]  = (*(b+1) + *(b+11) + *(b+15) + *(b+4)  + *(b+5)  + *(b+8)) & 1;
    c[9]  = (*(b+12) + *(b+2)  + *(b+5)  + *(b+6)  + *(b+8)  + *(b+9)) & 1;
    c[10] = (*(b+0) + *(b+10) + *(b+13) + *(b+3)  + *(b+4)  + *(b+6) + *(b+7) + *(b+9)) & 1;
    c[11] = (*(b+0) + *(b+10) + *(b+14) + *(b+15) + *(b+4)  + *(b+7)) & 1;
    c[12] = (*(b+11) + *(b+12) + *(b+3)  + *(b+7)  + *(b+8)) & 1;
    c[13] = (*(b+0) + *(b+13) + *(b+4)  + *(b+8)  + *(b+9)) & 1;
    c[14] = (*(b+1) + *(b+10) + *(b+14) + *(b+5)  + *(b+9)) & 1;
    c[15] = (*(b+10) + *(b+15) + *(b+2)  + *(b+3)  + *(b+6) + *(b+7)) & 1;


    /*assignment*/
    for (int bit = 0 ; bit < 16 ; bit++){
        index = bit >> 4;//0
        sh = bit & 15;//0
        mask_or = c[bit] << (15 - sh);//val is c[bit]
        mask = 0xfffe;
        mask_and = (mask << (15 - sh)) | (mask >> (16 - (15 - sh))) ;
        inp[index] = ((inp[index] & mask_and) | mask_or);//0x0001 or 0x0000
    }


}

void SR(int *inp) {// input is 64 bit
    int res[64];  // Temporary array to store the shifted result
    int b[64];


    int index,sh,mask_or;
    short mask_and;
    int bit;
    int index_q, index_r;
    unsigned int mask;
    /* bit extraction */


    for (int bit = 0 ;bit < 64 ; bit++){
        index_q = bit >> 2;//0
        index_r = bit & 3;//0
        b[bit] = 0x000f & ((inp[index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
        b[bit] = 0x1 & (b[bit] >> (3 - index_r));
    }


    // Apply the shifting logic
    for (int i = 0; i < 64; i++) {
        int shft = (i >> 2) % 4;
        res[i] = *(b + ((i - 16 * shft + 64) % 64));
    }


    /*assignment*/
    for (int bit = 0 ; bit < 64 ; bit++){
        index = bit >> 4;//0
        sh = bit & 15;//0
        mask_or = res[bit] << (15 - sh);//val is c[bit]
        mask = 0xfffe;
        mask_and = (mask << (15 - sh)) | (mask >> (16 - (15 - sh))) ;
        inp[index] = ((inp[index] & mask_and) | mask_or);//0x0001 or 0x0000
    }
}

void lcs(int *inp) {
    int b[64];


    int index,sh,mask_or;
    short mask_and;
    int bit;
    int index_q, index_r;
    unsigned int mask;


    /* bit extraction */
    for (int bit = 0 ;bit < 64 ; bit++){
        index_q = bit >> 2;//0
        index_r = bit & 3;//0
        b[bit] = 0x000f & ((inp[index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
        b[bit] = 0x1 & (b[bit] >> (3 - index_r));
    }


    int key = *b;  // Store the first element (leftmost element)


    // Shift all elements to the left
    for (int i = 0; i < 64 - 1; i++) {
        *(b + i) = *(b + i + 1);
    }


    // Place the original first element at the end
    *(b + 64 - 1) = key;


    /*assignment*/
    for (int bit = 0 ; bit < 64 ; bit++){
        index = bit >> 4;//0
        sh = bit & 15;//0
        mask_or = b[bit] << (15 - sh);//val is c[bit]
        mask = 0xfffe;
        mask_and = (mask << (15 - sh)) | (mask >> (16 - (15 - sh))) ;
        inp[index] = ((inp[index] & mask_and) | mask_or);//0x0001 or 0x0000
    }
}

void dec2Bin(int num,int *arr) {
    // Extract each bit (starting from the least significant bit)
    for (int i = 3; i >= 0; i--) {
        arr[i] = num & 1;  // Get the last bit
        num = num / 2;     // Shift right (equivalent to dividing by 2)
    }
}

//void _do_nothing(){
//    for ( int i = 0; i < 100; i ++);
//}


int main( ){
    /*
    //Configure the oscillator block(64MHz)
    OSCCONbits.IRCF = 0b111;
    OSCTUNEbits.PLLEN = 0b1;


    //Set the pins RB0-RB4 as output
    TRISBbits.TRISB4 = 0;
    TRISBbits.TRISB3 = 0;
    TRISBbits.TRISB2 = 0;
    TRISBbits.TRISB1 = 0;
    TRISBbits.TRISB0 = 0;
    */
    /*FUTURE code starts here*/

    int X[4] = {0x974e,0x0123,0x4323,0x6734};

    int RC[2][4] = {{0x0000,0x0000,0x0000,0x0000},{0x1248,0x2481,0x4812,0x8124}};

    int K[2][4] = {{0x974e,0x0123,0x4323,0x6734},{0x974e,0x0123,0x4323,0x6734}};

    //round 0//
    int b[4];// allocated for binary bits//
    int u;// choose RC[]
    int j, rd, loop;// loop variable
    int k, rc, x;

    int index,sh,mask_or;
    short mask_and;
    int bit;
    int index_q, index_r;
    unsigned int mask;
    for (rd = 0; rd <= 10; rd ++){
        dec2Bin(rd, b);
        u = (b[0]^b[2])|(b[1]^b[3]);
        //round key selection
        if (rd >= 2){
            for (j = 0; j < 5; j++){
                lcs(K[b[3]]);
            }
            for (j = 0; j < 16; j++){
                lcs(RC[u]);
            }
        }
        // end here

        for (loop = 0; loop < 4; loop++){
            for (bit = 0; bit < 16; bit++){
                index_q = bit >> 2;//10
                index_r = bit & 3;//2
                k = 0x000f & ((K[b[3]][index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
                k = 0x1 & (k >> (3 - index_r));
                rc = 0x000f & ((RC[u][index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
                rc = 0x1 & (rc >> (3 - index_r));
                x = 0x000f & ((X[index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
                x = 0x1 & (x >> (3 - index_r));
                x = (x + k + rc) & 1;
            	index = bit >> 4;//3
            	sh = bit & 15;//11
            	mask_or = x << (15 - sh);
            	mask_and = (0xfffe << (15 - sh)) | (0xfffe >> (16 - (15 - sh)));
            	X[index] = ((X[index] & mask_and) | mask_or);//0x0001 or 0x0000
            }
            if (rd <= 8){
                Sbox16bit(X);
                Mx16bit(X);
            }else if(rd == 9){
                Sbox16bit(X);
            }
            for (j = 0; j < 16; j++){
                lcs(X);
            }
            for (j = 0; j < 16; j++){
                lcs(K[b[3]]);
            }
            for (j = 0; j < 16; j++){
                lcs(RC[u]);
            }
        }
        if (rd < 10){
            SR(X);
        }
    }
    
//    _do_nothing();
    
    //Configure the oscillator(64MHz using PLL)
    OSCCON  = 0b01110000;
    OSCTUNE = 0b01000000;
    //OSCCONbits.SCS = 0b10;    // Select internal oscillator as the system clock
    //Set the RD2 pin as digital output
    ANSELCbits.ANSC4 = 0;
    TRISCbits.TRISC4 = 0;
    
    //Blinking RD2
    bit = 0;//0th bit check
	index_q = bit >> 2;//10
	index_r = bit & 3;//2
	int y;
	y = 0x000f & ((X[index_q >> 2] >> ((3 - (index_q & 3)) << 2)));
	y = 0x1 & (y >> (3 - index_r));
    while(1){
        if (y == 1){
            LATCbits.LATC4 = 1;
        }else{
            LATCbits.LATC4 = 0;
        }
    }

    /*FUTURE ends here*/


    /*TESTING*/
    //unsigned int inp[16] = {1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0};  // Example input
    //unsigned int inp[1] = {0x974e};
    //unsigned int inp[4] = {0x974e,0x0123,0x4323,0x6734};
    //Sbox16bit(inp);
    //_do_nothing();
    //Mx16bit(inp);
    //int inp[64] = {1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0};
    //SR(inp);
    //lcs(inp);
    //printf("inp = %x",inp[0]);
    //printf("inp = %x,%x,%x,%x",inp[0],inp[1],inp[2],inp[3]);
    /*TESTING Ends here*/


    return 0;
}
