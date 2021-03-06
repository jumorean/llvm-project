# RUN: llvm-mc -triple=ve --show-encoding < %s \
# RUN:     | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
# RUN: llvm-mc -triple=ve -filetype=obj < %s | llvm-objdump -d - \
# RUN:     | FileCheck %s --check-prefixes=CHECK-INST

# CHECK-INST: vsla.l %v11, %v22, %s20
# CHECK-ENCODING: encoding: [0x00,0x16,0x00,0x0b,0x00,0x94,0x20,0xd4]
vsla.l %v11, %v22, %s20

# CHECK-INST: vsla.l %vix, %vix, %vix
# CHECK-ENCODING: encoding: [0x00,0xff,0xff,0xff,0x00,0x00,0x00,0xd4]
vsla.l %vix, %vix, %vix

# CHECK-INST: vsla.l %vix, %v22, 22
# CHECK-ENCODING: encoding: [0x00,0x16,0x00,0xff,0x00,0x16,0x20,0xd4]
vsla.l %vix, %v22, 22

# CHECK-INST: vsla.l %v11, %v22, 63, %vm11
# CHECK-ENCODING: encoding: [0x00,0x16,0x00,0x0b,0x00,0x3f,0x2b,0xd4]
vsla.l %v11, %v22, 63, %vm11

# CHECK-INST: vsla.l %v11, %v23, %v22, %vm11
# CHECK-ENCODING: encoding: [0x00,0x17,0x16,0x0b,0x00,0x00,0x0b,0xd4]
vsla.l %v11, %v23, %v22, %vm11
