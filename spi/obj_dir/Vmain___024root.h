// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vmain.h for the primary calling header

#ifndef VERILATED_VMAIN___024ROOT_H_
#define VERILATED_VMAIN___024ROOT_H_  // guard

#include "verilated.h"


class Vmain__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vmain___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    VL_IN8(clk,0,0);
    VL_IN8(btn1,0,0);
    VL_IN8(btn2,0,0);
    VL_OUT8(led,5,0);
    VL_OUT8(mosi,0,0);
    VL_OUT8(cs,0,0);
    VL_OUT8(sclk,0,0);
    VL_IN8(miso,0,0);
    CData/*0:0*/ top__DOT__reset;
    CData/*0:0*/ top__DOT__start;
    CData/*3:0*/ top__DOT__m1__DOT__state;
    CData/*0:0*/ top__DOT__m1__DOT__mosi_r;
    CData/*0:0*/ top__DOT__m1__DOT__cs_r;
    CData/*0:0*/ top__DOT__m1__DOT__trig;
    CData/*0:0*/ __Vtrigprevexpr___TOP__clk__0;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ top__DOT__contador;
    IData/*31:0*/ __VstlIterCount;
    IData/*31:0*/ __VicoIterCount;
    IData/*31:0*/ __VactIterCount;
    VlTriggerVec<1> __VstlTriggered;
    VlTriggerVec<1> __VicoTriggered;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vmain__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vmain___024root(Vmain__Syms* symsp, const char* v__name);
    ~Vmain___024root();
    VL_UNCOPYABLE(Vmain___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
