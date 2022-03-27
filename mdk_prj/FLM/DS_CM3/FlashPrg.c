#include "..\FlashOS.H"        // FlashOS Structures
#include "string.h"

int Init (unsigned long adr, unsigned long clk, unsigned long fnc) {
  return (0);                                  // Finished without Errors
}

int UnInit (unsigned long fnc) {
  return (0);                                  // Finished without Errors
}

int EraseChip (void) {
  memset((unsigned char *)0, 0, 0x10000);
  return (0);                                  // Finished without Errors
}
int EraseSector (unsigned long adr) {
  memset((unsigned char *)adr, 0, 1024);
  return (0);                                  // Finished without Errors
}
int ProgramPage (unsigned long adr, unsigned long sz, unsigned char *buf) {
  memcpy((unsigned char *)adr, buf, sz);
  return (0);                                  // Finished without Errors
}

