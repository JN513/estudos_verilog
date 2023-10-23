// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vmain.h for the primary calling header

#include "verilated.h"

#include "Vmain__Syms.h"
#include "Vmain___024root.h"

VL_INLINE_OPT void Vmain___024root___ico_sequent__TOP__0(Vmain___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vmain__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmain___024root___ico_sequent__TOP__0\n"); );
    // Body
    vlSelf->sclk = vlSelf->clk;
}

void Vmain___024root___eval_ico(Vmain___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vmain__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmain___024root___eval_ico\n"); );
    // Body
    if ((1ULL & vlSelf->__VicoTriggered.word(0U))) {
        Vmain___024root___ico_sequent__TOP__0(vlSelf);
    }
}

void Vmain___024root___eval_act(Vmain___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vmain__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmain___024root___eval_act\n"); );
}

VL_INLINE_OPT void Vmain___024root___nba_sequent__TOP__0(Vmain___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vmain__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmain___024root___nba_sequent__TOP__0\n"); );
    // Init
    IData/*31:0*/ __Vdly__top__DOT__contador;
    __Vdly__top__DOT__contador = 0;
    CData/*0:0*/ __Vdly__top__DOT__reset;
    __Vdly__top__DOT__reset = 0;
    CData/*3:0*/ __Vdly__top__DOT__m1__DOT__state;
    __Vdly__top__DOT__m1__DOT__state = 0;
    CData/*0:0*/ __Vdly__top__DOT__m1__DOT__trig;
    __Vdly__top__DOT__m1__DOT__trig = 0;
    // Body
    __Vdly__top__DOT__reset = vlSelf->top__DOT__reset;
    __Vdly__top__DOT__contador = vlSelf->top__DOT__contador;
    __Vdly__top__DOT__m1__DOT__trig = vlSelf->top__DOT__m1__DOT__trig;
    __Vdly__top__DOT__m1__DOT__state = vlSelf->top__DOT__m1__DOT__state;
    if (vlSelf->top__DOT__start) {
        if (vlSelf->top__DOT__reset) {
            __Vdly__top__DOT__m1__DOT__state = 0U;
            vlSelf->top__DOT__m1__DOT__mosi_r = 0U;
            vlSelf->top__DOT__m1__DOT__cs_r = 1U;
        } else if (((((((((0U == (IData)(vlSelf->top__DOT__m1__DOT__state)) 
                          | (1U == (IData)(vlSelf->top__DOT__m1__DOT__state))) 
                         | (2U == (IData)(vlSelf->top__DOT__m1__DOT__state))) 
                        | (3U == (IData)(vlSelf->top__DOT__m1__DOT__state))) 
                       | (4U == (IData)(vlSelf->top__DOT__m1__DOT__state))) 
                      | (5U == (IData)(vlSelf->top__DOT__m1__DOT__state))) 
                     | (6U == (IData)(vlSelf->top__DOT__m1__DOT__state))) 
                    | (7U == (IData)(vlSelf->top__DOT__m1__DOT__state)))) {
            if ((0U == (IData)(vlSelf->top__DOT__m1__DOT__state))) {
                __Vdly__top__DOT__m1__DOT__state = 1U;
                __Vdly__top__DOT__m1__DOT__trig = 1U;
                vlSelf->top__DOT__m1__DOT__mosi_r = 0U;
                vlSelf->top__DOT__m1__DOT__cs_r = 0U;
            } else if ((1U == (IData)(vlSelf->top__DOT__m1__DOT__state))) {
                if (vlSelf->top__DOT__m1__DOT__trig) {
                    vlSelf->top__DOT__m1__DOT__mosi_r = 1U;
                    __Vdly__top__DOT__m1__DOT__trig = 0U;
                } else {
                    __Vdly__top__DOT__m1__DOT__state = 2U;
                    __Vdly__top__DOT__m1__DOT__trig = 1U;
                }
            } else if ((2U == (IData)(vlSelf->top__DOT__m1__DOT__state))) {
                if (vlSelf->top__DOT__m1__DOT__trig) {
                    vlSelf->top__DOT__m1__DOT__mosi_r = 0U;
                    __Vdly__top__DOT__m1__DOT__trig = 0U;
                } else {
                    __Vdly__top__DOT__m1__DOT__state = 3U;
                    __Vdly__top__DOT__m1__DOT__trig = 1U;
                }
            } else if ((3U == (IData)(vlSelf->top__DOT__m1__DOT__state))) {
                if (vlSelf->top__DOT__m1__DOT__trig) {
                    vlSelf->top__DOT__m1__DOT__mosi_r = 1U;
                    __Vdly__top__DOT__m1__DOT__trig = 0U;
                } else {
                    __Vdly__top__DOT__m1__DOT__state = 4U;
                    __Vdly__top__DOT__m1__DOT__trig = 1U;
                }
            } else if ((4U == (IData)(vlSelf->top__DOT__m1__DOT__state))) {
                if (vlSelf->top__DOT__m1__DOT__trig) {
                    vlSelf->top__DOT__m1__DOT__mosi_r = 0U;
                    __Vdly__top__DOT__m1__DOT__trig = 0U;
                } else {
                    __Vdly__top__DOT__m1__DOT__state = 5U;
                    __Vdly__top__DOT__m1__DOT__trig = 1U;
                }
            } else if ((5U == (IData)(vlSelf->top__DOT__m1__DOT__state))) {
                if (vlSelf->top__DOT__m1__DOT__trig) {
                    vlSelf->top__DOT__m1__DOT__mosi_r = 1U;
                    __Vdly__top__DOT__m1__DOT__trig = 0U;
                } else {
                    __Vdly__top__DOT__m1__DOT__state = 6U;
                    __Vdly__top__DOT__m1__DOT__trig = 1U;
                }
            } else if ((6U == (IData)(vlSelf->top__DOT__m1__DOT__state))) {
                if (vlSelf->top__DOT__m1__DOT__trig) {
                    vlSelf->top__DOT__m1__DOT__mosi_r = 0U;
                    __Vdly__top__DOT__m1__DOT__trig = 0U;
                } else {
                    __Vdly__top__DOT__m1__DOT__state = 7U;
                    __Vdly__top__DOT__m1__DOT__trig = 1U;
                }
            } else if (vlSelf->top__DOT__m1__DOT__trig) {
                vlSelf->top__DOT__m1__DOT__mosi_r = 1U;
                __Vdly__top__DOT__m1__DOT__trig = 0U;
            } else {
                __Vdly__top__DOT__m1__DOT__state = 8U;
                __Vdly__top__DOT__m1__DOT__trig = 1U;
            }
        } else if ((8U == (IData)(vlSelf->top__DOT__m1__DOT__state))) {
            if (vlSelf->top__DOT__m1__DOT__trig) {
                vlSelf->top__DOT__m1__DOT__mosi_r = 1U;
                __Vdly__top__DOT__m1__DOT__trig = 0U;
            } else {
                __Vdly__top__DOT__m1__DOT__state = 9U;
                __Vdly__top__DOT__m1__DOT__trig = 1U;
            }
        } else if ((9U == (IData)(vlSelf->top__DOT__m1__DOT__state))) {
            __Vdly__top__DOT__m1__DOT__state = 9U;
            vlSelf->top__DOT__m1__DOT__mosi_r = 0U;
            vlSelf->top__DOT__m1__DOT__cs_r = 1U;
        } else {
            __Vdly__top__DOT__m1__DOT__state = 9U;
        }
    }
    vlSelf->top__DOT__m1__DOT__state = __Vdly__top__DOT__m1__DOT__state;
    vlSelf->top__DOT__m1__DOT__trig = __Vdly__top__DOT__m1__DOT__trig;
    vlSelf->mosi = vlSelf->top__DOT__m1__DOT__mosi_r;
    vlSelf->cs = vlSelf->top__DOT__m1__DOT__cs_r;
    if ((0xcdfe60U == vlSelf->top__DOT__contador)) {
        __Vdly__top__DOT__contador = 0U;
        vlSelf->top__DOT__start = 1U;
        __Vdly__top__DOT__reset = 1U;
    } else {
        __Vdly__top__DOT__contador = ((IData)(1U) + vlSelf->top__DOT__contador);
        if (vlSelf->top__DOT__reset) {
            __Vdly__top__DOT__reset = 0U;
        }
    }
    vlSelf->top__DOT__contador = __Vdly__top__DOT__contador;
    vlSelf->top__DOT__reset = __Vdly__top__DOT__reset;
}

void Vmain___024root___eval_nba(Vmain___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vmain__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmain___024root___eval_nba\n"); );
    // Body
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vmain___024root___nba_sequent__TOP__0(vlSelf);
    }
}

void Vmain___024root___eval_triggers__ico(Vmain___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vmain___024root___dump_triggers__ico(Vmain___024root* vlSelf);
#endif  // VL_DEBUG
void Vmain___024root___eval_triggers__act(Vmain___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vmain___024root___dump_triggers__act(Vmain___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vmain___024root___dump_triggers__nba(Vmain___024root* vlSelf);
#endif  // VL_DEBUG

void Vmain___024root___eval(Vmain___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vmain__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmain___024root___eval\n"); );
    // Init
    CData/*0:0*/ __VicoContinue;
    VlTriggerVec<1> __VpreTriggered;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    vlSelf->__VicoIterCount = 0U;
    __VicoContinue = 1U;
    while (__VicoContinue) {
        __VicoContinue = 0U;
        Vmain___024root___eval_triggers__ico(vlSelf);
        if (vlSelf->__VicoTriggered.any()) {
            __VicoContinue = 1U;
            if (VL_UNLIKELY((0x64U < vlSelf->__VicoIterCount))) {
#ifdef VL_DEBUG
                Vmain___024root___dump_triggers__ico(vlSelf);
#endif
                VL_FATAL_MT("src/main.v", 1, "", "Input combinational region did not converge.");
            }
            vlSelf->__VicoIterCount = ((IData)(1U) 
                                       + vlSelf->__VicoIterCount);
            Vmain___024root___eval_ico(vlSelf);
        }
    }
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        __VnbaContinue = 0U;
        vlSelf->__VnbaTriggered.clear();
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            vlSelf->__VactContinue = 0U;
            Vmain___024root___eval_triggers__act(vlSelf);
            if (vlSelf->__VactTriggered.any()) {
                vlSelf->__VactContinue = 1U;
                if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                    Vmain___024root___dump_triggers__act(vlSelf);
#endif
                    VL_FATAL_MT("src/main.v", 1, "", "Active region did not converge.");
                }
                vlSelf->__VactIterCount = ((IData)(1U) 
                                           + vlSelf->__VactIterCount);
                __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
                vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
                Vmain___024root___eval_act(vlSelf);
            }
        }
        if (vlSelf->__VnbaTriggered.any()) {
            __VnbaContinue = 1U;
            if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
                Vmain___024root___dump_triggers__nba(vlSelf);
#endif
                VL_FATAL_MT("src/main.v", 1, "", "NBA region did not converge.");
            }
            __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
            Vmain___024root___eval_nba(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
void Vmain___024root___eval_debug_assertions(Vmain___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vmain__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vmain___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((vlSelf->btn1 & 0xfeU))) {
        Verilated::overWidthError("btn1");}
    if (VL_UNLIKELY((vlSelf->btn2 & 0xfeU))) {
        Verilated::overWidthError("btn2");}
    if (VL_UNLIKELY((vlSelf->miso & 0xfeU))) {
        Verilated::overWidthError("miso");}
}
#endif  // VL_DEBUG
