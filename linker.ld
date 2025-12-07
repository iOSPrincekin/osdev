ENTRY(entry)

SECTIONS {
  __kernel_address = 0x100000;
  __kernel_virtual_offset = 0xFFFF800000000000;
  . = __kernel_address + __kernel_virtual_offset;

  /* Kernel Code */
  __kernel_code_start = .;
  .text : AT(ADDR(.text)) {
    *(.text)
  }
  .rodata ALIGN(4K) : AT(ADDR(.rodata)) {
    *(.rodata)
  }
  .eh_frame : AT(ADDR(.eh_frame)) {
    *(.eh_frame)
  }
  . = ALIGN(4K);
  __kernel_code_end = .;

  /* Kernel Data */
  .data : AT(ADDR(.data)) {
    *(.data)
  }
  .boot_data : AT(ADDR(.boot_data)) {
    *(.boot_data)
  }
  .bss ALIGN(4K) : AT(ADDR(.bss)) {
    *(.bss)
  }
  . = ALIGN(4K);
  __kernel_data_end = .;

  /* Debug sections - preserve for debugging */
  /* Use SORT to ensure proper ordering and avoid relocation issues */
  .debug_abbrev 0 : { *(.debug_abbrev) }
  .debug_aranges 0 : { *(.debug_aranges) }
  .debug_frame 0 : { *(.debug_frame) }
  .debug_info 0 : { *(.debug_info) }
  .debug_line 0 : { *(.debug_line) }
  .debug_line_str 0 : { *(.debug_line_str) }
  .debug_loc 0 : { *(.debug_loc) }
  .debug_loclists 0 : { *(.debug_loclists) }
  .debug_macinfo 0 : { *(.debug_macinfo) }
  .debug_names 0 : { *(.debug_names) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  .debug_pubtypes 0 : { *(.debug_pubtypes) }
  .debug_ranges 0 : { *(.debug_ranges) }
  .debug_rnglists 0 : { *(.debug_rnglists) }
  .debug_str 0 : { *(.debug_str) }
  .debug_str_offsets 0 : { *(.debug_str_offsets) }
  .debug_types 0 : { *(.debug_types) }
  .debug_addr 0 : { *(.debug_addr) }
  
  /DISCARD/ : { *(.note.GNU-stack) }
}
