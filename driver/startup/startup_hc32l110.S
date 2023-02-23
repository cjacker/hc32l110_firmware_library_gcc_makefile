  .syntax unified
  .cpu cortex-m4
  .fpu softvfp
  .thumb
  
.global  g_pfnVectors
.global  Default_Handler

/* start address for the initialization values of the .data section.
defined in linker script */
.word _sidata
/* start address for the .data section. defined in linker script */
.word _sdata
/* end address for the .data section. defined in linker script */
.word _edata
/* start address for the .bss section. defined in linker script */
.word _sbss
/* end address for the .bss section. defined in linker script */
.word _ebss

.section  .text.Reset_Handler
  .weak  Reset_Handler
  .type  Reset_Handler, %function
Reset_Handler:  

/* Copy the data segment initializers from flash to SRAM */  
  movs  r1, #0
  b  LoopCopyDataInit

CopyDataInit:
  ldr  r3, =_sidata
  ldr  r3, [r3, r1]
  str  r3, [r0, r1]
  adds  r1, r1, #4
    
LoopCopyDataInit:
  ldr  r0, =_sdata
  ldr  r3, =_edata
  adds  r2, r0, r1
  cmp  r2, r3
  bcc  CopyDataInit
  ldr  r2, =_sbss
  b  LoopFillZerobss
/* Zero fill the bss segment. */  
FillZerobss:
  movs  r3, #0
  str  r3, [r2]
  adds r2, r2, #4
    
LoopFillZerobss:
  ldr  r3, = _ebss
  cmp  r2, r3
  bcc  FillZerobss

/* Call the clock system initialization function.*/
  bl  SystemInit   
/* Call into static constructors (C++) */
  bl __libc_init_array
/* Call the application's entry point.*/
  bl  main
  bx  lr    
.size  Reset_Handler, .-Reset_Handler

/**
 * @brief  This is the code that gets called when the processor receives an 
 *         unexpected interrupt.  This simply enters an infinite loop, preserving
 *         the system state for examination by a debugger.
 * @param  None     
 * @retval None       
*/
    .section  .text.Default_Handler,"ax",%progbits
Default_Handler:
Infinite_Loop:
  b  Infinite_Loop
  .size  Default_Handler, .-Default_Handler
/******************************************************************************
*
* The minimal vector table for a Cortex M4. Note that the proper constructs
* must be placed on this to ensure that it ends up at physical address
* 0x0000.0000.
* 
*******************************************************************************/
   .section  .isr_vector,"a",%progbits
  .type  g_pfnVectors, %object
  .size  g_pfnVectors, .-g_pfnVectors

g_pfnVectors:
                .word     _estack                            /* Top of Stack */
                .word     Reset_Handler		/* Reset */
                .word     NMI_Handler		/* NMI */
                .word     HardFault_Handler		/* Hard Fault */
                .word     0		/* Reserved */
                .word     0		/* Reserved */
                .word     0		/* Reserved */
                .word     0		/* Reserved */
                .word     0		/* Reserved */
                .word     0		/* Reserved */
                .word     0		/* Reserved */
                .word     SVC_Handler		/* SVCall */
                .word     0		/* Reserved */
                .word     0		/* Reserved */
                .word     PendSV_Handler		/* PendSV */
                .word     SysTick_Handler		/* SysTick */
                .word     IRQ000_Handler		/*  */
                .word     IRQ001_Handler		/*  */
                .word     IRQ002_Handler		/*  */
                .word     IRQ003_Handler		/*  */
                .word     IRQ004_Handler		/*  */
                .word     IRQ005_Handler		/*  */
                .word     IRQ006_Handler		/*  */
                .word     IRQ007_Handler		/*  */
                .word     IRQ008_Handler		/*  */
                .word     IRQ009_Handler		/*  */
                .word     IRQ010_Handler		/*  */
                .word     IRQ011_Handler		/*  */
                .word     IRQ012_Handler		/*  */
                .word     IRQ013_Handler		/*  */
                .word     IRQ014_Handler		/*  */
                .word     IRQ015_Handler		/*  */
                .word     IRQ016_Handler		/*  */
                .word     IRQ017_Handler		/*  */
                .word     IRQ018_Handler		/*  */
                .word     IRQ019_Handler		/*  */
                .word     IRQ020_Handler		/*  */
                .word     IRQ021_Handler		/*  */
                .word     IRQ022_Handler		/*  */
                .word     IRQ023_Handler		/*  */
                .word     IRQ024_Handler		/*  */
                .word     IRQ025_Handler		/*  */
                .word     IRQ026_Handler		/*  */
                .word     IRQ027_Handler		/*  */
                .word     IRQ028_Handler		/*  */
                .word     IRQ029_Handler		/*  */
                .word     IRQ030_Handler		/*  */
                .word     IRQ031_Handler		/*  */

/*******************************************************************************
*
* Provide weak aliases for each Exception handler to the Default_Handler. 
* As they are weak aliases, any function with the same name will override 
* this definition.
*
*******************************************************************************/
.weak NMI_Handler
.thumb_set NMI_Handler,Default_Handler

.weak HardFault_Handler
.thumb_set HardFault_Handler,Default_Handler

.weak SVC_Handler
.thumb_set SVC_Handler,Default_Handler

.weak PendSV_Handler
.thumb_set PendSV_Handler,Default_Handler

.weak SysTick_Handler
.thumb_set SysTick_Handler,Default_Handler

.weak IRQ000_Handler
.thumb_set IRQ000_Handler,Default_Handler

.weak IRQ001_Handler
.thumb_set IRQ001_Handler,Default_Handler

.weak IRQ002_Handler
.thumb_set IRQ002_Handler,Default_Handler

.weak IRQ003_Handler
.thumb_set IRQ003_Handler,Default_Handler

.weak IRQ004_Handler
.thumb_set IRQ004_Handler,Default_Handler

.weak IRQ005_Handler
.thumb_set IRQ005_Handler,Default_Handler

.weak IRQ006_Handler
.thumb_set IRQ006_Handler,Default_Handler

.weak IRQ007_Handler
.thumb_set IRQ007_Handler,Default_Handler

.weak IRQ008_Handler
.thumb_set IRQ008_Handler,Default_Handler

.weak IRQ009_Handler
.thumb_set IRQ009_Handler,Default_Handler

.weak IRQ010_Handler
.thumb_set IRQ010_Handler,Default_Handler

.weak IRQ011_Handler
.thumb_set IRQ011_Handler,Default_Handler

.weak IRQ012_Handler
.thumb_set IRQ012_Handler,Default_Handler

.weak IRQ013_Handler
.thumb_set IRQ013_Handler,Default_Handler

.weak IRQ014_Handler
.thumb_set IRQ014_Handler,Default_Handler

.weak IRQ015_Handler
.thumb_set IRQ015_Handler,Default_Handler

.weak IRQ016_Handler
.thumb_set IRQ016_Handler,Default_Handler

.weak IRQ017_Handler
.thumb_set IRQ017_Handler,Default_Handler

.weak IRQ018_Handler
.thumb_set IRQ018_Handler,Default_Handler

.weak IRQ019_Handler
.thumb_set IRQ019_Handler,Default_Handler

.weak IRQ020_Handler
.thumb_set IRQ020_Handler,Default_Handler

.weak IRQ021_Handler
.thumb_set IRQ021_Handler,Default_Handler

.weak IRQ022_Handler
.thumb_set IRQ022_Handler,Default_Handler

.weak IRQ023_Handler
.thumb_set IRQ023_Handler,Default_Handler

.weak IRQ024_Handler
.thumb_set IRQ024_Handler,Default_Handler

.weak IRQ025_Handler
.thumb_set IRQ025_Handler,Default_Handler

.weak IRQ026_Handler
.thumb_set IRQ026_Handler,Default_Handler

.weak IRQ027_Handler
.thumb_set IRQ027_Handler,Default_Handler

.weak IRQ028_Handler
.thumb_set IRQ028_Handler,Default_Handler

.weak IRQ029_Handler
.thumb_set IRQ029_Handler,Default_Handler

.weak IRQ030_Handler
.thumb_set IRQ030_Handler,Default_Handler

.weak IRQ031_Handler
.thumb_set IRQ031_Handler,Default_Handler

