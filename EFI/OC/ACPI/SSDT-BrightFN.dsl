/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLgMmT0F.aml, Tue Jun 29 19:35:41 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000001FB (507)
 *     Revision         0x02
 *     Checksum         0x38
 *     OEM ID           "OCLT"
 *     OEM Table ID     "BrightFN"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "OCLT", "BrightFN", 0x00000000)
{
    External (_SB_.LID0, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ17, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_.XQ18, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PWRB, DeviceObj)
    External (RMDT, DeviceObj)
    External (RMDT.P1__, MethodObj)    // 1 Arguments
    External (RMDT.PUSH, MethodObj)    // 1 Arguments

    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (_Q18, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x20) // Reserved
                Notify (\_SB.LID0, 0x80) // Status Change
                \RMDT.P1 ("Wake--")
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ18 ()
            }
        }

        Method (_Q17, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0406)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x10) // Reserved
                Notify (\_SB.LID0, 0x80) // Status Change
                \RMDT.P1 ("Wake++")
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ17 ()
            }
        }
    }
}

