OUTPUT_ARCH(mips)
ENTRY(vec_reset)
SECTIONS
{
  . = 0x930a0000;
  .text : 
    {
     _ftext = . ;
    *(.init*)
     eprol  =  .;
    *(.text*)
    *(.fini*)
    *(.rodata*)
     _etext  =  .;
   }

  .data :
   {
    _fdata = ALIGN(16) ;
    *(.data*)
    CONSTRUCTORS
    . = ALIGN(16);
    _gp = . + 0x8000;
    *(.sdata*)
   }
   . = ALIGN(16);
   _edata  =  .;
   _romsize = _edata - _ftext;
  .reginfo : {}
  . = 0x83000000;
   _fbss = .;
  .sbss : {
    *(.sbss*)
    *(.scommon*)
  }
  .bss : {
    *(.bss*)
    *(COMMON)
  }
  . = ALIGN(16);
   _end = .;
}

