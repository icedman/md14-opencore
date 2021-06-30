// SSDT-UIAC.dsl
//
// This SSDT demonstrates a custom configuration for USBInjectAll.kext.
//

DefinitionBlock ("", "SSDT", 2, "hack", "UIAC", 0)
{
/*
HS03 > usb2 (left) (3)
SS03 > usb3 (left) (3)
HS05 > usb2 (right) (2)
HS01 > type-C - usb2 (8)
*/

    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        // override EH01 configuration to have only one port
        Name(RMCF, Package()
        {
            "XHC", Package()
            {
                "port-count", Buffer() { 0x0e, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package()
                    {
                        "UsbConnector", 8,
                        "port", Buffer() { 0x01, 0, 0, 0 },
                    },
                    "HS03", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x03, 0, 0, 0 },
                    },
                    "HS05", Package()
                    {
                        "UsbConnector", 0,
                        "port", Buffer() { 0x05, 0, 0, 0 },
                    },
                    "HS06", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 0x06, 0, 0, 0 },
                    },
                    "SS03", Package()
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 0x0f, 0, 0, 0 },
                    }
                }
            }
        })
    }
}

//EOF