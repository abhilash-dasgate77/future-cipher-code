#include "config.h"
#include <xc.h>

void Sbox16bit(int *inp) {
    int sb[16] = {1, 3, 0, 2, 7, 14, 4, 13, 9, 10, 12, 6, 15, 5, 8, 11};  // S-box mapping

    for (int i = 0; i < 16; i += 4) {
        int v = 8 * (*(inp + i)) + 4 * (*(inp + i + 1)) + 2 * (*(inp + i + 2)) + (*(inp + i + 3));
        v = sb[v];

        int bn[4];
        int bt = 4;
        int idx = 3;  // Start filling from the end of the bn array
        while (v || bt) {
            bn[idx--] = v & 1;
            v = v >> 1;
            bt--;
        }
        for (int k = 0; k < 4; ++k) {
            *(inp + i + k) = bn[k];  // Update the input in place
        }
    }
}

void Mx16bit(int *b) {
    int c[16] = {0};  // Temporary array to hold results

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

    // Modify the original input array in place
    for (int i = 0; i < 16; i++) {
        *(b + i) = c[i];
    }
}

void SR(int *inp) {
    int res[64];  // Temporary array to store the shifted result
    // Apply the shifting logic
    for (int i = 0; i < 64; i++) {
        int shft = (i >> 2) % 4;
        res[i] = *(inp + ((i - 16 * shft + 64) & 63));
    }
    // Copy the result back to the original input array in place
    for (int i = 0; i < 64; i++) {
        *(inp + i) = res[i];
    }
}

void lcs(int * inp, int sh){
	int tmp[16];
	for (int i = 0 ;i < sh ; i++){
		tmp[i] = inp[i];
	}
	for (int i = 0 ; i < 64 - sh ; i++){
		*(inp + i) = *(inp + i + sh);
	}
	for (int i = 0 ;i < sh ; i++){
		inp[64 - sh + i] = tmp[i];
	}
}

void dec2Bin(int num,int *arr) {
    // Extract each bit (starting from the least significant bit)
    for (int i = 3; i >= 0; i--) {
        arr[i] = num & 1;  // Get the last bit
        num = num / 2;     // Shift right (equivalent to dividing by 2)
    }
}

void _do_nothing(){
    for ( int i = 0; i < 100; i ++);
}
int main(){
    /*FUTURE code starts here*/
    OSCCONbits.IRCF = 0b111;  // Set internal oscillator to 16 MHz
    OSCTUNEbits.PLLEN = 1;    // Enable 4x PLL, resulting in 64 MHz
    
    ANSELCbits.ANSC2 = 0;//analog to digital
    TRISCbits.TRISC2 = 0;//state to output
    
    ANSELCbits.ANSC3 = 0;//analog to digital
    TRISCbits.TRISC3 = 0;//state to output
    
    ANSELCbits.ANSC4 = 0;//analog to digital
    TRISCbits.TRISC4 = 0;//state to output
    
    ANSELCbits.ANSC5 = 0;//analog to digital
    TRISCbits.TRISC5 = 0;//state to output
    /*FUTURE code starts here*/
    
    int X[64] = {1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0};

    int sb[16] = {1,3,0,2,7,14,4,13,9,10,12,6,15,5,8,11};

    int RC[64] = {0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0};

    int K[2][64] = {{1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0},{1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0}};

    //round 0//
    int b[4];// allocated for binary bits//
    int u;// choose RC[]
    int j, rd, loop;// loop variable
    for (rd = 0; rd <= 10; rd ++){
        dec2Bin(rd, b);
        u = (b[0]^b[2])|(b[1]^b[3]);
        //round key selection
        if (rd >= 2){
            lcs(K[b[3]],5);
            if (u == 1){
                lcs(RC,16);
            }
        }
        // end here
        for (loop = 0; loop < 4; loop++){
            for (j = 0; j < 16; j++){
                if (u == 0){
                    X[j] = (X[j] + K[b[3]][j]) & 1;
                }else{
                    X[j] = (X[j] + K[b[3]][j] + RC[j]) & 1;
                }
            }
            if (rd <= 8){
                Sbox16bit(X);
                Mx16bit(X);
            }else if(rd == 9){
                Sbox16bit(X);
            }

            lcs(X,16);
            lcs(K[b[3]],16);
            if (u == 1){
                lcs(RC,16);
            }
        }
        if (rd < 10){
            SR(X);
        }
        if (b[0] == 1){
            LATCbits.LATC2 = 1;
        }else{
            LATCbits.LATC2 = 0;
        }
        if (b[1] == 1){
            LATCbits.LATC3 = 1;
        }else{
            LATCbits.LATC3 = 0;
        }
        if (b[2] == 1){
            LATCbits.LATC4 = 1;
        }else{
            LATCbits.LATC4 = 0;
        }
        if (b[3] == 1){
            LATCbits.LATC5 = 1;
        }else{
            LATCbits.LATC5 = 0;
        }
    }
//    _do_nothing();

    /*FUTURE ends here*/
    
    /*TESTING*/
    //int inp[16] = {1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0};  // Example input
    //Sbox16bit(inp);
    //Mx16bit(inp);
    //int inp[64] = {1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0};
    //SR(inp);
    //lcs(inp); 
    //for(int i = 0;i<64;i++){printf("%d",inp[i]);}
    /*TESTING Ends here*/

    return 0;
}
