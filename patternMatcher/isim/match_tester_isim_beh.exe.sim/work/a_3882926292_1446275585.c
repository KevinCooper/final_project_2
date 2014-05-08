/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/C15Kevin.Cooper/Desktop/Documents/ECE383/final_project_2/patternMatcher/shifter.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3882926292_1446275585_p_0(char *t0)
{
    char t19[16];
    char t20[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(22, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3720);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(23, ng0);
    t1 = xsi_get_transient_memory(256U);
    memset(t1, 0, 256U);
    t5 = t1;
    memset(t5, (unsigned char)2, 256U);
    t6 = (t0 + 3816);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 256U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 1512U);
    t7 = *((char **)t2);
    t14 = *((unsigned char *)t7);
    t2 = (t0 + 3880);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t15 = *((char **)t10);
    *((unsigned char *)t15) = t14;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t16 = (255 - 247);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t1 = (t2 + t18);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t7 = ((IEEE_P_2592010699) + 4024);
    t8 = (t20 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 247;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t21 = (0 - 247);
    t22 = (t21 * -1);
    t22 = (t22 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t22;
    t9 = (t0 + 6320U);
    t5 = xsi_base_array_concat(t5, t19, t7, (char)97, t1, t20, (char)97, t6, t9, (char)101);
    t22 = (248U + 8U);
    t3 = (256U != t22);
    if (t3 == 1)
        goto LAB10;

LAB11:    t10 = (t0 + 3816);
    t15 = (t10 + 56U);
    t23 = *((char **)t15);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t5, 256U);
    xsi_driver_first_trans_fast(t10);
    goto LAB3;

LAB7:    t2 = (t0 + 1512U);
    t5 = *((char **)t2);
    t11 = *((unsigned char *)t5);
    t2 = (t0 + 1992U);
    t6 = *((char **)t2);
    t12 = *((unsigned char *)t6);
    t13 = (t11 != t12);
    t3 = t13;
    goto LAB9;

LAB10:    xsi_size_not_matching(256U, t22, 0);
    goto LAB11;

}

static void work_a_3882926292_1446275585_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(30, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 3944);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 256U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3736);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3882926292_1446275585_init()
{
	static char *pe[] = {(void *)work_a_3882926292_1446275585_p_0,(void *)work_a_3882926292_1446275585_p_1};
	xsi_register_didat("work_a_3882926292_1446275585", "isim/match_tester_isim_beh.exe.sim/work/a_3882926292_1446275585.didat");
	xsi_register_executes(pe);
}
