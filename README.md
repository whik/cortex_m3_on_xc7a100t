## 如何用FPGA实现一个ARM Cortex-M3软核

![封面](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/封面.jpg)

[上一篇文章](https://mp.weixin.qq.com/s/BPbSr9ruZttAPboJSmE_Zw)介绍了ARM DesignStart计划，其中提到了[Cortex-M1/M3 DesignStart FPGA版本](https://mp.weixin.qq.com/s/BPbSr9ruZttAPboJSmE_Zw)，支持Xilinx和国产Gowin平台，本篇文章将手把手教你如何基于ARM DesignStart计划，在FPGA上搭建一个**[Cortex-M3软核处理器](https://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247484554&idx=1&sn=f1761b5b62e78df861c0669d15a372ee&chksm=fadfa2e4cda82bf2d05aaa26949c577d132928fe35304224427232fc53c8951c0df6e9c0fb66&scene=21#wechat_redirect)**，以Xilinx Artix-7™系列FPGA为例，介绍如何[定制一颗ARM Cortex-M3 SoC软核](https://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247484554&idx=1&sn=f1761b5b62e78df861c0669d15a372ee&chksm=fadfa2e4cda82bf2d05aaa26949c577d132928fe35304224427232fc53c8951c0df6e9c0fb66&scene=21#wechat_redirect)，并添加GPIO和UART外设，使用Keil MDK环境开发应用程序，Jlink下载、调试ARM程序，最终的实现效果是LED闪烁，串口输出Hello World信息。

![ARM On FPGA](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220318/ARM_FPGA.jpg)

### 都有哪些内容？

- **必要的基础知识**
- **Cortex-M3 FPGA IP核下载**
- **硬件准备**
- **软件准备**
- **Cortex-M3软核搭建**
  - 新建Vivado工程
  - 添加IP核搜索路径
  - 创建BlockDesign设计
  - 添加IP核，GPIO和UART外设
  - SWD接口引出
  - 外设基地址分配
  - 管脚分配
  - Bit流文件生成下载
- **Cortex-M3软核程序设计**
  - 新建Keil工程
  - GPIO输入输出控制实现
  - 串口数据发送和接收实现
  - 延时函数实现
  - Flash编程算法生成
  - 下载运行
- **开源地址**
- **参考资料**

本篇文章内容比较长，我已经将本文整理成了PDF文件，文中创建的Vivado工程，ARM Cortex-M3 IP核，Keil-MDK工程，Flash编程算法文件等等资料，我都已经上传到GitHub、Gitee，文末可以查看开源地址。

或者关注我的公众号后台回复：**220327**，获取资料的下载地址。

![我的公众号](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/%E6%B1%82%E5%85%B3%E6%B3%A8.jpg)

### 必要的基础知识

为了更快的完成在FPGA上实现ARM Cortex-M3软核，一些必要的基础知识还是要有的！

- FPGA开发基础知识，如FPGA开发流程，设计、综合、布局、布线、约束、下载
- Xilinx Vivado开发环境使用基础，如BlockDesign设计方式，管脚分配，Bit流文件生成与下载
- ARM Cortex-M3内核的使用基础，如STM32、MM32、GD32、CH32等微控制器的开发。
- Keil-MDK开发环境的使用基础，基本的工程建立、编译、下载流程。

如果以上知识都具备，那么，恭喜你！可以在**2小时内**完成ARM Cortex-M3软核在FPGA上的实现。

### Cortex-M3 FPGA IP核下载

首先，我们需要从ARM官网上获取**ARM Cortex-M3 FPGA软核IP包**。

下载地址如下：

https://silver.arm.com/browse/AT426

> **文件名称**：Cortex-M3 DesignStart FPGA-Xilinx edition(r0p1-00rel0)
>
> **文件大小**：7.52MB
>
> **MD5SUM**：cd67536c29023429cde47130d51b6f49

官网下载需要先注册账号，如果下载速度很慢，可以在公众号后台回复：**220318**，获取下载链接，复制到浏览器下载。

![ARM官网](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/1.jpg)

压缩包解压之后，共有4个文件夹：

![压缩包内容](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/2.jpg)

各个文件夹存放的内容：

- **docs**

存放ARM Cortex-M3处理器参考手册、DesignStart FPGA版本使用说明、基于Arty-A7开发板的顶层BlockDesign框图等文件。

- **hardware**

存放基于Digilent Arty-A7开发板的Vivado工程，顶层BlockDesign文件，管脚约束文件，Testbench文件等。

- **software**

存放Keil-MDK工程，SPI Flash的编程算法文件等。

- **vivado**

包括DesignStart Cortex-M3 Xilinx FPGA版本的IP核文件，其中Arm_ipi_repository文件夹就是内核源文件了，IP文件内容已经加密，没有可读性。

![IP核源码](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/4.jpg)

### 硬件准备

为了完成DS CM3在FPGA上的搭建，我们至少需要以下硬件：

- 一块Artix-7™开发板，用于构建Cortex-M3软核SoC，我使用的是**正点原子达芬奇Pro开发板**，FPGA型号为**XC7A100T**。
- [Xilinx FPGA下载器](https://mp.weixin.qq.com/s/th_jmEgdeM6gvzey9mkn5w)，用于下载软核Bit流到FPGA，如Platform Usb Cable，JTAG-HS2/HS3等。
- [ARM Cortex-M3调试器](https://mp.weixin.qq.com/s/4Us7Fl_UkN19GFvQoLGgBA)，用于调试ARM核程序下载和调试，如Jlink调试器JlinkV9，Jlink-OB等。

官方的DS CM3 IP核是基于**Digilent的Arty-A7开发板**，FPGA型号为XC7A35T/100T，Vivado版本为v2019.1，如果你手头正好有这块开发板，那么可以直接使用官方提供的示例工程。

Digilent Arty-A7开发板：

![arty-a7开发板](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/arty-a7.jpg)

正点原子达芬奇Pro开发板：

![正点原子达芬奇Pro开发板](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/artix-7.JPG)

### 软件准备

- Xilinx Vivado开发环境，官方建议版本为2018.2以上，我使用的是2018.3版本

- Keil MDK开发环境，如5.33版本

- DS_CM3的Keil器件包

  从Keil官网上下载DesignStart Cortex-M3所专用的器件支持包，下载链接如下：
  
  https://keilpack.azureedge.net/pack/Keil.V2M-MPS2_DSx_BSP.1.1.0.pack

### Cortex-M3软核搭建

准备好以上软硬件，就可以开始Cortex-M3软核的搭建了。

首先，新建一个文件夹，命名为cortex_m3_on_xc7a100t，用于存放本次示例所有的工程文件，并新建以下几个文件夹：

![目录结构](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/3.jpg)

每个文件夹的功能：

- bd文件夹

  用来存放BlockDesign设计

- cm3_core文件夹

  用来存放的是ARM Cortex-M3内核IP核文件，

- doc文件夹

  用来存放设计文档

- flash文件夹

  用来存放生成的bit和mcs文件

- rtl文件夹

  用来存放用户设计的verilog源文件

- xdc文件夹

  用来存放管脚、时序约束文件

其中cm3_core文件夹，需要将官方压缩文件文件中的Arm_ipi_repository文件夹复制过来，路径为`AT426-BU-98000-r0p1-00rel0\vivado\Arm_ipi_repository`

以上文件夹准备好之后，就可以开始新建工程了。

#### 新建Vivado工程

打开Vivado 2018.3，打开工程创建向导，输入工程名称，工程的存放路径为之前我们新建的文件夹。

![新建工程](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/5.jpg)

选择FPGA芯片的完整型号：**XC7A100TFGG484**。

![选择芯片型号](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/6.jpg)

最终创建完成之后的工程目录

![Vivado工程目录](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/7.jpg)

#### 添加IP核搜索路径

为了能在BlockDesign中搜索到ARM Cortex-M3处理器IP核，我们需要把ARM 软核IP所在的路径添加到搜索路径。

![添加到搜索路径](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/8.jpg)

#### 创建BlockDesign设计

为了方便后续使用图形化的方式连接各IP核，我们采用BlockDesign图形化的设计方式，这样可以快速的搭建出一颗定制化的软核处理器。

新建**BlockDesign**，命名为**cm3_core**，保存到最初创建的bd文件夹中。

在画布中添加Cortex-M3处理器核：

![添加ARM核](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/9.jpg)

双击Cortex-M3 IP核进行一些基本配置，我们不需要Trace功能，选择No Trace，使用SWD接口调试，禁用JTAG端口：

![配置ARM核](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/11.jpg)

指令空间和数据空间大小，这里设置成64KB，都不进行初始化。

![ITCM核DTCM配置](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/10.jpg)

#### 添加一些必要的IP核

- **时钟PLL**

  用于提供给内核、总线、外设时钟，这里我们配置成**50MHz单端输入**，PLL输出配置成**50MHz**，如果时钟频率设置更高，综合后会提示WNS，TNS时序不满足，可能会影响系统的正常运行。

- **处理器复位IP**

  用于提供内核、外设、互联组件所需要的复位信号，不需要进行定制，保持默认设置。

- **总线互联IP**

  Cortex-M3内核为AHB总线，而且内部已经转换成了AXI3总线，而Xilinx官方提供的GPIO/UART等外设IP核是AXI4-Lite总线，所以需要添加一个总线互联矩阵，用于将不同协议进行转换，从机数量配置为1，主机数量配置为2，连接到处理器的SYS总线。

- **基本逻辑门IP**

  Cortex-M3内核需要低电平复位，而**复位IP**输出为高电平复位，需要在中间插入一个非门来进行转换。

- **常量IP**

  本次软核搭建不涉及中断部分，所以IRQ和NMI都给定常量0即可，如果需要将中断接入处理器，可以通过Concat核将多个中断源合并成一个连接到IRQ。

将以上IP添加到BlockDesign画布中，并按照下图进行连接：

![原理图连接](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/12.jpg)

从官方手册中可以知道，ARM提供的软核IP中已经包括了ITCM和DTCM存储器，所以我们无需添加外部的BRAM来作为程序和数据的存储区。

![Cortex-M3内核结构](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/13.jpg)

内核中提供ITCM和DTCM都是基于RAM实现，这也就意味着后续我们使用Keil下载程序只是下载到RAM中，掉电数据会丢失。

至此，ARM Cortex-M3处理器内核就搭建完成了，下面来添加GPIO和UART外设。

#### 添加GPIO和UART外设

一些常用的单片机，如STM32，芯片内部的TIM、UART、SPI、CAN等外设一般是固定数量的，而我们使用FPGA来搭建ARM软核SoC就比较灵活了，如果你不需要SPI，那就不用添加SPI外设，需要10个UART就添加10个UART，外设配置比较灵活，当然这些外设都是基于FPGA逻辑资源实现的，实际添加的数量会受限于FPGA芯片的逻辑资源大小。

下面以添加一组AXI GPIO和一组AXI UART为例，介绍如何使用ARM软核来控制这两个外设。

Xilinx官方提供的AXI GPIO外设具有以下特性：

- 内部有两个通道，通道1和通道2，每个通道最多支持32个管脚
- 每个管脚可以配置成输入或输出模式
- 每个管脚可以设置复位初值
- 支持中断输出

提供的AXI UART外设有以下特性：

- 全双工
- 支持5-8位数据位
- 支持奇偶校验
- 可配置波特率110-230400

这里我们将GPIO配置成双通道，**通道1为输出模式**，低4位用于连接LED，**通道2为输入模式**，低4位用于连接按键。

![GPIO配置](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/14.jpg)

[UART配置成115200波特率](https://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247484166&idx=2&sn=8e456f004727ad2263d239dde3ee9524&scene=21#wechat_redirect)，8位数据位，无奇偶校验。

![UART配置](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/15.jpg)

配置完成之后，将它们连接的到互联IP的主机接口上：

![原理图连接](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/16.jpg)

这两组IP的时钟可以和处理器使用同样的时钟，复位可以使用复位IP输出的外设复位信号。

关于AXI GPIO和AXI UART的详细使用，可以查看官方文档：

- pg144-axi-gpio.pdf

  https://www.xilinx.com/support/documentation/ip_documentation/axi_gpio/v2_0/pg144-axi-gpio.pdf

- pg142-axi-uartlite.pdf

  https://www.xilinx.com/support/documentation/ip_documentation/axi_uartlite/v2_0/pg142-axi-uartlite.pdf

#### SWD接口的引出

官方的DesignStart IP核资料中，除了Cortex-M3处理器，还有一个DAP-Link调试核，如果使用DAP-Link调试器需要添加这个IP核。

![DAP-Link](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/17.jpg)

这里我们不使用DAP-Link调试器，而是使用Jlink SWD模式。SWD模式一共需要两根线，一个是SWCLK时钟信号，一个是SWDIO双向数据信号，处理器提供了3个管脚：SWDI，SWDO和SWDOEN，我们还需要实现一个双向端口模块。

基于IOBUF原语实现的双向端口模块，内容如下：

```v
module swdio_tri_buffer(
    //Inputs
    input swd_o,
    input swd_oe,
    
    //Outputs
    output swd_i,
    
    //Inouts
    inout swd_io
);

IOBUF swd_iobuf_inst(
    .O(swd_i),
    .I(swd_o),
    .IO(swd_io),
    
    .T(!swd_oe)
);

endmodule
```

将它添加到我们的设计中。

![SWD接口连接](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/18.jpg)

最终的BlockDesign设计如下图所示：

![原理图连接](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/19.jpg)



#### 分配外设基地址

、添加完外设IP之后，我们还需要对外设进行基地址和空间分配，在地址编辑框，右键选择自动分配。

![基地址分配](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/20.jpg)

分配完成之后，使用设计验证（Validate Design）功能，可以检查当前BlockDesign设计连接的合法性。

![验证设计](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/33.jpg)

#### 生成Wrapper并例化到顶层

为了方便后续添加自定义的FPGA逻辑模块，我们将Cortex-M3软核处理器作为一个处理器例化到顶层设计中。

在BlockDesign源文件上右键，先选择`Generate Output Products`，耐心等待生成完成之后，选择`Create HDL Wrapper`。

![生成Wrapper](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/34.jpg)

之后就会生成一个_wrapper的verilog文件。

新建顶层文件top_hdl.v并保存到rtl文件夹，将_wrapper例化到顶层。

```v
module top_hdl(
    //Inputs
    input clk,
    input rst_n,
    input swclk,
    input uart_rxd,
    input [3:0] sw,
    
    //Outputs
    output [3:0] led,
    output uart_txd,

    //Inouts
    inout swdio
);

cm3_core_wrapper cm3_core_wrapper_ut0(
    //Inputs
    .cm3_clk(clk),
    .cm3_resetn(rst_n),
    .cm3_gpio_in_tri_i(sw[3:0]),
    .cm3_swclk(swclk),
    .cm3_uart_rxd(uart_rxd),
    
    //Outputs
    .cm3_gpio_out_tri_o(led[3:0]),
    .cm3_uart_txd(uart_txd),
    
    //Inouts
    .cm3_swdio(swdio)
);

endmodule   //top_hdl end
```

#### 管脚分配

综合（Synthesis）完成之后，使用Vivado的图形化工具进行管脚分配，尤其注意要将SWDIO和SWDCLK引出到排针管脚上，方便后续使用外接的Jlink调试器进行ARM程序下载。

![分配管脚](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/21.jpg)

或者直接新建XDC文件，使用约束语句进行管脚分配。

部分约束语句：

```c
set_property PACKAGE_PIN R4 [get_ports clk]
set_property PACKAGE_PIN V13 [get_ports swclk]
set_property PACKAGE_PIN V14 [get_ports swdio]
set_property PACKAGE_PIN E14 [get_ports uart_rxd]
set_property PACKAGE_PIN D17 [get_ports uart_txd]
set_property PACKAGE_PIN U7 [get_ports rst_n]
set_property PACKAGE_PIN V9 [get_ports {led[3]}]
set_property PACKAGE_PIN Y8 [get_ports {led[2]}]
set_property PACKAGE_PIN Y7 [get_ports {led[1]}]
set_property PACKAGE_PIN W7 [get_ports {led[0]}]
set_property PACKAGE_PIN T4 [get_ports {key[3]}]
set_property PACKAGE_PIN T3 [get_ports {key[2]}]
set_property PACKAGE_PIN R6 [get_ports {key[1]}]
set_property PACKAGE_PIN T6 [get_ports {key[0]}]
```

如果你的板子和我的（**正点原子达芬奇Pro**）一样，那么可以直接使用以上管脚约束。

如果你分配的时钟管脚不是FPGA的全局时钟管脚，需要添加BUFG原语进行缓冲。

#### Bit流文件生成和下载

我的板子使用的是QSPI Flash，为了提高下载和启动速度，在生成Bit流时，配置生成选项：**数据压缩、50M读取速度，4位数据线**。

![生成Bit流配置](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/22.jpg)

或者直接使用XDC语句进行约束：

```tcl
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
```

以上约束不是必须的，只是为了提高下载和配置速度。

耐心等待工程综合完成，生成Bit流文件，综合的速度和处理器主频、核心数有关。

和常规的FPGA下载方式一样，将生成的软核Bit文件通过Xilinx下载器下载到FPGA内部，先不要固化到外部SPI Flash 。

手头没有Xilinx下载器的，可以参考[之前的文章](https://mp.weixin.qq.com/s/th_jmEgdeM6gvzey9mkn5w)，自己做一个JTAG-HS2下载器！

[开源、低成本的Xilinx FPGA下载器](https://mp.weixin.qq.com/s/th_jmEgdeM6gvzey9mkn5w)

#### Jlink连接测试

下载完成之后，现在FPGA内部运行的就是一颗基于ARM Cortex-M3的软核处理器了，使用Jlink等调试工具可以连接到芯片。

将[Jlink调试器](https://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247483816&idx=1&sn=eea98e9ba549e3bc2798af432819e6db&chksm=fadfa7c6cda82ed0de0da078361dc12b2554abd1c538752c467a024fcb34ec98c9c25030444e&scene=21#wechat_redirect)的SWCLK和SWDIO连接到我们分配的管脚V13和V14上。

手头没有Jlink的，也可以参考[之前的文章](https://mp.weixin.qq.com/s/4Us7Fl_UkN19GFvQoLGgBA)，自己做一个Jlink-OB！

[手把手教你制作Jlink-OB调试器](https://mp.weixin.qq.com/s/4Us7Fl_UkN19GFvQoLGgBA)

使用Keil开发DesignStart Cortex-M3软核的程序，需要先安装一个DesignStart专用的器件包。

下载地址如下：

https://keilpack.azureedge.net/pack/Keil.V2M-MPS2_DSx_BSP.1.1.0.pack

打开一个STM32 Keil工程，器件修改为刚刚安装的ARM DS_CM3，在`Option->Debug-Setting`界面中选择SWD方式，第一次连接会提示需要选择一个器件，这里选择Cortex-M3：

![选择器件型号](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/40.jpg)

如果以上配置均正确，就能看到已经连接到的ARM Cortex-M3核心。如果没有，说明FPGA工程配置有错误，需要确认是否和以上配置流程一致。

![连接到ARM核心](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/23.jpg)

至此，ARM Cortex-M3软核基本搭建完成，接下来我们使用Keil来编写ARM核的程序，实现GPIO和UART的控制。

### Cortex-M3软核程序设计

和常规的ARM Cortex-M3内核单片机开发流程类似，使用Keil新建工程，源文件，根据外设使用手册，读写指定的寄存器实现GPIO的控制，UART数据写入，编译下载，调试。

在之前创建的`cortex_m3_on_xc7a100t`文件夹下，新建mdk_prj文件夹，用于保存Keil-MDK的工程，并新建以下3个文件夹：

```c
application		//用户源文件
object			//编译生成的文件
project			//Keil的工程文件
```

#### 新建Keil工程

打开Keil-MDK，选择`Project->New Project`，新建一个工程，命名为ds_cm3_prj，保存到project目录下。

![Keil工程目录](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/24.jpg)

器件型号选择我们新安装的ARM Cortex-M3 DS_CM3内核。

![选择器件型号](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/25.jpg)

组件管理界面中，添加CMSIS内核文件和Startup启动文件：

![添加内核文件](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/26.jpg)

并按照如下结构组织文件：

![文件结构](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/27.jpg)

#### 设置RAM和ROM地址

在工程选项中设置片上ITCM的起始地址0x0、大小64K，片上DTCM起始地址0x20000000、大小64K：

![RAM地址配置](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/30.jpg)

起始地址来源于使用手册中图4-1系统内存地址映射，可以看到其中ITCM和DTCM的起始地址：

![ITCM和DTCM起始地址](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/28.jpg)

大小是我们在Cortex-M3内核配置中设置的大小：

![ITCM和DTCM大小](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/29.jpg)

设置完成之后，新建main.c文件，输入以下内容，编译工程，应该无错误输出。

```c
#include "DS_CM3.h"
#include "system_DS_CM3.h"

int main(void)
{
	while(1)
	{

	}
}
```

#### GPIO输入输出控制

通过查看AXI GPIO的使用手册，通道1的数据寄存器偏移地址为0，通道2的数据寄存器偏移地址为0x08，根据Vivado中的连接，LED连接到通道1，按键连接到通道2上，所以只需要对这两个寄存器地址进行读写，就可以实现LED的控制和拨码开关状态的读取。

![AXI GPIO寄存器定义](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/31.jpg)

在Vivado地址分配界面，可以看到GPIO和UART的基地址分别为：0x4000_0000和0x4060_0000。

![外设基地址](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/32.jpg)

LEL控制和拨码开关读取：

```c
*(volatile uint32_t *) (0x40000000+0x0) = 0x0f;	//GPIO通道1低4位写1
*(volatile uint32_t *) (0x40000000+0x0) = 0x00;	//GPIO通道1低4位写0

uint32_t sw = 0;
sw = *(uint32_t *) (0x40000000+0x08);	//获取GPIO通道2的32位输入状态
```

#### 串口数据发送和接收

向串口发送FIFO写入一字节数据：

```c
while((*(volatile uint32_t *)(0x40600000 + 0x08)) & 0x08 != 0x08);	//等待发送FIFO不满
*(volatile uint32_t *) (0x40600000+0x04) = 0x41;	//向串口发送FIFO写入字符'A'=0x41
```

从串口接收一字节数据：

```c
uint8_t dat = 0;
if((*(volatile uint32_t *)(0x40600000 + 0x08)) & 0x01 == 1)	//串口接收FIFO中有数据
    dat = (*(volatile uint32_t *)(0x40600000 + 0x00));		//从接收FIFO中读取1字节数据。
```

关于AXI GPIO和AXI UART寄存器的详细说明，可以查看官方文档：

- pg144-axi-gpio.pdf

  https://www.xilinx.com/support/documentation/ip_documentation/axi_gpio/v2_0/pg144-axi-gpio.pdf

- pg142-axi-uartlite.pdf

  https://www.xilinx.com/support/documentation/ip_documentation/axi_uartlite/v2_0/pg142-axi-uartlite.pdf

#### 延时函数实现

为了让LED的变化，可以被人眼所看到，需要使用延时函数对亮灭进行延时。

使用系统滴答定时器实现一个延时函数：

```c
volatile uint32_t cnt = 0;	//volatile类型

void SysTick_Handler(void)
{
    cnt++;
}

void delay_ms(uint32_t t)
{
    cnt = 0;
    while(cnt-t>0);
}
```

为了让延时函数准确延时，我们还需要更改工程中的系统时钟频率，和FPGA中配置的内核时钟保持一致。

![系统时钟](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/42.jpg)

完成的main.c文件内容：

```c
#include "DS_CM3.h"
#include "system_DS_CM3.h"
//C库
#include <stdarg.h>
#include <string.h>
#include <stdio.h>

#define BASEADDR_LED 	0x40000000
#define BASEADDR_UART 	0x40600000
#define CHANNEL_LED 	1
#define CHANNEL_SW   	2

#define XGPIO_CHAN_OFFSET 8
#define XGpio_WriteReg(BaseAddress, RegOffset, Data)   Xil_Out32((BaseAddress) + (RegOffset), (uint32_t)(Data))
#define XGpio_ReadReg(BaseAddress, RegOffset)  		   XGpio_In32((BaseAddress) + (RegOffset))

#define XUL_TX_FIFO_OFFSET           4     /* transmit FIFO, write only */
#define XUL_STATUS_REG_OFFSET        8     /* status register, read only */
#define XUL_SR_TX_FIFO_FULL          0x08  /* transmit FIFO full */

#define XUartLite_GetStatusReg(BaseAddress)  		XUartLite_ReadReg((BaseAddress), XUL_STATUS_REG_OFFSET)
#define XUartLite_ReadReg(BaseAddress, RegOffset)   XGpio_In32((BaseAddress) + (RegOffset))

#define XUartLite_IsTransmitFull(BaseAddress) \
    ((XUartLite_GetStatusReg((BaseAddress)) & XUL_SR_TX_FIFO_FULL) == \
      XUL_SR_TX_FIFO_FULL)

#define XUartLite_WriteReg(BaseAddress, RegOffset, Data)  Xil_Out32((BaseAddress) + (RegOffset), (uint32_t)(Data))

volatile uint32_t cnt = 0;

void SysTick_Handler(void)
{
    cnt++;
}

void delay_ms(uint32_t t)
{
    cnt = 0;
    while(cnt-t>0);
}

uint32_t XGpio_In32(uint32_t Addr)
{
    return *(volatile uint32_t *) Addr;
}

void Xil_Out32(uint32_t Addr, uint32_t Value)
{
    volatile uint32_t *LocalAddr = (volatile uint32_t *)Addr;
    *LocalAddr = Value;
}

uint32_t XGpio_DiscreteRead(uint32_t Addr, uint8_t Channel)
{
    return XGpio_ReadReg(Addr, (Channel-1)*XGPIO_CHAN_OFFSET);
}

void XGpio_DiscreteWrite(uint32_t Addr, uint8_t Channel, uint32_t Data)
{
    XGpio_WriteReg(Addr, (Channel-1)*XGPIO_CHAN_OFFSET, Data);
}

void XUartLite_SendByte(uint32_t BaseAddress, uint8_t Data)
{
    while (XUartLite_IsTransmitFull(BaseAddress));
    XUartLite_WriteReg(BaseAddress, XUL_TX_FIFO_OFFSET, Data);
}

void cm3_print(const char *ptr)
{
    while (*ptr != (char)0) {
        XUartLite_SendByte(BASEADDR_UART, *ptr);
        ptr++;
    }
}

void MyUartPrintf(char *fmt,...)
{
    unsigned char UsartPrintfBuf[296];
    va_list ap;
    unsigned char *pStr = UsartPrintfBuf;
    
    va_start(ap, fmt);
    vsnprintf((char *)UsartPrintfBuf, sizeof(UsartPrintfBuf), (const char *)fmt, ap);                      
    va_end(ap);
    
    while(*pStr != 0)
    {
        XUartLite_SendByte(BASEADDR_UART, *pStr);
        pStr++;
    }
}

void led_blink(void)
{
    XGpio_DiscreteWrite(BASEADDR_LED, CHANNEL_LED, 0);
    delay_ms(500);
    XGpio_DiscreteWrite(BASEADDR_LED, CHANNEL_LED, 0xf);
    delay_ms(500);
}

int main(void)
{
    uint32_t sw = 0;
	
    SystemCoreClockUpdate();
    SysTick_Config(SystemCoreClock/1000);
	
	cm3_print("Hello DesignStart ARM Cortex-M3 on FPGA Xilnx Artix-7 XC7A100T \r\n");
	MyUartPrintf("SystemCoreClock = %ld\r\n", SystemCoreClock);
	
    while(1)
    {
        led_blink();
        sw = XGpio_DiscreteRead(BASEADDR_LED, CHANNEL_SW);
        MyUartPrintf("key state = %d-%d-%d-%d\r\n", sw>>3, sw>>2&1, sw>>1&1, sw&1);
    }
}
```

实现的功能是，4颗LED每100ms闪烁一次，同时串口输出此时拨码开关的实时状态。

编译无误后，就可以进行程序下载了。

#### Flash编程算法生成

使用Jlink下载程序需要指定Flash编程算法，但是Keil自带的算法中并没有我们所需要的：

![下载算法](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/35.jpg)

所以我们需要定制一份Flash编程算法，打开Keil安装目录下的`\ARM\Flash`文件夹，将`_Template`文件夹复制出一份，并命名为DS_CM3，

![复制模板](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/36.jpg)

打开其中的Keil工程：

![下载算法](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/37.jpg)

这个工程可以自己设置要编程的Flash起始地址、大小，擦除大小等。

FlashDev.c文件填入以下内容，和我们之前ITCM的配置保持一致，起始地址0x0，大小64K：

```c
#include "..\FlashOS.H"        // FlashOS Structures

struct FlashDevice const FlashDevice  =  {
   FLASH_DRV_VERS,             // Driver Version, do not modify!
   "MyCM3onFPGA",   		   // Device Name 
   ONCHIP,                     // Device Type
   0x00000000,                 // Device Start Address
   0x00010000,                 // 修改为64KB
   1024,                       // Programming Page Size
   0,                          // Reserved, must be 0
   0xFF,                       // Initial Content of Erased Memory
   100,                        // Program Page Timeout 100 mSec
   3000,                       // Erase Sector Timeout 3000 mSec

// Specify Size and Address of Sectors
   0x010000, 0x000000,         // 只有一个扇区，起始地址为0
   SECTOR_END
};
```

FlashPrg.c文件，实现一些存储区擦除的函数：

```c
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

```

编译无误后，会在工程目录下生成一个FLM文件。

![新生成的下载算法](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/38.jpg)

将它复制到上一级目录：

![新生成的下载算法](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/39.jpg)

#### 编译下载运行

再打开我们的ARM核Keil工程，添加DS_CM3 Flash编程算法：

![添加Flash编程算法](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/41.jpg)

点击下载按钮，把ARM程序下载到ARM核：

![43](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/45.jpg)

可以看到LED每500ms闪烁一次，串口数据每1s输出一次，同时按下按键，串口输出按键的状态。

![43](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/43.jpg)

和其他ARM内核芯片一样，也是支持在线调试的：

![43](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/220327/44.jpg)

由于ARM程序是下载到Cortex-M3软核内的RAM存储区，所以掉电后程序会丢失。如何将程序下载到片外的SPI Flash中，我还没有成功实现。

### 开源地址

本篇文章的pdf文件，Vivado工程，Keil工程，Keil器件支持 包，Flash编程算法文件，外设IP的参考文档，ARM M3软核IP资料包等资料我已经开源到Github和Gitee，地址如下：

Gitee

```
git clone https://gitee.com/whik/cortex_m3_on_xc7a100t.git
```

Github

```
git clone https://github.com/whik/cortex_m3_on_xc7a100t.git
```

或者关注我（**公众号：电子电路开发学习**），在后台回复：**220327**，直接获取以上资料压缩包的下载链接，可以复制到浏览器直接下载。

![img](https://wcc-blog.oss-cn-beijing.aliyuncs.com/img/%E6%B1%82%E5%85%B3%E6%B3%A8.jpg)

### 参考资料

本文参考了B站芯片设计大佬**虹咲（ID：4253239）**所发布的两个视频教程：

- 使用Vivado BlockDesign设计基于ARM DesignStart M3的软核SoC（**ID：BV1bp4y187wf**）

- 使用Keil设计基于ARM DesignStart M3软核的软件程序（**ID：BV1cy4y147Sc**）

如果本文所介绍的方法无法成功实现，可以参考以上两个视频教程。

有兴趣研究软核处理器在FPGA上实现的朋友，可以加群互相交流学习：**虹咲芯片设计同好会**，QQ群541294921

### 更多

- [如何私人定制一颗ARM内核SoC？](https://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247487266&idx=1&sn=609d19dc36eba055022461188ef0c84c&chksm=fadfa94ccda8205ae93ae49956bfdd6db867ad08e6b15b25431153b155f37193b5f68bb7b604&token=1291727985&lang=zh_CN#rd)
- [都说FPGA高端，它到底能干啥？](https://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247487183&idx=1&sn=2eca067c82a8a62ca5d55fd5d66d5f1f&chksm=fadfa8a1cda821b7b6e472aad86213fd52f51cbc53736c98065808d378ba3890c15d6a8ec09e&token=1291727985&lang=zh_CN#rd)
- [如何打造一款高效率的Verilog编辑器](http://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247487252&idx=1&sn=4b082a7e08bdf40d2a470c26c77e0951&chksm=fadfa97acda8206ce40fcd87b564a64ec73a5c4662beeedcde59d12197e0d4acfe2742bf182f&scene=21#wechat_redirect)
- [如何写出易于维护的Verilog代码？](http://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247485575&idx=1&sn=71ab597711a0ab1fa8080cc6d2eb87ee&chksm=fadfaee9cda827ff8e4c1ff0bff2735f84c2dd8d90d93d6a69e0948f5197fbb15a931db26d33&scene=21#wechat_redirect)
- [这个Verilog语法你一定不知道](http://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247485156&idx=1&sn=01ad771be188c494c43934d5a128e5d0&chksm=fadfa08acda8299c25813d9333ebd1ed1c59ec7322fd32856f6cfd63b26c2e4ea4d01d347d40&scene=21#wechat_redirect)
- [FPGA硬核和软核处理器的区别](http://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247484554&idx=1&sn=f1761b5b62e78df861c0669d15a372ee&chksm=fadfa2e4cda82bf2d05aaa26949c577d132928fe35304224427232fc53c8951c0df6e9c0fb66&scene=21#wechat_redirect)
- [除了ZYNQ还有哪些内嵌ARM硬核的FPGA？](http://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247484559&idx=1&sn=5a309d8d146accacdc8d09420500db54&chksm=fadfa2e1cda82bf72da4cca21bed02c93c650c91bc6d351c685151ca036040173f33ac1c8327&scene=21#wechat_redirect)
- [全平台轻量开源verilog仿真工具iverilog+GTKWave使用教程](http://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247486019&idx=1&sn=57f1f45bcd8ab5632b2b89ab19503bc4&chksm=fadfac2dcda8253b843f43be1e4480d7a0960c87387ada3914087843a9d0c905eb47a4e14718&scene=21#wechat_redirect)
- [阿里平头哥首次交货——玄铁910是个啥？是芯片吗？](http://mp.weixin.qq.com/s?__biz=MzUzNzk2NTMxMw==&mid=2247484153&idx=1&sn=034d7ec28fe21f5099196d5c3600c26b&chksm=fadfa497cda82d819c40116c2a8e2355361d3ba2e2c3571f21bcdcb685817eab6395bbf44af8&scene=21#wechat_redirect)

