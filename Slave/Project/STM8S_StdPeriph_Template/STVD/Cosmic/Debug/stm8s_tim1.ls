   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.8 - 08 Nov 2022
   3                     ; Generator (Limited) V4.5.5 - 08 Nov 2022
   4                     ; Optimizer V4.5.5 - 08 Nov 2022
  49                     ; 58 void TIM1_DeInit(void)
  49                     ; 59 {
  51                     .text:	section	.text,new
  52  0000               _TIM1_DeInit:
  56                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  58  0000 725f5250      	clr	21072
  59                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  61  0004 725f5251      	clr	21073
  62                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  64  0008 725f5252      	clr	21074
  65                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  67  000c 725f5253      	clr	21075
  68                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  70  0010 725f5254      	clr	21076
  71                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  73  0014 725f5256      	clr	21078
  74                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  76  0018 725f525c      	clr	21084
  77                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  79  001c 725f525d      	clr	21085
  80                     ; 70   TIM1->CCMR1 = 0x01;
  82  0020 35015258      	mov	21080,#1
  83                     ; 71   TIM1->CCMR2 = 0x01;
  85  0024 35015259      	mov	21081,#1
  86                     ; 72   TIM1->CCMR3 = 0x01;
  88  0028 3501525a      	mov	21082,#1
  89                     ; 73   TIM1->CCMR4 = 0x01;
  91  002c 3501525b      	mov	21083,#1
  92                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  94  0030 725f525c      	clr	21084
  95                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  97  0034 725f525d      	clr	21085
  98                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 100  0038 725f5258      	clr	21080
 101                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 103  003c 725f5259      	clr	21081
 104                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 106  0040 725f525a      	clr	21082
 107                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 109  0044 725f525b      	clr	21083
 110                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 112  0048 725f525e      	clr	21086
 113                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 115  004c 725f525f      	clr	21087
 116                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 118  0050 725f5260      	clr	21088
 119                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 121  0054 725f5261      	clr	21089
 122                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 124  0058 35ff5262      	mov	21090,#255
 125                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 127  005c 35ff5263      	mov	21091,#255
 128                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 130  0060 725f5265      	clr	21093
 131                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 133  0064 725f5266      	clr	21094
 134                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 136  0068 725f5267      	clr	21095
 137                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 139  006c 725f5268      	clr	21096
 140                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 142  0070 725f5269      	clr	21097
 143                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 145  0074 725f526a      	clr	21098
 146                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 148  0078 725f526b      	clr	21099
 149                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 151  007c 725f526c      	clr	21100
 152                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 154  0080 725f526f      	clr	21103
 155                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 157  0084 35015257      	mov	21079,#1
 158                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 160  0088 725f526e      	clr	21102
 161                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 163  008c 725f526d      	clr	21101
 164                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 166  0090 725f5264      	clr	21092
 167                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 169  0094 725f5255      	clr	21077
 170                     ; 101 }
 173  0098 81            	ret	
 276                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 276                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 276                     ; 113                        uint16_t TIM1_Period,
 276                     ; 114                        uint8_t TIM1_RepetitionCounter)
 276                     ; 115 {
 277                     .text:	section	.text,new
 278  0000               _TIM1_TimeBaseInit:
 280       fffffffe      OFST: set -2
 283                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 285                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 287  0000 7b04          	ld	a,(OFST+6,sp)
 288  0002 c75262        	ld	21090,a
 289                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 291  0005 7b05          	ld	a,(OFST+7,sp)
 292  0007 c75263        	ld	21091,a
 293                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 295  000a 9e            	ld	a,xh
 296  000b c75260        	ld	21088,a
 297                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 299  000e 9f            	ld	a,xl
 300  000f c75261        	ld	21089,a
 301                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 301                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 303  0012 c65250        	ld	a,21072
 304  0015 a48f          	and	a,#143
 305  0017 1a03          	or	a,(OFST+5,sp)
 306  0019 c75250        	ld	21072,a
 307                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 309  001c 7b06          	ld	a,(OFST+8,sp)
 310  001e c75264        	ld	21092,a
 311                     ; 133 }
 314  0021 81            	ret	
 597                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 597                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 597                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 597                     ; 157                   uint16_t TIM1_Pulse,
 597                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 597                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 597                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 597                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 597                     ; 162 {
 598                     .text:	section	.text,new
 599  0000               _TIM1_OC1Init:
 601  0000 89            	pushw	x
 602  0001 5203          	subw	sp,#3
 603       00000003      OFST:	set	3
 606                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 608                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 610                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 612                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 614                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 616                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 618                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 620                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 620                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 622  0003 c6525c        	ld	a,21084
 623  0006 a4f0          	and	a,#240
 624  0008 c7525c        	ld	21084,a
 625                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 625                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 625                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 625                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 627  000b 7b0c          	ld	a,(OFST+9,sp)
 628  000d a408          	and	a,#8
 629  000f 6b03          	ld	(OFST+0,sp),a
 631  0011 7b0b          	ld	a,(OFST+8,sp)
 632  0013 a402          	and	a,#2
 633  0015 1a03          	or	a,(OFST+0,sp)
 634  0017 6b02          	ld	(OFST-1,sp),a
 636  0019 7b08          	ld	a,(OFST+5,sp)
 637  001b a404          	and	a,#4
 638  001d 6b01          	ld	(OFST-2,sp),a
 640  001f 9f            	ld	a,xl
 641  0020 a401          	and	a,#1
 642  0022 1a01          	or	a,(OFST-2,sp)
 643  0024 1a02          	or	a,(OFST-1,sp)
 644  0026 ca525c        	or	a,21084
 645  0029 c7525c        	ld	21084,a
 646                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 646                     ; 185                           (uint8_t)TIM1_OCMode);
 648  002c c65258        	ld	a,21080
 649  002f a48f          	and	a,#143
 650  0031 1a04          	or	a,(OFST+1,sp)
 651  0033 c75258        	ld	21080,a
 652                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 654  0036 c6526f        	ld	a,21103
 655  0039 a4fc          	and	a,#252
 656  003b c7526f        	ld	21103,a
 657                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 657                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 659  003e 7b0e          	ld	a,(OFST+11,sp)
 660  0040 a402          	and	a,#2
 661  0042 6b03          	ld	(OFST+0,sp),a
 663  0044 7b0d          	ld	a,(OFST+10,sp)
 664  0046 a401          	and	a,#1
 665  0048 1a03          	or	a,(OFST+0,sp)
 666  004a ca526f        	or	a,21103
 667  004d c7526f        	ld	21103,a
 668                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 670  0050 7b09          	ld	a,(OFST+6,sp)
 671  0052 c75265        	ld	21093,a
 672                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 674  0055 7b0a          	ld	a,(OFST+7,sp)
 675  0057 c75266        	ld	21094,a
 676                     ; 196 }
 679  005a 5b05          	addw	sp,#5
 680  005c 81            	ret	
 782                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 782                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 782                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 782                     ; 220                   uint16_t TIM1_Pulse,
 782                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 782                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 782                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 782                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 782                     ; 225 {
 783                     .text:	section	.text,new
 784  0000               _TIM1_OC2Init:
 786  0000 89            	pushw	x
 787  0001 5203          	subw	sp,#3
 788       00000003      OFST:	set	3
 791                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 793                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 795                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 797                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 799                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 801                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 803                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 805                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 805                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 807  0003 c6525c        	ld	a,21084
 808  0006 a40f          	and	a,#15
 809  0008 c7525c        	ld	21084,a
 810                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 810                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 810                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 810                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 812  000b 7b0c          	ld	a,(OFST+9,sp)
 813  000d a480          	and	a,#128
 814  000f 6b03          	ld	(OFST+0,sp),a
 816  0011 7b0b          	ld	a,(OFST+8,sp)
 817  0013 a420          	and	a,#32
 818  0015 1a03          	or	a,(OFST+0,sp)
 819  0017 6b02          	ld	(OFST-1,sp),a
 821  0019 7b08          	ld	a,(OFST+5,sp)
 822  001b a440          	and	a,#64
 823  001d 6b01          	ld	(OFST-2,sp),a
 825  001f 9f            	ld	a,xl
 826  0020 a410          	and	a,#16
 827  0022 1a01          	or	a,(OFST-2,sp)
 828  0024 1a02          	or	a,(OFST-1,sp)
 829  0026 ca525c        	or	a,21084
 830  0029 c7525c        	ld	21084,a
 831                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 831                     ; 249                           (uint8_t)TIM1_OCMode);
 833  002c c65259        	ld	a,21081
 834  002f a48f          	and	a,#143
 835  0031 1a04          	or	a,(OFST+1,sp)
 836  0033 c75259        	ld	21081,a
 837                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 839  0036 c6526f        	ld	a,21103
 840  0039 a4f3          	and	a,#243
 841  003b c7526f        	ld	21103,a
 842                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 842                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 844  003e 7b0e          	ld	a,(OFST+11,sp)
 845  0040 a408          	and	a,#8
 846  0042 6b03          	ld	(OFST+0,sp),a
 848  0044 7b0d          	ld	a,(OFST+10,sp)
 849  0046 a404          	and	a,#4
 850  0048 1a03          	or	a,(OFST+0,sp)
 851  004a ca526f        	or	a,21103
 852  004d c7526f        	ld	21103,a
 853                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 855  0050 7b09          	ld	a,(OFST+6,sp)
 856  0052 c75267        	ld	21095,a
 857                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 859  0055 7b0a          	ld	a,(OFST+7,sp)
 860  0057 c75268        	ld	21096,a
 861                     ; 260 }
 864  005a 5b05          	addw	sp,#5
 865  005c 81            	ret	
 967                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 967                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
 967                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 967                     ; 284                   uint16_t TIM1_Pulse,
 967                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 967                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 967                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 967                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 967                     ; 289 {
 968                     .text:	section	.text,new
 969  0000               _TIM1_OC3Init:
 971  0000 89            	pushw	x
 972  0001 5203          	subw	sp,#3
 973       00000003      OFST:	set	3
 976                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 978                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 980                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 982                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 984                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 986                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 988                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 990                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 990                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 992  0003 c6525d        	ld	a,21085
 993  0006 a4f0          	and	a,#240
 994  0008 c7525d        	ld	21085,a
 995                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 995                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 995                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 995                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 997  000b 7b0c          	ld	a,(OFST+9,sp)
 998  000d a408          	and	a,#8
 999  000f 6b03          	ld	(OFST+0,sp),a
1001  0011 7b0b          	ld	a,(OFST+8,sp)
1002  0013 a402          	and	a,#2
1003  0015 1a03          	or	a,(OFST+0,sp)
1004  0017 6b02          	ld	(OFST-1,sp),a
1006  0019 7b08          	ld	a,(OFST+5,sp)
1007  001b a404          	and	a,#4
1008  001d 6b01          	ld	(OFST-2,sp),a
1010  001f 9f            	ld	a,xl
1011  0020 a401          	and	a,#1
1012  0022 1a01          	or	a,(OFST-2,sp)
1013  0024 1a02          	or	a,(OFST-1,sp)
1014  0026 ca525d        	or	a,21085
1015  0029 c7525d        	ld	21085,a
1016                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1016                     ; 312                           (uint8_t)TIM1_OCMode);
1018  002c c6525a        	ld	a,21082
1019  002f a48f          	and	a,#143
1020  0031 1a04          	or	a,(OFST+1,sp)
1021  0033 c7525a        	ld	21082,a
1022                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1024  0036 c6526f        	ld	a,21103
1025  0039 a4cf          	and	a,#207
1026  003b c7526f        	ld	21103,a
1027                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1027                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1029  003e 7b0e          	ld	a,(OFST+11,sp)
1030  0040 a420          	and	a,#32
1031  0042 6b03          	ld	(OFST+0,sp),a
1033  0044 7b0d          	ld	a,(OFST+10,sp)
1034  0046 a410          	and	a,#16
1035  0048 1a03          	or	a,(OFST+0,sp)
1036  004a ca526f        	or	a,21103
1037  004d c7526f        	ld	21103,a
1038                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1040  0050 7b09          	ld	a,(OFST+6,sp)
1041  0052 c75269        	ld	21097,a
1042                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1044  0055 7b0a          	ld	a,(OFST+7,sp)
1045  0057 c7526a        	ld	21098,a
1046                     ; 323 }
1049  005a 5b05          	addw	sp,#5
1050  005c 81            	ret	
1122                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1122                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1122                     ; 340                   uint16_t TIM1_Pulse,
1122                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1122                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1122                     ; 343 {
1123                     .text:	section	.text,new
1124  0000               _TIM1_OC4Init:
1126  0000 89            	pushw	x
1127  0001 88            	push	a
1128       00000001      OFST:	set	1
1131                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1133                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1135                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1137                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1139                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1141  0002 c6525d        	ld	a,21085
1142  0005 a4cf          	and	a,#207
1143  0007 c7525d        	ld	21085,a
1144                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1144                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1146  000a 7b08          	ld	a,(OFST+7,sp)
1147  000c a420          	and	a,#32
1148  000e 6b01          	ld	(OFST+0,sp),a
1150  0010 9f            	ld	a,xl
1151  0011 a410          	and	a,#16
1152  0013 1a01          	or	a,(OFST+0,sp)
1153  0015 ca525d        	or	a,21085
1154  0018 c7525d        	ld	21085,a
1155                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1155                     ; 358                           TIM1_OCMode);
1157  001b c6525b        	ld	a,21083
1158  001e a48f          	and	a,#143
1159  0020 1a02          	or	a,(OFST+1,sp)
1160  0022 c7525b        	ld	21083,a
1161                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1163  0025 7b09          	ld	a,(OFST+8,sp)
1164  0027 270a          	jreq	L714
1165                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1167  0029 c6526f        	ld	a,21103
1168  002c aadf          	or	a,#223
1169  002e c7526f        	ld	21103,a
1171  0031 2004          	jra	L124
1172  0033               L714:
1173                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1175  0033 721d526f      	bres	21103,#6
1176  0037               L124:
1177                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1179  0037 7b06          	ld	a,(OFST+5,sp)
1180  0039 c7526b        	ld	21099,a
1181                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1183  003c 7b07          	ld	a,(OFST+6,sp)
1184  003e c7526c        	ld	21100,a
1185                     ; 373 }
1188  0041 5b03          	addw	sp,#3
1189  0043 81            	ret	
1392                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1392                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1392                     ; 390                      uint8_t TIM1_DeadTime,
1392                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1392                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1392                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1392                     ; 394 {
1393                     .text:	section	.text,new
1394  0000               _TIM1_BDTRConfig:
1396  0000 89            	pushw	x
1397  0001 88            	push	a
1398       00000001      OFST:	set	1
1401                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1403                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1405                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1407                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1409                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1411                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1413  0002 7b06          	ld	a,(OFST+5,sp)
1414  0004 c7526e        	ld	21102,a
1415                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1415                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1415                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
1417  0007 7b07          	ld	a,(OFST+6,sp)
1418  0009 1a08          	or	a,(OFST+7,sp)
1419  000b 1a09          	or	a,(OFST+8,sp)
1420  000d 6b01          	ld	(OFST+0,sp),a
1422  000f 9f            	ld	a,xl
1423  0010 1a02          	or	a,(OFST+1,sp)
1424  0012 1a01          	or	a,(OFST+0,sp)
1425  0014 c7526d        	ld	21101,a
1426                     ; 409 }
1429  0017 5b03          	addw	sp,#3
1430  0019 81            	ret	
1630                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1630                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1630                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1630                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1630                     ; 427                  uint8_t TIM1_ICFilter)
1630                     ; 428 {
1631                     .text:	section	.text,new
1632  0000               _TIM1_ICInit:
1634  0000 89            	pushw	x
1635       00000000      OFST:	set	0
1638                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1640                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1642                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1644                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1646                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1648                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
1650  0001 9e            	ld	a,xh
1651  0002 4d            	tnz	a
1652  0003 2614          	jrne	L546
1653                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
1653                     ; 440                (uint8_t)TIM1_ICSelection,
1653                     ; 441                (uint8_t)TIM1_ICFilter);
1655  0005 7b07          	ld	a,(OFST+7,sp)
1656  0007 88            	push	a
1657  0008 7b06          	ld	a,(OFST+6,sp)
1658  000a 97            	ld	xl,a
1659  000b 7b03          	ld	a,(OFST+3,sp)
1660  000d 95            	ld	xh,a
1661  000e cd0000        	call	L3_TI1_Config
1663  0011 84            	pop	a
1664                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1666  0012 7b06          	ld	a,(OFST+6,sp)
1667  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1670  0017 2044          	jra	L746
1671  0019               L546:
1672                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
1674  0019 7b01          	ld	a,(OFST+1,sp)
1675  001b a101          	cp	a,#1
1676  001d 2614          	jrne	L156
1677                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
1677                     ; 449                (uint8_t)TIM1_ICSelection,
1677                     ; 450                (uint8_t)TIM1_ICFilter);
1679  001f 7b07          	ld	a,(OFST+7,sp)
1680  0021 88            	push	a
1681  0022 7b06          	ld	a,(OFST+6,sp)
1682  0024 97            	ld	xl,a
1683  0025 7b03          	ld	a,(OFST+3,sp)
1684  0027 95            	ld	xh,a
1685  0028 cd0000        	call	L5_TI2_Config
1687  002b 84            	pop	a
1688                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1690  002c 7b06          	ld	a,(OFST+6,sp)
1691  002e cd0000        	call	_TIM1_SetIC2Prescaler
1694  0031 202a          	jra	L746
1695  0033               L156:
1696                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
1698  0033 a102          	cp	a,#2
1699  0035 2614          	jrne	L556
1700                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
1700                     ; 458                (uint8_t)TIM1_ICSelection,
1700                     ; 459                (uint8_t)TIM1_ICFilter);
1702  0037 7b07          	ld	a,(OFST+7,sp)
1703  0039 88            	push	a
1704  003a 7b06          	ld	a,(OFST+6,sp)
1705  003c 97            	ld	xl,a
1706  003d 7b03          	ld	a,(OFST+3,sp)
1707  003f 95            	ld	xh,a
1708  0040 cd0000        	call	L7_TI3_Config
1710  0043 84            	pop	a
1711                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1713  0044 7b06          	ld	a,(OFST+6,sp)
1714  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1717  0049 2012          	jra	L746
1718  004b               L556:
1719                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
1719                     ; 467                (uint8_t)TIM1_ICSelection,
1719                     ; 468                (uint8_t)TIM1_ICFilter);
1721  004b 7b07          	ld	a,(OFST+7,sp)
1722  004d 88            	push	a
1723  004e 7b06          	ld	a,(OFST+6,sp)
1724  0050 97            	ld	xl,a
1725  0051 7b03          	ld	a,(OFST+3,sp)
1726  0053 95            	ld	xh,a
1727  0054 cd0000        	call	L11_TI4_Config
1729  0057 84            	pop	a
1730                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1732  0058 7b06          	ld	a,(OFST+6,sp)
1733  005a cd0000        	call	_TIM1_SetIC4Prescaler
1735  005d               L746:
1736                     ; 472 }
1739  005d 85            	popw	x
1740  005e 81            	ret	
1830                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1830                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1830                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1830                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1830                     ; 492                      uint8_t TIM1_ICFilter)
1830                     ; 493 {
1831                     .text:	section	.text,new
1832  0000               _TIM1_PWMIConfig:
1834  0000 89            	pushw	x
1835  0001 89            	pushw	x
1836       00000002      OFST:	set	2
1839                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1841                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1843                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1845                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1847                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1849                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1851                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1853  0002 9f            	ld	a,xl
1854  0003 4a            	dec	a
1855  0004 2702          	jreq	L127
1856                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
1858  0006 a601          	ld	a,#1
1860  0008               L127:
1861                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
1863  0008 6b01          	ld	(OFST-1,sp),a
1865                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1867  000a 7b07          	ld	a,(OFST+5,sp)
1868  000c 4a            	dec	a
1869  000d 2604          	jrne	L527
1870                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
1872  000f a602          	ld	a,#2
1874  0011 2002          	jra	L727
1875  0013               L527:
1876                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
1878  0013 a601          	ld	a,#1
1879  0015               L727:
1880  0015 6b02          	ld	(OFST+0,sp),a
1882                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
1884  0017 7b03          	ld	a,(OFST+1,sp)
1885  0019 2626          	jrne	L137
1886                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1886                     ; 527                (uint8_t)TIM1_ICFilter);
1888  001b 7b09          	ld	a,(OFST+7,sp)
1889  001d 88            	push	a
1890  001e 7b08          	ld	a,(OFST+6,sp)
1891  0020 97            	ld	xl,a
1892  0021 7b05          	ld	a,(OFST+3,sp)
1893  0023 95            	ld	xh,a
1894  0024 cd0000        	call	L3_TI1_Config
1896  0027 84            	pop	a
1897                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1899  0028 7b08          	ld	a,(OFST+6,sp)
1900  002a cd0000        	call	_TIM1_SetIC1Prescaler
1902                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1904  002d 7b09          	ld	a,(OFST+7,sp)
1905  002f 88            	push	a
1906  0030 7b03          	ld	a,(OFST+1,sp)
1907  0032 97            	ld	xl,a
1908  0033 7b02          	ld	a,(OFST+0,sp)
1909  0035 95            	ld	xh,a
1910  0036 cd0000        	call	L5_TI2_Config
1912  0039 84            	pop	a
1913                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1915  003a 7b08          	ld	a,(OFST+6,sp)
1916  003c cd0000        	call	_TIM1_SetIC2Prescaler
1919  003f 2024          	jra	L337
1920  0041               L137:
1921                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1921                     ; 542                (uint8_t)TIM1_ICFilter);
1923  0041 7b09          	ld	a,(OFST+7,sp)
1924  0043 88            	push	a
1925  0044 7b08          	ld	a,(OFST+6,sp)
1926  0046 97            	ld	xl,a
1927  0047 7b05          	ld	a,(OFST+3,sp)
1928  0049 95            	ld	xh,a
1929  004a cd0000        	call	L5_TI2_Config
1931  004d 84            	pop	a
1932                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1934  004e 7b08          	ld	a,(OFST+6,sp)
1935  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1937                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1939  0053 7b09          	ld	a,(OFST+7,sp)
1940  0055 88            	push	a
1941  0056 7b03          	ld	a,(OFST+1,sp)
1942  0058 97            	ld	xl,a
1943  0059 7b02          	ld	a,(OFST+0,sp)
1944  005b 95            	ld	xh,a
1945  005c cd0000        	call	L3_TI1_Config
1947  005f 84            	pop	a
1948                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1950  0060 7b08          	ld	a,(OFST+6,sp)
1951  0062 cd0000        	call	_TIM1_SetIC1Prescaler
1953  0065               L337:
1954                     ; 553 }
1957  0065 5b04          	addw	sp,#4
1958  0067 81            	ret	
2013                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2013                     ; 562 {
2014                     .text:	section	.text,new
2015  0000               _TIM1_Cmd:
2019                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2021                     ; 567   if (NewState != DISABLE)
2023  0000 4d            	tnz	a
2024  0001 2705          	jreq	L367
2025                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2027  0003 72105250      	bset	21072,#0
2030  0007 81            	ret	
2031  0008               L367:
2032                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2034  0008 72115250      	bres	21072,#0
2035                     ; 575 }
2038  000c 81            	ret	
2074                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2074                     ; 584 {
2075                     .text:	section	.text,new
2076  0000               _TIM1_CtrlPWMOutputs:
2080                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2082                     ; 590   if (NewState != DISABLE)
2084  0000 4d            	tnz	a
2085  0001 2705          	jreq	L5001
2086                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2088  0003 721e526d      	bset	21101,#7
2091  0007 81            	ret	
2092  0008               L5001:
2093                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2095  0008 721f526d      	bres	21101,#7
2096                     ; 598 }
2099  000c 81            	ret	
2206                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2206                     ; 618 {
2207                     .text:	section	.text,new
2208  0000               _TIM1_ITConfig:
2210  0000 89            	pushw	x
2211       00000000      OFST:	set	0
2214                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
2216                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2218                     ; 623   if (NewState != DISABLE)
2220  0001 9f            	ld	a,xl
2221  0002 4d            	tnz	a
2222  0003 2706          	jreq	L7501
2223                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
2225  0005 9e            	ld	a,xh
2226  0006 ca5254        	or	a,21076
2228  0009 2006          	jra	L1601
2229  000b               L7501:
2230                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2232  000b 7b01          	ld	a,(OFST+1,sp)
2233  000d 43            	cpl	a
2234  000e c45254        	and	a,21076
2235  0011               L1601:
2236  0011 c75254        	ld	21076,a
2237                     ; 633 }
2240  0014 85            	popw	x
2241  0015 81            	ret	
2265                     ; 640 void TIM1_InternalClockConfig(void)
2265                     ; 641 {
2266                     .text:	section	.text,new
2267  0000               _TIM1_InternalClockConfig:
2271                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2273  0000 c65252        	ld	a,21074
2274  0003 a4f8          	and	a,#248
2275  0005 c75252        	ld	21074,a
2276                     ; 644 }
2279  0008 81            	ret	
2394                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2394                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2394                     ; 664                               uint8_t ExtTRGFilter)
2394                     ; 665 {
2395                     .text:	section	.text,new
2396  0000               _TIM1_ETRClockMode1Config:
2398  0000 89            	pushw	x
2399       00000000      OFST:	set	0
2402                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2404                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2406                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2408  0001 7b05          	ld	a,(OFST+5,sp)
2409  0003 88            	push	a
2410  0004 7b02          	ld	a,(OFST+2,sp)
2411  0006 95            	ld	xh,a
2412  0007 cd0000        	call	_TIM1_ETRConfig
2414  000a 84            	pop	a
2415                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2415                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2417  000b c65252        	ld	a,21074
2418  000e aa77          	or	a,#119
2419  0010 c75252        	ld	21074,a
2420                     ; 676 }
2423  0013 85            	popw	x
2424  0014 81            	ret	
2480                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2480                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2480                     ; 696                               uint8_t ExtTRGFilter)
2480                     ; 697 {
2481                     .text:	section	.text,new
2482  0000               _TIM1_ETRClockMode2Config:
2484  0000 89            	pushw	x
2485       00000000      OFST:	set	0
2488                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2490                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2492                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2494  0001 7b05          	ld	a,(OFST+5,sp)
2495  0003 88            	push	a
2496  0004 7b02          	ld	a,(OFST+2,sp)
2497  0006 95            	ld	xh,a
2498  0007 cd0000        	call	_TIM1_ETRConfig
2500  000a 721c5253      	bset	21075,#6
2501                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
2503                     ; 707 }
2506  000e 5b03          	addw	sp,#3
2507  0010 81            	ret	
2561                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2561                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2561                     ; 727                     uint8_t ExtTRGFilter)
2561                     ; 728 {
2562                     .text:	section	.text,new
2563  0000               _TIM1_ETRConfig:
2565  0000 89            	pushw	x
2566       00000000      OFST:	set	0
2569                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2571                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2571                     ; 733                          (uint8_t)ExtTRGFilter );
2573  0001 9f            	ld	a,xl
2574  0002 1a01          	or	a,(OFST+1,sp)
2575  0004 1a05          	or	a,(OFST+5,sp)
2576  0006 ca5253        	or	a,21075
2577  0009 c75253        	ld	21075,a
2578                     ; 734 }
2581  000c 85            	popw	x
2582  000d 81            	ret	
2669                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2669                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2669                     ; 753                                  uint8_t ICFilter)
2669                     ; 754 {
2670                     .text:	section	.text,new
2671  0000               _TIM1_TIxExternalClockConfig:
2673  0000 89            	pushw	x
2674       00000000      OFST:	set	0
2677                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2679                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2681                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2683                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2685  0001 9e            	ld	a,xh
2686  0002 a160          	cp	a,#96
2687  0004 260d          	jrne	L1521
2688                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2690  0006 7b05          	ld	a,(OFST+5,sp)
2691  0008 88            	push	a
2692  0009 9f            	ld	a,xl
2693  000a ae0001        	ldw	x,#1
2694  000d 95            	ld	xh,a
2695  000e cd0000        	call	L5_TI2_Config
2698  0011 200c          	jra	L3521
2699  0013               L1521:
2700                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2702  0013 7b05          	ld	a,(OFST+5,sp)
2703  0015 88            	push	a
2704  0016 7b03          	ld	a,(OFST+3,sp)
2705  0018 ae0001        	ldw	x,#1
2706  001b 95            	ld	xh,a
2707  001c cd0000        	call	L3_TI1_Config
2709  001f               L3521:
2710  001f 84            	pop	a
2711                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2713  0020 7b01          	ld	a,(OFST+1,sp)
2714  0022 cd0000        	call	_TIM1_SelectInputTrigger
2716                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2718  0025 c65252        	ld	a,21074
2719  0028 aa07          	or	a,#7
2720  002a c75252        	ld	21074,a
2721                     ; 775 }
2724  002d 85            	popw	x
2725  002e 81            	ret	
2810                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2810                     ; 788 {
2811                     .text:	section	.text,new
2812  0000               _TIM1_SelectInputTrigger:
2814  0000 88            	push	a
2815       00000000      OFST:	set	0
2818                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2820                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2822  0001 c65252        	ld	a,21074
2823  0004 a48f          	and	a,#143
2824  0006 1a01          	or	a,(OFST+1,sp)
2825  0008 c75252        	ld	21074,a
2826                     ; 794 }
2829  000b 84            	pop	a
2830  000c 81            	ret	
2866                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2866                     ; 804 {
2867                     .text:	section	.text,new
2868  0000               _TIM1_UpdateDisableConfig:
2872                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2874                     ; 809   if (NewState != DISABLE)
2876  0000 4d            	tnz	a
2877  0001 2705          	jreq	L1331
2878                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
2880  0003 72125250      	bset	21072,#1
2883  0007 81            	ret	
2884  0008               L1331:
2885                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2887  0008 72135250      	bres	21072,#1
2888                     ; 817 }
2891  000c 81            	ret	
2949                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2949                     ; 828 {
2950                     .text:	section	.text,new
2951  0000               _TIM1_UpdateRequestConfig:
2955                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2957                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2959  0000 4d            	tnz	a
2960  0001 2705          	jreq	L3631
2961                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
2963  0003 72145250      	bset	21072,#2
2966  0007 81            	ret	
2967  0008               L3631:
2968                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2970  0008 72155250      	bres	21072,#2
2971                     ; 841 }
2974  000c 81            	ret	
3010                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
3010                     ; 850 {
3011                     .text:	section	.text,new
3012  0000               _TIM1_SelectHallSensor:
3016                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3018                     ; 855   if (NewState != DISABLE)
3020  0000 4d            	tnz	a
3021  0001 2705          	jreq	L5041
3022                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
3024  0003 721e5251      	bset	21073,#7
3027  0007 81            	ret	
3028  0008               L5041:
3029                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3031  0008 721f5251      	bres	21073,#7
3032                     ; 863 }
3035  000c 81            	ret	
3092                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3092                     ; 874 {
3093                     .text:	section	.text,new
3094  0000               _TIM1_SelectOnePulseMode:
3098                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3100                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3102  0000 4d            	tnz	a
3103  0001 2705          	jreq	L7341
3104                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
3106  0003 72165250      	bset	21072,#3
3109  0007 81            	ret	
3110  0008               L7341:
3111                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3113  0008 72175250      	bres	21072,#3
3114                     ; 888 }
3117  000c 81            	ret	
3215                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3215                     ; 904 {
3216                     .text:	section	.text,new
3217  0000               _TIM1_SelectOutputTrigger:
3219  0000 88            	push	a
3220       00000000      OFST:	set	0
3223                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3225                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3225                     ; 910                         (uint8_t) TIM1_TRGOSource);
3227  0001 c65251        	ld	a,21073
3228  0004 a48f          	and	a,#143
3229  0006 1a01          	or	a,(OFST+1,sp)
3230  0008 c75251        	ld	21073,a
3231                     ; 911 }
3234  000b 84            	pop	a
3235  000c 81            	ret	
3309                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3309                     ; 924 {
3310                     .text:	section	.text,new
3311  0000               _TIM1_SelectSlaveMode:
3313  0000 88            	push	a
3314       00000000      OFST:	set	0
3317                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3319                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3319                     ; 930                          (uint8_t)TIM1_SlaveMode);
3321  0001 c65252        	ld	a,21074
3322  0004 a4f8          	and	a,#248
3323  0006 1a01          	or	a,(OFST+1,sp)
3324  0008 c75252        	ld	21074,a
3325                     ; 931 }
3328  000b 84            	pop	a
3329  000c 81            	ret	
3365                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3365                     ; 940 {
3366                     .text:	section	.text,new
3367  0000               _TIM1_SelectMasterSlaveMode:
3371                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3373                     ; 945   if (NewState != DISABLE)
3375  0000 4d            	tnz	a
3376  0001 2705          	jreq	L3551
3377                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
3379  0003 721e5252      	bset	21074,#7
3382  0007 81            	ret	
3383  0008               L3551:
3384                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3386  0008 721f5252      	bres	21074,#7
3387                     ; 953 }
3390  000c 81            	ret	
3476                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3476                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3476                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3476                     ; 978 {
3477                     .text:	section	.text,new
3478  0000               _TIM1_EncoderInterfaceConfig:
3480  0000 89            	pushw	x
3481       00000000      OFST:	set	0
3484                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3486                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3488                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3490                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3492  0001 9f            	ld	a,xl
3493  0002 4d            	tnz	a
3494  0003 2706          	jreq	L7161
3495                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3497  0005 7212525c      	bset	21084,#1
3499  0009 2004          	jra	L1261
3500  000b               L7161:
3501                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3503  000b 7213525c      	bres	21084,#1
3504  000f               L1261:
3505                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3507  000f 7b05          	ld	a,(OFST+5,sp)
3508  0011 2706          	jreq	L3261
3509                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3511  0013 721a525c      	bset	21084,#5
3513  0017 2004          	jra	L5261
3514  0019               L3261:
3515                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3517  0019 721b525c      	bres	21084,#5
3518  001d               L5261:
3519                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3519                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
3521  001d c65252        	ld	a,21074
3522  0020 a4f0          	and	a,#240
3523  0022 1a01          	or	a,(OFST+1,sp)
3524  0024 c75252        	ld	21074,a
3525                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3525                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
3527  0027 c65258        	ld	a,21080
3528  002a a4fc          	and	a,#252
3529  002c aa01          	or	a,#1
3530  002e c75258        	ld	21080,a
3531                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3531                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
3533  0031 c65259        	ld	a,21081
3534  0034 a4fc          	and	a,#252
3535  0036 aa01          	or	a,#1
3536  0038 c75259        	ld	21081,a
3537                     ; 1011 }
3540  003b 85            	popw	x
3541  003c 81            	ret	
3606                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
3606                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3606                     ; 1025 {
3607                     .text:	section	.text,new
3608  0000               _TIM1_PrescalerConfig:
3610       fffffffe      OFST: set -2
3613                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3615                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3617  0000 9e            	ld	a,xh
3618  0001 c75260        	ld	21088,a
3619                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
3621  0004 9f            	ld	a,xl
3622  0005 c75261        	ld	21089,a
3623                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3625  0008 7b03          	ld	a,(OFST+5,sp)
3626  000a c75257        	ld	21079,a
3627                     ; 1035 }
3630  000d 81            	ret	
3666                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3666                     ; 1049 {
3667                     .text:	section	.text,new
3668  0000               _TIM1_CounterModeConfig:
3670  0000 88            	push	a
3671       00000000      OFST:	set	0
3674                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3676                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3676                     ; 1056                         | (uint8_t)TIM1_CounterMode);
3678  0001 c65250        	ld	a,21072
3679  0004 a48f          	and	a,#143
3680  0006 1a01          	or	a,(OFST+1,sp)
3681  0008 c75250        	ld	21072,a
3682                     ; 1057 }
3685  000b 84            	pop	a
3686  000c 81            	ret	
3744                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3744                     ; 1068 {
3745                     .text:	section	.text,new
3746  0000               _TIM1_ForcedOC1Config:
3748  0000 88            	push	a
3749       00000000      OFST:	set	0
3752                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3754                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3754                     ; 1074                            (uint8_t)TIM1_ForcedAction);
3756  0001 c65258        	ld	a,21080
3757  0004 a48f          	and	a,#143
3758  0006 1a01          	or	a,(OFST+1,sp)
3759  0008 c75258        	ld	21080,a
3760                     ; 1075 }
3763  000b 84            	pop	a
3764  000c 81            	ret	
3800                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3800                     ; 1086 {
3801                     .text:	section	.text,new
3802  0000               _TIM1_ForcedOC2Config:
3804  0000 88            	push	a
3805       00000000      OFST:	set	0
3808                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3810                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3810                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
3812  0001 c65259        	ld	a,21081
3813  0004 a48f          	and	a,#143
3814  0006 1a01          	or	a,(OFST+1,sp)
3815  0008 c75259        	ld	21081,a
3816                     ; 1093 }
3819  000b 84            	pop	a
3820  000c 81            	ret	
3856                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3856                     ; 1105 {
3857                     .text:	section	.text,new
3858  0000               _TIM1_ForcedOC3Config:
3860  0000 88            	push	a
3861       00000000      OFST:	set	0
3864                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3866                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3866                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
3868  0001 c6525a        	ld	a,21082
3869  0004 a48f          	and	a,#143
3870  0006 1a01          	or	a,(OFST+1,sp)
3871  0008 c7525a        	ld	21082,a
3872                     ; 1112 }
3875  000b 84            	pop	a
3876  000c 81            	ret	
3912                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3912                     ; 1124 {
3913                     .text:	section	.text,new
3914  0000               _TIM1_ForcedOC4Config:
3916  0000 88            	push	a
3917       00000000      OFST:	set	0
3920                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3922                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3922                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
3924  0001 c6525b        	ld	a,21083
3925  0004 a48f          	and	a,#143
3926  0006 1a01          	or	a,(OFST+1,sp)
3927  0008 c7525b        	ld	21083,a
3928                     ; 1131 }
3931  000b 84            	pop	a
3932  000c 81            	ret	
3968                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3968                     ; 1140 {
3969                     .text:	section	.text,new
3970  0000               _TIM1_ARRPreloadConfig:
3974                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3976                     ; 1145   if (NewState != DISABLE)
3978  0000 4d            	tnz	a
3979  0001 2705          	jreq	L3102
3980                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
3982  0003 721e5250      	bset	21072,#7
3985  0007 81            	ret	
3986  0008               L3102:
3987                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
3989  0008 721f5250      	bres	21072,#7
3990                     ; 1153 }
3993  000c 81            	ret	
4028                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
4028                     ; 1162 {
4029                     .text:	section	.text,new
4030  0000               _TIM1_SelectCOM:
4034                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4036                     ; 1167   if (NewState != DISABLE)
4038  0000 4d            	tnz	a
4039  0001 2705          	jreq	L5302
4040                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
4042  0003 72145251      	bset	21073,#2
4045  0007 81            	ret	
4046  0008               L5302:
4047                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4049  0008 72155251      	bres	21073,#2
4050                     ; 1175 }
4053  000c 81            	ret	
4089                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
4089                     ; 1184 {
4090                     .text:	section	.text,new
4091  0000               _TIM1_CCPreloadControl:
4095                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4097                     ; 1189   if (NewState != DISABLE)
4099  0000 4d            	tnz	a
4100  0001 2705          	jreq	L7502
4101                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
4103  0003 72105251      	bset	21073,#0
4106  0007 81            	ret	
4107  0008               L7502:
4108                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4110  0008 72115251      	bres	21073,#0
4111                     ; 1197 }
4114  000c 81            	ret	
4150                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4150                     ; 1206 {
4151                     .text:	section	.text,new
4152  0000               _TIM1_OC1PreloadConfig:
4156                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4158                     ; 1211   if (NewState != DISABLE)
4160  0000 4d            	tnz	a
4161  0001 2705          	jreq	L1012
4162                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4164  0003 72165258      	bset	21080,#3
4167  0007 81            	ret	
4168  0008               L1012:
4169                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4171  0008 72175258      	bres	21080,#3
4172                     ; 1219 }
4175  000c 81            	ret	
4211                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4211                     ; 1228 {
4212                     .text:	section	.text,new
4213  0000               _TIM1_OC2PreloadConfig:
4217                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4219                     ; 1233   if (NewState != DISABLE)
4221  0000 4d            	tnz	a
4222  0001 2705          	jreq	L3212
4223                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4225  0003 72165259      	bset	21081,#3
4228  0007 81            	ret	
4229  0008               L3212:
4230                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4232  0008 72175259      	bres	21081,#3
4233                     ; 1241 }
4236  000c 81            	ret	
4272                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4272                     ; 1250 {
4273                     .text:	section	.text,new
4274  0000               _TIM1_OC3PreloadConfig:
4278                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4280                     ; 1255   if (NewState != DISABLE)
4282  0000 4d            	tnz	a
4283  0001 2705          	jreq	L5412
4284                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4286  0003 7216525a      	bset	21082,#3
4289  0007 81            	ret	
4290  0008               L5412:
4291                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4293  0008 7217525a      	bres	21082,#3
4294                     ; 1263 }
4297  000c 81            	ret	
4333                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4333                     ; 1272 {
4334                     .text:	section	.text,new
4335  0000               _TIM1_OC4PreloadConfig:
4339                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4341                     ; 1277   if (NewState != DISABLE)
4343  0000 4d            	tnz	a
4344  0001 2705          	jreq	L7612
4345                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4347  0003 7216525b      	bset	21083,#3
4350  0007 81            	ret	
4351  0008               L7612:
4352                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4354  0008 7217525b      	bres	21083,#3
4355                     ; 1285 }
4358  000c 81            	ret	
4393                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
4393                     ; 1294 {
4394                     .text:	section	.text,new
4395  0000               _TIM1_OC1FastConfig:
4399                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4401                     ; 1299   if (NewState != DISABLE)
4403  0000 4d            	tnz	a
4404  0001 2705          	jreq	L1122
4405                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4407  0003 72145258      	bset	21080,#2
4410  0007 81            	ret	
4411  0008               L1122:
4412                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4414  0008 72155258      	bres	21080,#2
4415                     ; 1307 }
4418  000c 81            	ret	
4453                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
4453                     ; 1316 {
4454                     .text:	section	.text,new
4455  0000               _TIM1_OC2FastConfig:
4459                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4461                     ; 1321   if (NewState != DISABLE)
4463  0000 4d            	tnz	a
4464  0001 2705          	jreq	L3322
4465                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4467  0003 72145259      	bset	21081,#2
4470  0007 81            	ret	
4471  0008               L3322:
4472                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4474  0008 72155259      	bres	21081,#2
4475                     ; 1329 }
4478  000c 81            	ret	
4513                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
4513                     ; 1338 {
4514                     .text:	section	.text,new
4515  0000               _TIM1_OC3FastConfig:
4519                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4521                     ; 1343   if (NewState != DISABLE)
4523  0000 4d            	tnz	a
4524  0001 2705          	jreq	L5522
4525                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4527  0003 7214525a      	bset	21082,#2
4530  0007 81            	ret	
4531  0008               L5522:
4532                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4534  0008 7215525a      	bres	21082,#2
4535                     ; 1351 }
4538  000c 81            	ret	
4573                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
4573                     ; 1360 {
4574                     .text:	section	.text,new
4575  0000               _TIM1_OC4FastConfig:
4579                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4581                     ; 1365   if (NewState != DISABLE)
4583  0000 4d            	tnz	a
4584  0001 2705          	jreq	L7722
4585                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4587  0003 7214525b      	bset	21083,#2
4590  0007 81            	ret	
4591  0008               L7722:
4592                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4594  0008 7215525b      	bres	21083,#2
4595                     ; 1373 }
4598  000c 81            	ret	
4703                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4703                     ; 1390 {
4704                     .text:	section	.text,new
4705  0000               _TIM1_GenerateEvent:
4709                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4711                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
4713  0000 c75257        	ld	21079,a
4714                     ; 1396 }
4717  0003 81            	ret	
4753                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4753                     ; 1407 {
4754                     .text:	section	.text,new
4755  0000               _TIM1_OC1PolarityConfig:
4759                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4761                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4763  0000 4d            	tnz	a
4764  0001 2705          	jreq	L3632
4765                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4767  0003 7212525c      	bset	21084,#1
4770  0007 81            	ret	
4771  0008               L3632:
4772                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4774  0008 7213525c      	bres	21084,#1
4775                     ; 1420 }
4778  000c 81            	ret	
4814                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4814                     ; 1431 {
4815                     .text:	section	.text,new
4816  0000               _TIM1_OC1NPolarityConfig:
4820                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4822                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4824  0000 4d            	tnz	a
4825  0001 2705          	jreq	L5042
4826                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4828  0003 7216525c      	bset	21084,#3
4831  0007 81            	ret	
4832  0008               L5042:
4833                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4835  0008 7217525c      	bres	21084,#3
4836                     ; 1444 }
4839  000c 81            	ret	
4875                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4875                     ; 1455 {
4876                     .text:	section	.text,new
4877  0000               _TIM1_OC2PolarityConfig:
4881                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4883                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4885  0000 4d            	tnz	a
4886  0001 2705          	jreq	L7242
4887                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4889  0003 721a525c      	bset	21084,#5
4892  0007 81            	ret	
4893  0008               L7242:
4894                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4896  0008 721b525c      	bres	21084,#5
4897                     ; 1468 }
4900  000c 81            	ret	
4936                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4936                     ; 1479 {
4937                     .text:	section	.text,new
4938  0000               _TIM1_OC2NPolarityConfig:
4942                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4944                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4946  0000 4d            	tnz	a
4947  0001 2705          	jreq	L1542
4948                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4950  0003 721e525c      	bset	21084,#7
4953  0007 81            	ret	
4954  0008               L1542:
4955                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4957  0008 721f525c      	bres	21084,#7
4958                     ; 1492 }
4961  000c 81            	ret	
4997                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4997                     ; 1503 {
4998                     .text:	section	.text,new
4999  0000               _TIM1_OC3PolarityConfig:
5003                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5005                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5007  0000 4d            	tnz	a
5008  0001 2705          	jreq	L3742
5009                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
5011  0003 7212525d      	bset	21085,#1
5014  0007 81            	ret	
5015  0008               L3742:
5016                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5018  0008 7213525d      	bres	21085,#1
5019                     ; 1516 }
5022  000c 81            	ret	
5058                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5058                     ; 1528 {
5059                     .text:	section	.text,new
5060  0000               _TIM1_OC3NPolarityConfig:
5064                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5066                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5068  0000 4d            	tnz	a
5069  0001 2705          	jreq	L5152
5070                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5072  0003 7216525d      	bset	21085,#3
5075  0007 81            	ret	
5076  0008               L5152:
5077                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5079  0008 7217525d      	bres	21085,#3
5080                     ; 1541 }
5083  000c 81            	ret	
5119                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5119                     ; 1552 {
5120                     .text:	section	.text,new
5121  0000               _TIM1_OC4PolarityConfig:
5125                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5127                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5129  0000 4d            	tnz	a
5130  0001 2705          	jreq	L7352
5131                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
5133  0003 721a525d      	bset	21085,#5
5136  0007 81            	ret	
5137  0008               L7352:
5138                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5140  0008 721b525d      	bres	21085,#5
5141                     ; 1565 }
5144  000c 81            	ret	
5189                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5189                     ; 1580 {
5190                     .text:	section	.text,new
5191  0000               _TIM1_CCxCmd:
5193  0000 89            	pushw	x
5194       00000000      OFST:	set	0
5197                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5199                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5201                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
5203  0001 9e            	ld	a,xh
5204  0002 4d            	tnz	a
5205  0003 2610          	jrne	L5652
5206                     ; 1588     if (NewState != DISABLE)
5208  0005 9f            	ld	a,xl
5209  0006 4d            	tnz	a
5210  0007 2706          	jreq	L7652
5211                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
5213  0009 7210525c      	bset	21084,#0
5215  000d 203e          	jra	L3752
5216  000f               L7652:
5217                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5219  000f 7211525c      	bres	21084,#0
5220  0013 2038          	jra	L3752
5221  0015               L5652:
5222                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
5224  0015 7b01          	ld	a,(OFST+1,sp)
5225  0017 a101          	cp	a,#1
5226  0019 2610          	jrne	L5752
5227                     ; 1601     if (NewState != DISABLE)
5229  001b 7b02          	ld	a,(OFST+2,sp)
5230  001d 2706          	jreq	L7752
5231                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
5233  001f 7218525c      	bset	21084,#4
5235  0023 2028          	jra	L3752
5236  0025               L7752:
5237                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5239  0025 7219525c      	bres	21084,#4
5240  0029 2022          	jra	L3752
5241  002b               L5752:
5242                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
5244  002b a102          	cp	a,#2
5245  002d 2610          	jrne	L5062
5246                     ; 1613     if (NewState != DISABLE)
5248  002f 7b02          	ld	a,(OFST+2,sp)
5249  0031 2706          	jreq	L7062
5250                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
5252  0033 7210525d      	bset	21085,#0
5254  0037 2014          	jra	L3752
5255  0039               L7062:
5256                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5258  0039 7211525d      	bres	21085,#0
5259  003d 200e          	jra	L3752
5260  003f               L5062:
5261                     ; 1625     if (NewState != DISABLE)
5263  003f 7b02          	ld	a,(OFST+2,sp)
5264  0041 2706          	jreq	L5162
5265                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
5267  0043 7218525d      	bset	21085,#4
5269  0047 2004          	jra	L3752
5270  0049               L5162:
5271                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5273  0049 7219525d      	bres	21085,#4
5274  004d               L3752:
5275                     ; 1634 }
5278  004d 85            	popw	x
5279  004e 81            	ret	
5324                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5324                     ; 1648 {
5325                     .text:	section	.text,new
5326  0000               _TIM1_CCxNCmd:
5328  0000 89            	pushw	x
5329       00000000      OFST:	set	0
5332                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5334                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5336                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
5338  0001 9e            	ld	a,xh
5339  0002 4d            	tnz	a
5340  0003 2610          	jrne	L3462
5341                     ; 1656     if (NewState != DISABLE)
5343  0005 9f            	ld	a,xl
5344  0006 4d            	tnz	a
5345  0007 2706          	jreq	L5462
5346                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5348  0009 7214525c      	bset	21084,#2
5350  000d 2029          	jra	L1562
5351  000f               L5462:
5352                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5354  000f 7215525c      	bres	21084,#2
5355  0013 2023          	jra	L1562
5356  0015               L3462:
5357                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
5359  0015 7b01          	ld	a,(OFST+1,sp)
5360  0017 4a            	dec	a
5361  0018 2610          	jrne	L3562
5362                     ; 1668     if (NewState != DISABLE)
5364  001a 7b02          	ld	a,(OFST+2,sp)
5365  001c 2706          	jreq	L5562
5366                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5368  001e 721c525c      	bset	21084,#6
5370  0022 2014          	jra	L1562
5371  0024               L5562:
5372                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5374  0024 721d525c      	bres	21084,#6
5375  0028 200e          	jra	L1562
5376  002a               L3562:
5377                     ; 1680     if (NewState != DISABLE)
5379  002a 7b02          	ld	a,(OFST+2,sp)
5380  002c 2706          	jreq	L3662
5381                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5383  002e 7214525d      	bset	21085,#2
5385  0032 2004          	jra	L1562
5386  0034               L3662:
5387                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5389  0034 7215525d      	bres	21085,#2
5390  0038               L1562:
5391                     ; 1689 }
5394  0038 85            	popw	x
5395  0039 81            	ret	
5440                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5440                     ; 1713 {
5441                     .text:	section	.text,new
5442  0000               _TIM1_SelectOCxM:
5444  0000 89            	pushw	x
5445       00000000      OFST:	set	0
5448                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5450                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5452                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
5454  0001 9e            	ld	a,xh
5455  0002 4d            	tnz	a
5456  0003 2610          	jrne	L1172
5457                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5459  0005 7211525c      	bres	21084,#0
5460                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5460                     ; 1725                             | (uint8_t)TIM1_OCMode);
5462  0009 c65258        	ld	a,21080
5463  000c a48f          	and	a,#143
5464  000e 1a02          	or	a,(OFST+2,sp)
5465  0010 c75258        	ld	21080,a
5467  0013 2038          	jra	L3172
5468  0015               L1172:
5469                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
5471  0015 7b01          	ld	a,(OFST+1,sp)
5472  0017 a101          	cp	a,#1
5473  0019 2610          	jrne	L5172
5474                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5476  001b 7219525c      	bres	21084,#4
5477                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5477                     ; 1734                             | (uint8_t)TIM1_OCMode);
5479  001f c65259        	ld	a,21081
5480  0022 a48f          	and	a,#143
5481  0024 1a02          	or	a,(OFST+2,sp)
5482  0026 c75259        	ld	21081,a
5484  0029 2022          	jra	L3172
5485  002b               L5172:
5486                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
5488  002b a102          	cp	a,#2
5489  002d 2610          	jrne	L1272
5490                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5492  002f 7211525d      	bres	21085,#0
5493                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5493                     ; 1743                             | (uint8_t)TIM1_OCMode);
5495  0033 c6525a        	ld	a,21082
5496  0036 a48f          	and	a,#143
5497  0038 1a02          	or	a,(OFST+2,sp)
5498  003a c7525a        	ld	21082,a
5500  003d 200e          	jra	L3172
5501  003f               L1272:
5502                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5504  003f 7219525d      	bres	21085,#4
5505                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5505                     ; 1752                             | (uint8_t)TIM1_OCMode);
5507  0043 c6525b        	ld	a,21083
5508  0046 a48f          	and	a,#143
5509  0048 1a02          	or	a,(OFST+2,sp)
5510  004a c7525b        	ld	21083,a
5511  004d               L3172:
5512                     ; 1754 }
5515  004d 85            	popw	x
5516  004e 81            	ret	
5548                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
5548                     ; 1763 {
5549                     .text:	section	.text,new
5550  0000               _TIM1_SetCounter:
5554                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
5556  0000 9e            	ld	a,xh
5557  0001 c7525e        	ld	21086,a
5558                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
5560  0004 9f            	ld	a,xl
5561  0005 c7525f        	ld	21087,a
5562                     ; 1767 }
5565  0008 81            	ret	
5597                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
5597                     ; 1776 {
5598                     .text:	section	.text,new
5599  0000               _TIM1_SetAutoreload:
5603                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5605  0000 9e            	ld	a,xh
5606  0001 c75262        	ld	21090,a
5607                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
5609  0004 9f            	ld	a,xl
5610  0005 c75263        	ld	21091,a
5611                     ; 1780  }
5614  0008 81            	ret	
5646                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
5646                     ; 1789 {
5647                     .text:	section	.text,new
5648  0000               _TIM1_SetCompare1:
5652                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5654  0000 9e            	ld	a,xh
5655  0001 c75265        	ld	21093,a
5656                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
5658  0004 9f            	ld	a,xl
5659  0005 c75266        	ld	21094,a
5660                     ; 1793 }
5663  0008 81            	ret	
5695                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
5695                     ; 1802 {
5696                     .text:	section	.text,new
5697  0000               _TIM1_SetCompare2:
5701                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5703  0000 9e            	ld	a,xh
5704  0001 c75267        	ld	21095,a
5705                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
5707  0004 9f            	ld	a,xl
5708  0005 c75268        	ld	21096,a
5709                     ; 1806 }
5712  0008 81            	ret	
5744                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
5744                     ; 1815 {
5745                     .text:	section	.text,new
5746  0000               _TIM1_SetCompare3:
5750                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5752  0000 9e            	ld	a,xh
5753  0001 c75269        	ld	21097,a
5754                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
5756  0004 9f            	ld	a,xl
5757  0005 c7526a        	ld	21098,a
5758                     ; 1819 }
5761  0008 81            	ret	
5793                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
5793                     ; 1828 {
5794                     .text:	section	.text,new
5795  0000               _TIM1_SetCompare4:
5799                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5801  0000 9e            	ld	a,xh
5802  0001 c7526b        	ld	21099,a
5803                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
5805  0004 9f            	ld	a,xl
5806  0005 c7526c        	ld	21100,a
5807                     ; 1832 }
5810  0008 81            	ret	
5846                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5846                     ; 1845 {
5847                     .text:	section	.text,new
5848  0000               _TIM1_SetIC1Prescaler:
5850  0000 88            	push	a
5851       00000000      OFST:	set	0
5854                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5856                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5856                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
5858  0001 c65258        	ld	a,21080
5859  0004 a4f3          	and	a,#243
5860  0006 1a01          	or	a,(OFST+1,sp)
5861  0008 c75258        	ld	21080,a
5862                     ; 1852 }
5865  000b 84            	pop	a
5866  000c 81            	ret	
5902                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5902                     ; 1865 {
5903                     .text:	section	.text,new
5904  0000               _TIM1_SetIC2Prescaler:
5906  0000 88            	push	a
5907       00000000      OFST:	set	0
5910                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5912                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5912                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
5914  0001 c65259        	ld	a,21081
5915  0004 a4f3          	and	a,#243
5916  0006 1a01          	or	a,(OFST+1,sp)
5917  0008 c75259        	ld	21081,a
5918                     ; 1873 }
5921  000b 84            	pop	a
5922  000c 81            	ret	
5958                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5958                     ; 1886 {
5959                     .text:	section	.text,new
5960  0000               _TIM1_SetIC3Prescaler:
5962  0000 88            	push	a
5963       00000000      OFST:	set	0
5966                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5968                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
5968                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
5970  0001 c6525a        	ld	a,21082
5971  0004 a4f3          	and	a,#243
5972  0006 1a01          	or	a,(OFST+1,sp)
5973  0008 c7525a        	ld	21082,a
5974                     ; 1894 }
5977  000b 84            	pop	a
5978  000c 81            	ret	
6014                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6014                     ; 1907 {
6015                     .text:	section	.text,new
6016  0000               _TIM1_SetIC4Prescaler:
6018  0000 88            	push	a
6019       00000000      OFST:	set	0
6022                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6024                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6024                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
6026  0001 c6525b        	ld	a,21083
6027  0004 a4f3          	and	a,#243
6028  0006 1a01          	or	a,(OFST+1,sp)
6029  0008 c7525b        	ld	21083,a
6030                     ; 1915 }
6033  000b 84            	pop	a
6034  000c 81            	ret	
6080                     ; 1922 uint16_t TIM1_GetCapture1(void)
6080                     ; 1923 {
6081                     .text:	section	.text,new
6082  0000               _TIM1_GetCapture1:
6084  0000 5204          	subw	sp,#4
6085       00000004      OFST:	set	4
6088                     ; 1926   uint16_t tmpccr1 = 0;
6090                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
6094                     ; 1929   tmpccr1h = TIM1->CCR1H;
6096  0002 c65265        	ld	a,21093
6097  0005 6b02          	ld	(OFST-2,sp),a
6099                     ; 1930   tmpccr1l = TIM1->CCR1L;
6101  0007 c65266        	ld	a,21094
6102  000a 6b01          	ld	(OFST-3,sp),a
6104                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
6106  000c 5f            	clrw	x
6107  000d 97            	ld	xl,a
6108  000e 1f03          	ldw	(OFST-1,sp),x
6110                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6112  0010 5f            	clrw	x
6113  0011 7b02          	ld	a,(OFST-2,sp)
6114  0013 97            	ld	xl,a
6115  0014 7b04          	ld	a,(OFST+0,sp)
6116  0016 01            	rrwa	x,a
6117  0017 1a03          	or	a,(OFST-1,sp)
6118  0019 01            	rrwa	x,a
6120                     ; 1935   return (uint16_t)tmpccr1;
6124  001a 5b04          	addw	sp,#4
6125  001c 81            	ret	
6171                     ; 1943 uint16_t TIM1_GetCapture2(void)
6171                     ; 1944 {
6172                     .text:	section	.text,new
6173  0000               _TIM1_GetCapture2:
6175  0000 5204          	subw	sp,#4
6176       00000004      OFST:	set	4
6179                     ; 1947   uint16_t tmpccr2 = 0;
6181                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
6185                     ; 1950   tmpccr2h = TIM1->CCR2H;
6187  0002 c65267        	ld	a,21095
6188  0005 6b02          	ld	(OFST-2,sp),a
6190                     ; 1951   tmpccr2l = TIM1->CCR2L;
6192  0007 c65268        	ld	a,21096
6193  000a 6b01          	ld	(OFST-3,sp),a
6195                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
6197  000c 5f            	clrw	x
6198  000d 97            	ld	xl,a
6199  000e 1f03          	ldw	(OFST-1,sp),x
6201                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6203  0010 5f            	clrw	x
6204  0011 7b02          	ld	a,(OFST-2,sp)
6205  0013 97            	ld	xl,a
6206  0014 7b04          	ld	a,(OFST+0,sp)
6207  0016 01            	rrwa	x,a
6208  0017 1a03          	or	a,(OFST-1,sp)
6209  0019 01            	rrwa	x,a
6211                     ; 1956   return (uint16_t)tmpccr2;
6215  001a 5b04          	addw	sp,#4
6216  001c 81            	ret	
6262                     ; 1964 uint16_t TIM1_GetCapture3(void)
6262                     ; 1965 {
6263                     .text:	section	.text,new
6264  0000               _TIM1_GetCapture3:
6266  0000 5204          	subw	sp,#4
6267       00000004      OFST:	set	4
6270                     ; 1967   uint16_t tmpccr3 = 0;
6272                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
6276                     ; 1970   tmpccr3h = TIM1->CCR3H;
6278  0002 c65269        	ld	a,21097
6279  0005 6b02          	ld	(OFST-2,sp),a
6281                     ; 1971   tmpccr3l = TIM1->CCR3L;
6283  0007 c6526a        	ld	a,21098
6284  000a 6b01          	ld	(OFST-3,sp),a
6286                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
6288  000c 5f            	clrw	x
6289  000d 97            	ld	xl,a
6290  000e 1f03          	ldw	(OFST-1,sp),x
6292                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6294  0010 5f            	clrw	x
6295  0011 7b02          	ld	a,(OFST-2,sp)
6296  0013 97            	ld	xl,a
6297  0014 7b04          	ld	a,(OFST+0,sp)
6298  0016 01            	rrwa	x,a
6299  0017 1a03          	or	a,(OFST-1,sp)
6300  0019 01            	rrwa	x,a
6302                     ; 1976   return (uint16_t)tmpccr3;
6306  001a 5b04          	addw	sp,#4
6307  001c 81            	ret	
6353                     ; 1984 uint16_t TIM1_GetCapture4(void)
6353                     ; 1985 {
6354                     .text:	section	.text,new
6355  0000               _TIM1_GetCapture4:
6357  0000 5204          	subw	sp,#4
6358       00000004      OFST:	set	4
6361                     ; 1987   uint16_t tmpccr4 = 0;
6363                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
6367                     ; 1990   tmpccr4h = TIM1->CCR4H;
6369  0002 c6526b        	ld	a,21099
6370  0005 6b02          	ld	(OFST-2,sp),a
6372                     ; 1991   tmpccr4l = TIM1->CCR4L;
6374  0007 c6526c        	ld	a,21100
6375  000a 6b01          	ld	(OFST-3,sp),a
6377                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
6379  000c 5f            	clrw	x
6380  000d 97            	ld	xl,a
6381  000e 1f03          	ldw	(OFST-1,sp),x
6383                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6385  0010 5f            	clrw	x
6386  0011 7b02          	ld	a,(OFST-2,sp)
6387  0013 97            	ld	xl,a
6388  0014 7b04          	ld	a,(OFST+0,sp)
6389  0016 01            	rrwa	x,a
6390  0017 1a03          	or	a,(OFST-1,sp)
6391  0019 01            	rrwa	x,a
6393                     ; 1996   return (uint16_t)tmpccr4;
6397  001a 5b04          	addw	sp,#4
6398  001c 81            	ret	
6430                     ; 2004 uint16_t TIM1_GetCounter(void)
6430                     ; 2005 {
6431                     .text:	section	.text,new
6432  0000               _TIM1_GetCounter:
6434  0000 89            	pushw	x
6435       00000002      OFST:	set	2
6438                     ; 2006   uint16_t tmpcntr = 0;
6440                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6442  0001 c6525e        	ld	a,21086
6443  0004 97            	ld	xl,a
6444  0005 4f            	clr	a
6445  0006 02            	rlwa	x,a
6446  0007 1f01          	ldw	(OFST-1,sp),x
6448                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6450  0009 c6525f        	ld	a,21087
6451  000c 5f            	clrw	x
6452  000d 97            	ld	xl,a
6453  000e 01            	rrwa	x,a
6454  000f 1a02          	or	a,(OFST+0,sp)
6455  0011 01            	rrwa	x,a
6456  0012 1a01          	or	a,(OFST-1,sp)
6457  0014 01            	rrwa	x,a
6460  0015 5b02          	addw	sp,#2
6461  0017 81            	ret	
6493                     ; 2019 uint16_t TIM1_GetPrescaler(void)
6493                     ; 2020 {
6494                     .text:	section	.text,new
6495  0000               _TIM1_GetPrescaler:
6497  0000 89            	pushw	x
6498       00000002      OFST:	set	2
6501                     ; 2021   uint16_t temp = 0;
6503                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
6505  0001 c65260        	ld	a,21088
6506  0004 97            	ld	xl,a
6507  0005 4f            	clr	a
6508  0006 02            	rlwa	x,a
6509  0007 1f01          	ldw	(OFST-1,sp),x
6511                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6513  0009 c65261        	ld	a,21089
6514  000c 5f            	clrw	x
6515  000d 97            	ld	xl,a
6516  000e 01            	rrwa	x,a
6517  000f 1a02          	or	a,(OFST+0,sp)
6518  0011 01            	rrwa	x,a
6519  0012 1a01          	or	a,(OFST-1,sp)
6520  0014 01            	rrwa	x,a
6523  0015 5b02          	addw	sp,#2
6524  0017 81            	ret	
6694                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6694                     ; 2048 {
6695                     .text:	section	.text,new
6696  0000               _TIM1_GetFlagStatus:
6698  0000 89            	pushw	x
6699  0001 89            	pushw	x
6700       00000002      OFST:	set	2
6703                     ; 2049   FlagStatus bitstatus = RESET;
6705                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6709                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6711                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6713  0002 9f            	ld	a,xl
6714  0003 c45255        	and	a,21077
6715  0006 6b01          	ld	(OFST-1,sp),a
6717                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6719  0008 7b03          	ld	a,(OFST+1,sp)
6720  000a 6b02          	ld	(OFST+0,sp),a
6722                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6724  000c c45256        	and	a,21078
6725  000f 1a01          	or	a,(OFST-1,sp)
6726  0011 2702          	jreq	L7433
6727                     ; 2060     bitstatus = SET;
6729  0013 a601          	ld	a,#1
6732  0015               L7433:
6733                     ; 2064     bitstatus = RESET;
6736                     ; 2066   return (FlagStatus)(bitstatus);
6740  0015 5b04          	addw	sp,#4
6741  0017 81            	ret	
6776                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6776                     ; 2088 {
6777                     .text:	section	.text,new
6778  0000               _TIM1_ClearFlag:
6780  0000 89            	pushw	x
6781       00000000      OFST:	set	0
6784                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6786                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6788  0001 9f            	ld	a,xl
6789  0002 43            	cpl	a
6790  0003 c75255        	ld	21077,a
6791                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6791                     ; 2095                         (uint8_t)0x1E);
6793  0006 7b01          	ld	a,(OFST+1,sp)
6794  0008 43            	cpl	a
6795  0009 a41e          	and	a,#30
6796  000b c75256        	ld	21078,a
6797                     ; 2096 }
6800  000e 85            	popw	x
6801  000f 81            	ret	
6861                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6861                     ; 2113 {
6862                     .text:	section	.text,new
6863  0000               _TIM1_GetITStatus:
6865  0000 88            	push	a
6866  0001 89            	pushw	x
6867       00000002      OFST:	set	2
6870                     ; 2114   ITStatus bitstatus = RESET;
6872                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6876                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6878                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6880  0002 c45255        	and	a,21077
6881  0005 6b01          	ld	(OFST-1,sp),a
6883                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6885  0007 c65254        	ld	a,21076
6886  000a 1403          	and	a,(OFST+1,sp)
6887  000c 6b02          	ld	(OFST+0,sp),a
6889                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6891  000e 7b01          	ld	a,(OFST-1,sp)
6892  0010 2708          	jreq	L7143
6894  0012 7b02          	ld	a,(OFST+0,sp)
6895  0014 2704          	jreq	L7143
6896                     ; 2126     bitstatus = SET;
6898  0016 a601          	ld	a,#1
6901  0018 2001          	jra	L1243
6902  001a               L7143:
6903                     ; 2130     bitstatus = RESET;
6905  001a 4f            	clr	a
6907  001b               L1243:
6908                     ; 2132   return (ITStatus)(bitstatus);
6912  001b 5b03          	addw	sp,#3
6913  001d 81            	ret	
6949                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6949                     ; 2150 {
6950                     .text:	section	.text,new
6951  0000               _TIM1_ClearITPendingBit:
6955                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
6957                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6959  0000 43            	cpl	a
6960  0001 c75255        	ld	21077,a
6961                     ; 2156 }
6964  0004 81            	ret	
7010                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
7010                     ; 2175                        uint8_t TIM1_ICSelection,
7010                     ; 2176                        uint8_t TIM1_ICFilter)
7010                     ; 2177 {
7011                     .text:	section	.text,new
7012  0000               L3_TI1_Config:
7014  0000 89            	pushw	x
7015  0001 88            	push	a
7016       00000001      OFST:	set	1
7019                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7021  0002 7211525c      	bres	21084,#0
7022                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7022                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7024  0006 7b06          	ld	a,(OFST+5,sp)
7025  0008 97            	ld	xl,a
7026  0009 a610          	ld	a,#16
7027  000b 42            	mul	x,a
7028  000c 9f            	ld	a,xl
7029  000d 1a03          	or	a,(OFST+2,sp)
7030  000f 6b01          	ld	(OFST+0,sp),a
7032  0011 c65258        	ld	a,21080
7033  0014 a40c          	and	a,#12
7034  0016 1a01          	or	a,(OFST+0,sp)
7035  0018 c75258        	ld	21080,a
7036                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7038  001b 7b02          	ld	a,(OFST+1,sp)
7039  001d 2706          	jreq	L1643
7040                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7042  001f 7212525c      	bset	21084,#1
7044  0023 2004          	jra	L3643
7045  0025               L1643:
7046                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7048  0025 7213525c      	bres	21084,#1
7049  0029               L3643:
7050                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7052  0029 7210525c      	bset	21084,#0
7053                     ; 2197 }
7056  002d 5b03          	addw	sp,#3
7057  002f 81            	ret	
7103                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
7103                     ; 2216                        uint8_t TIM1_ICSelection,
7103                     ; 2217                        uint8_t TIM1_ICFilter)
7103                     ; 2218 {
7104                     .text:	section	.text,new
7105  0000               L5_TI2_Config:
7107  0000 89            	pushw	x
7108  0001 88            	push	a
7109       00000001      OFST:	set	1
7112                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7114  0002 7219525c      	bres	21084,#4
7115                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7115                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7117  0006 7b06          	ld	a,(OFST+5,sp)
7118  0008 97            	ld	xl,a
7119  0009 a610          	ld	a,#16
7120  000b 42            	mul	x,a
7121  000c 9f            	ld	a,xl
7122  000d 1a03          	or	a,(OFST+2,sp)
7123  000f 6b01          	ld	(OFST+0,sp),a
7125  0011 c65259        	ld	a,21081
7126  0014 a40c          	and	a,#12
7127  0016 1a01          	or	a,(OFST+0,sp)
7128  0018 c75259        	ld	21081,a
7129                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7131  001b 7b02          	ld	a,(OFST+1,sp)
7132  001d 2706          	jreq	L5053
7133                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7135  001f 721a525c      	bset	21084,#5
7137  0023 2004          	jra	L7053
7138  0025               L5053:
7139                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7141  0025 721b525c      	bres	21084,#5
7142  0029               L7053:
7143                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7145  0029 7218525c      	bset	21084,#4
7146                     ; 2236 }
7149  002d 5b03          	addw	sp,#3
7150  002f 81            	ret	
7196                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
7196                     ; 2255                        uint8_t TIM1_ICSelection,
7196                     ; 2256                        uint8_t TIM1_ICFilter)
7196                     ; 2257 {
7197                     .text:	section	.text,new
7198  0000               L7_TI3_Config:
7200  0000 89            	pushw	x
7201  0001 88            	push	a
7202       00000001      OFST:	set	1
7205                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7207  0002 7211525d      	bres	21085,#0
7208                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7208                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7210  0006 7b06          	ld	a,(OFST+5,sp)
7211  0008 97            	ld	xl,a
7212  0009 a610          	ld	a,#16
7213  000b 42            	mul	x,a
7214  000c 9f            	ld	a,xl
7215  000d 1a03          	or	a,(OFST+2,sp)
7216  000f 6b01          	ld	(OFST+0,sp),a
7218  0011 c6525a        	ld	a,21082
7219  0014 a40c          	and	a,#12
7220  0016 1a01          	or	a,(OFST+0,sp)
7221  0018 c7525a        	ld	21082,a
7222                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7224  001b 7b02          	ld	a,(OFST+1,sp)
7225  001d 2706          	jreq	L1353
7226                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7228  001f 7212525d      	bset	21085,#1
7230  0023 2004          	jra	L3353
7231  0025               L1353:
7232                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7234  0025 7213525d      	bres	21085,#1
7235  0029               L3353:
7236                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7238  0029 7210525d      	bset	21085,#0
7239                     ; 2276 }
7242  002d 5b03          	addw	sp,#3
7243  002f 81            	ret	
7289                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
7289                     ; 2295                        uint8_t TIM1_ICSelection,
7289                     ; 2296                        uint8_t TIM1_ICFilter)
7289                     ; 2297 {
7290                     .text:	section	.text,new
7291  0000               L11_TI4_Config:
7293  0000 89            	pushw	x
7294  0001 88            	push	a
7295       00000001      OFST:	set	1
7298                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7300  0002 7219525d      	bres	21085,#4
7301                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7301                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7303  0006 7b06          	ld	a,(OFST+5,sp)
7304  0008 97            	ld	xl,a
7305  0009 a610          	ld	a,#16
7306  000b 42            	mul	x,a
7307  000c 9f            	ld	a,xl
7308  000d 1a03          	or	a,(OFST+2,sp)
7309  000f 6b01          	ld	(OFST+0,sp),a
7311  0011 c6525b        	ld	a,21083
7312  0014 a40c          	and	a,#12
7313  0016 1a01          	or	a,(OFST+0,sp)
7314  0018 c7525b        	ld	21083,a
7315                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7317  001b 7b02          	ld	a,(OFST+1,sp)
7318  001d 2706          	jreq	L5553
7319                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7321  001f 721a525d      	bset	21085,#5
7323  0023 2004          	jra	L7553
7324  0025               L5553:
7325                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7327  0025 721b525d      	bres	21085,#5
7328  0029               L7553:
7329                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7331  0029 7218525d      	bset	21085,#4
7332                     ; 2317 }
7335  002d 5b03          	addw	sp,#3
7336  002f 81            	ret	
7349                     	xdef	_TIM1_ClearITPendingBit
7350                     	xdef	_TIM1_GetITStatus
7351                     	xdef	_TIM1_ClearFlag
7352                     	xdef	_TIM1_GetFlagStatus
7353                     	xdef	_TIM1_GetPrescaler
7354                     	xdef	_TIM1_GetCounter
7355                     	xdef	_TIM1_GetCapture4
7356                     	xdef	_TIM1_GetCapture3
7357                     	xdef	_TIM1_GetCapture2
7358                     	xdef	_TIM1_GetCapture1
7359                     	xdef	_TIM1_SetIC4Prescaler
7360                     	xdef	_TIM1_SetIC3Prescaler
7361                     	xdef	_TIM1_SetIC2Prescaler
7362                     	xdef	_TIM1_SetIC1Prescaler
7363                     	xdef	_TIM1_SetCompare4
7364                     	xdef	_TIM1_SetCompare3
7365                     	xdef	_TIM1_SetCompare2
7366                     	xdef	_TIM1_SetCompare1
7367                     	xdef	_TIM1_SetAutoreload
7368                     	xdef	_TIM1_SetCounter
7369                     	xdef	_TIM1_SelectOCxM
7370                     	xdef	_TIM1_CCxNCmd
7371                     	xdef	_TIM1_CCxCmd
7372                     	xdef	_TIM1_OC4PolarityConfig
7373                     	xdef	_TIM1_OC3NPolarityConfig
7374                     	xdef	_TIM1_OC3PolarityConfig
7375                     	xdef	_TIM1_OC2NPolarityConfig
7376                     	xdef	_TIM1_OC2PolarityConfig
7377                     	xdef	_TIM1_OC1NPolarityConfig
7378                     	xdef	_TIM1_OC1PolarityConfig
7379                     	xdef	_TIM1_GenerateEvent
7380                     	xdef	_TIM1_OC4FastConfig
7381                     	xdef	_TIM1_OC3FastConfig
7382                     	xdef	_TIM1_OC2FastConfig
7383                     	xdef	_TIM1_OC1FastConfig
7384                     	xdef	_TIM1_OC4PreloadConfig
7385                     	xdef	_TIM1_OC3PreloadConfig
7386                     	xdef	_TIM1_OC2PreloadConfig
7387                     	xdef	_TIM1_OC1PreloadConfig
7388                     	xdef	_TIM1_CCPreloadControl
7389                     	xdef	_TIM1_SelectCOM
7390                     	xdef	_TIM1_ARRPreloadConfig
7391                     	xdef	_TIM1_ForcedOC4Config
7392                     	xdef	_TIM1_ForcedOC3Config
7393                     	xdef	_TIM1_ForcedOC2Config
7394                     	xdef	_TIM1_ForcedOC1Config
7395                     	xdef	_TIM1_CounterModeConfig
7396                     	xdef	_TIM1_PrescalerConfig
7397                     	xdef	_TIM1_EncoderInterfaceConfig
7398                     	xdef	_TIM1_SelectMasterSlaveMode
7399                     	xdef	_TIM1_SelectSlaveMode
7400                     	xdef	_TIM1_SelectOutputTrigger
7401                     	xdef	_TIM1_SelectOnePulseMode
7402                     	xdef	_TIM1_SelectHallSensor
7403                     	xdef	_TIM1_UpdateRequestConfig
7404                     	xdef	_TIM1_UpdateDisableConfig
7405                     	xdef	_TIM1_SelectInputTrigger
7406                     	xdef	_TIM1_TIxExternalClockConfig
7407                     	xdef	_TIM1_ETRConfig
7408                     	xdef	_TIM1_ETRClockMode2Config
7409                     	xdef	_TIM1_ETRClockMode1Config
7410                     	xdef	_TIM1_InternalClockConfig
7411                     	xdef	_TIM1_ITConfig
7412                     	xdef	_TIM1_CtrlPWMOutputs
7413                     	xdef	_TIM1_Cmd
7414                     	xdef	_TIM1_PWMIConfig
7415                     	xdef	_TIM1_ICInit
7416                     	xdef	_TIM1_BDTRConfig
7417                     	xdef	_TIM1_OC4Init
7418                     	xdef	_TIM1_OC3Init
7419                     	xdef	_TIM1_OC2Init
7420                     	xdef	_TIM1_OC1Init
7421                     	xdef	_TIM1_TimeBaseInit
7422                     	xdef	_TIM1_DeInit
7441                     	end
