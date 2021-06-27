/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLBoadLX.aml, Sat Jun 26 18:36:57 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000018B (395)
 *     Revision         0x02
 *     Checksum         0x84
 *     OEM ID           "OCLT"
 *     OEM Table ID     "BrightFN"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "OCLT", "BrightFN", 0x00000000)
{
    External (_SB_.LID0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ17, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_.XQ18, MethodObj)    // 0 Arguments
//    External (_SB_.PCI0.LPCB.EC0_.XQ5E, MethodObj)    // 0 Arguments
//    External (_SB_.PCI0.LPCB.EC0_.XPS0, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
//    External (_SB_.PWRB, DeviceObj)
  
    /*  
    Scope(_SB.PCI0.LPCB)
    {
        Method(_PWR, 1, NotSerialized)
        {   
            Notify (\_SB.LID0, 0x80) // Status Change
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }
    }
    */
        
    Scope (_SB.PCI0.LPCB.EC0)
    {
        /*
        Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
        {
            \_SB.PCI0.LPCB.EC0.XPS0 ()
            Notify (\_SB.LID0, 0x80) // Status Change
        }

        Method (_PS1, 0, NotSerialized)  // _PS0: Power State 1
        {
        }

        Method (_Q5E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
                Notify (\_SB.LID0, 0x80) // Status Change
                \_SB.PCI0.LPCB.EC0.XQ5E ()
        }
        */
        
        Method (_Q18, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2K, 0x0405)
                Notify (\_SB.PCI0.LPCB.PS2K, 0x20) // Reserved
                Notify (\_SB.LID0, 0x80) // Status Change
                // Notify (\_SB.PWRB, 0x02) // Device Wake
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
                // Notify (\_SB.PWRB, 0x02) // Device Wake
            }
            Else
            {
                \_SB.PCI0.LPCB.EC0.XQ17 ()
            }
        }
    }
}

