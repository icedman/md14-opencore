/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLFagW0H.aml, Tue Jun 29 19:51:02 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000105 (261)
 *     Revision         0x02
 *     Checksum         0x70
 *     OEM ID           "OCLT"
 *     OEM Table ID     "PTSWAK"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "OCLT", "PTSWAK", 0x00000000)
{
    External (_SB_.LID0, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_._Q17, MethodObj)    // 0 Arguments
    External (_SB_.PWRB, DeviceObj)
    External (RMDT, DeviceObj)
    External (RMDT.PUSH, MethodObj)    // 1 Arguments
    External (XWAK, MethodObj)    // 1 Arguments

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (((Arg0 < One) || (Arg0 > 0x05)))
        {
            Arg0 = 0x03
        }

        Local0 = XWAK (Arg0)
        If ((0x03 == Arg0))
        {
            \RMDT.PUSH ("_WAKing..")
                    
            \_SB.PCI0.LPCB.EC0._Q17 ()
            Notify (\_SB.LID0, 0x80) // Status Change
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        \RMDT.PUSH (Arg0)
        Return (Local0)
    }
}

