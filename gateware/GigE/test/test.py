#!/usr/bin/env python3

from litex import RemoteClient

from litescope.software.driver.analyzer import LiteScopeAnalyzerDriver

wb = RemoteClient()
wb.open()

# # #

analyzer = LiteScopeAnalyzerDriver(wb.regs, "analyzer", debug=True)
analyzer.configure_trigger(cond={"mac_crc32_checker_source_source_valid": 1})
analyzer.run(offset=16, length=128)
analyzer.wait_done()
analyzer.upload()
analyzer.save("dump.vcd")

# # #

wb.close()