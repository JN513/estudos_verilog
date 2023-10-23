// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vmain.h"
#include "Vmain__Syms.h"

//============================================================
// Constructors

Vmain::Vmain(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vmain__Syms(contextp(), _vcname__, this)}
    , clk{vlSymsp->TOP.clk}
    , btn1{vlSymsp->TOP.btn1}
    , btn2{vlSymsp->TOP.btn2}
    , led{vlSymsp->TOP.led}
    , mosi{vlSymsp->TOP.mosi}
    , cs{vlSymsp->TOP.cs}
    , sclk{vlSymsp->TOP.sclk}
    , miso{vlSymsp->TOP.miso}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vmain::Vmain(const char* _vcname__)
    : Vmain(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vmain::~Vmain() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vmain___024root___eval_debug_assertions(Vmain___024root* vlSelf);
#endif  // VL_DEBUG
void Vmain___024root___eval_static(Vmain___024root* vlSelf);
void Vmain___024root___eval_initial(Vmain___024root* vlSelf);
void Vmain___024root___eval_settle(Vmain___024root* vlSelf);
void Vmain___024root___eval(Vmain___024root* vlSelf);

void Vmain::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vmain::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vmain___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vmain___024root___eval_static(&(vlSymsp->TOP));
        Vmain___024root___eval_initial(&(vlSymsp->TOP));
        Vmain___024root___eval_settle(&(vlSymsp->TOP));
    }
    // MTask 0 start
    VL_DEBUG_IF(VL_DBG_MSGF("MTask0 starting\n"););
    Verilated::mtaskId(0);
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vmain___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfThreadMTask(vlSymsp->__Vm_evalMsgQp);
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vmain::eventsPending() { return false; }

uint64_t Vmain::nextTimeSlot() {
    VL_FATAL_MT(__FILE__, __LINE__, "", "%Error: No delays in the design");
    return 0;
}

//============================================================
// Utilities

const char* Vmain::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vmain___024root___eval_final(Vmain___024root* vlSelf);

VL_ATTR_COLD void Vmain::final() {
    Vmain___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vmain::hierName() const { return vlSymsp->name(); }
const char* Vmain::modelName() const { return "Vmain"; }
unsigned Vmain::threads() const { return 1; }
void Vmain::prepareClone() const { contextp()->prepareClone(); }
void Vmain::atClone() const {
    contextp()->threadPoolpOnClone();
}
