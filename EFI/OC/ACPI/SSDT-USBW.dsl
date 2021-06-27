/**
 * USB wakeup virtual device
 */
DefinitionBlock ("", "SSDT", 2, "OSY86 ", "USBW", 0x00001000)
{
    // External (\_SB.PCI0.XHC._PRW, MethodObj)
    External (_SB_.LID0, DeviceObj)
    External (_SB_.PWRB, DeviceObj)
    External (_SB_.LID0, DeviceObj)

    // We only enable the device for OSX
    If (CondRefOf (\_OSI, Local0) && _OSI ("Darwin"))
    {
        Device (\_SB.USBW)
        {
            Name (_HID, "PNP0D10")  // _HID: Hardware ID
            Name (_UID, "WAKE")  // _UID: Unique ID

            Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
            {
                // Return (\_SB.PCI0.XHC._PRW ()) // Replace with path to your USB device
                Notify (\_SB.LID0, 0x80) // Status Change
                Notify (\_SB.PWRB, 0x02) // Device Wake
            }
        }
    }
}

