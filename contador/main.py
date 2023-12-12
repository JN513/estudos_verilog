# from litex.build.xilinx import XilinxPlatform

from litex.soc.integration.builder import Builder
from litex_boards.platforms import sipeed_tang_nano_20k


platform = sipeed_tang_nano_20k.Platform(toolchain="gowin")

platform.add_source("src/*.v")

# Adicione o arquivo CST ao projeto
# platform.add_file("src/pinout.cst")

# Crie o Builder
builder = Builder(platform, output_dir="build")

# Sintetize o projeto
# vns = builder.build()
