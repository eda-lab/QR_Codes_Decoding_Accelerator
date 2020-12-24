#include <stdio.h>
#include "time.h"
#include <string.h>

_int64 weight(_int64 symdrome_in, _int64 m_length);
_int64 mod(_int64 msg, _int64 m_length);
/*_int64 sym_table[37] = {
	38422874595, 39031380517, 46687436201, 57172423345, 10424249473,  //0~4
	20848498946, 41696997892, 49803554283, 67698512437, 32017493385,  //5~9
	64034986770, 22074507207, 44149014414, 53634037503,   193094685,  //10~14
	  386189370,   772378740,  1544757480,  3089514960,  6179029920,  //15~19
	12358059840, 24716119680, 49432239360, 68566823907, 30599802405,  //20~24
	61199604810, 19556020599, 39112041198, 46249167935, 57906172317,  //25~29
	 8671374041, 17342748082, 34685496164, 37933014827, 40195667893,  //30~34
	44117583497, 53571175665};	*/									  //35~36
/*_int64 sym_table[37] = {
25023207909,50046415818,67642715767,32439620877,64879241754,
29059964375,58119928750,16680877759,33361755518,66723511036,
33825061915,67650123830,31988611471,63977222942,22422974431,
44845948862,51810350751,3530089693 ,7060179386 ,14120358772,
28240717544,56481435088,11797664323,23595328646,47190657292,
56031583227,12437339669,24874679338,49749358676,68060674379,
31194643317,62389286634,25758229559,51516459118,64677419327,
29729799069,59459598138
};*/
_int64 sym_table[37] = {
	25023207797,50046415594,11249171617,22498343234,44996686468,
	4957289597 ,9914579194 ,19829158388,39658316776,32830660261,
	65661320522,48319407073,14283742903,28567485806,57134971612,
	65640541389,48377725167,14301321387,28602642774,57205285548,
	66305203245,48105382191,15936527147,31873054294,63746108588,
	36446339117,22208960815,44417921630,6383254985 ,12766509970,
	25533019940,51066039880,8941471205 ,17882942410,35765884820,
	23435671133,46871342266
};

void main() {
	_int64 code_m = 0, code_p = 0;
	_int64 err_m = 0, err_p = 0;
	_int64 rcv_m = 0, rcv_p = 0;
	_int64 rcv_m_inv = 0, rcv_p_inv = 0;
	_int64 dcode_m = 0;
	_int64 sym_pre = 0, sym_two = 0, sym_three1 = 0, sym_three2 = 0;
	_int64 sym_pre_inv = 0, sym_two_inv = 0, sym_three1_inv = 0, sym_three2_inv = 0;
	int flag = 0, m_length = 37, p_length = 36, i = 0, j = 0, k = 0;
	_int64  w_pre = 0, w_one = 0, w_two = 0, w_three = 0;
	_int64  w_pre_inv = 0, w_one_inv = 0, w_two_inv = 0, w_three_inv = 0;
	_int64  shift_1 = 1;
	char dcode_pos[20] = "undone";

	while (1) {
		flag = 0;
		printf("please input message : \n");  scanf_s("%d", &code_m);
		printf("please input niose_m : \n");   scanf_s("%d", &err_m);
		printf("please input niose_p : \n");   scanf_s("%d", &err_p);
		
		code_p = mod(code_m, m_length);
		printf(" code_m is : %I64d  code_p is : %I64d\n", code_m, code_p);
		printf(" niose_m is : %I64d  niose_p is : %I64d\n", err_m, err_p);

		rcv_m = code_m ^ err_m;
		rcv_p = code_p ^ err_p;
		printf(" rcv_m is : %I64d  rcv_p is : %I64d\n", rcv_m, rcv_p);


		for (int st = 0; st < 2; st++) {

			if (st == 1) {
				rcv_m = ((rcv_m & 0x01) << 36) ^ rcv_p;
				rcv_p = rcv_m >> 1;
			}
			sym_pre = mod(rcv_m, m_length) ^ rcv_p;
			w_pre = weight(sym_pre, m_length);
			if(st == 0)
				printf(" sym_pre = %I64d  w_pre = %I64d\n", sym_pre, w_pre);
			else
				printf(" sym_pre_inv = %I64d  w_pre_inv = %I64d\n", sym_pre, w_pre);


			if (w_pre <= 6) {
				dcode_m = rcv_m;
				flag = 1;
				if (st == 0)
					strcpy_s(dcode_pos, "dcode_pre");
				else
					strcpy_s(dcode_pos, "dcode_pre_inv");
			}
			else {
				for (i = 0; i < m_length; i++) {						//消息位一个错误
					w_one = weight(sym_pre ^ sym_table[i], m_length);
					if (w_one <= 5) {
						dcode_m = (rcv_m ^ (shift_1 << i));
						if(st == 0)
							strcpy_s(dcode_pos, "dcode_one");
						else
							strcpy_s(dcode_pos, "dcode_one_inv");
						printf("i = %d \n", i);
						flag = 1; break;
					}
				}
				if (flag == 0) {										//消息位两个错误
					for (i = 0; i < m_length; i++) {
						sym_two = sym_pre ^ sym_table[i];
						for (j = i + 1; j < m_length; j++) {
							w_two = weight(sym_two ^ sym_table[j], m_length);
							if (w_two <= 4) {
								dcode_m = rcv_m ^ (shift_1 << i) ^ (shift_1 << j);
								if(st == 0)
									strcpy_s(dcode_pos, "dcode_two");
								else
									strcpy_s(dcode_pos, "dcode_two_inv");
								printf("i = %d , j = %d \n", i , j);
								flag = 1; break;
							}
						}
						if (flag) break;
					}
				}
				if (flag == 0) {										//消息位三个错误
					for (i = 0; i < m_length; i++) {
						sym_three1 = sym_pre ^ sym_table[i];
						for (j = i + 1; j < m_length; j++) {
							sym_three2 = sym_three1 ^ sym_table[j];
							for (k = j + 1; k < m_length; k++) {
								w_three = weight(sym_three2 ^ sym_table[k], m_length);
								if (w_three <= 3) {
									dcode_m = rcv_m ^ (shift_1 << i) ^ (shift_1 << j) ^ (shift_1 << k);
									if(st == 0)
										strcpy_s(dcode_pos, "dcode_three");
									else
										strcpy_s(dcode_pos, "dcode_three_inv");
									printf("i = %d , j = %d , k = %d \n", i, j, k);
									flag = 1; break;
								}
							}
						}
						if (flag) break;
					}
				}
			}
			if (flag) break;
		}
		printf("right message is : %I64d\n", dcode_m);
		printf("dcode_position : %s\n", dcode_pos);
		strcpy_s(dcode_pos, "undone");
	}
}

_int64 mod(_int64 msg, _int64 m_length)
{
	_int64 symdrome_out = 0;
	_int64 i,shift_1 = 1;
	for (i = 0; i < m_length; i++) {
		if (msg&(shift_1 << i)) {
			symdrome_out ^= sym_table[i];
		}
	}
	return symdrome_out;
}

_int64 weight(_int64 symdrome_in, _int64 m_length)
{
	_int64 sum = 0;
	_int64 i, shift_1 = 1;
	for (i = 0; i < (m_length - 1); i++) {
		sum += (symdrome_in & (shift_1 << i)) >> i;
	}
	return sum;
}






