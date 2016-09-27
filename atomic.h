#pragma once
#include <stdbool.h>
#include <stdint.h>

#define ATOMIC_UNLOCKED 0
#define ATOMIC_LOCKED  ~0

extern bool atomic_lock32(volatile uint32_t* lock);
extern void atomic_unlock32(volatile uint32_t* lock);
extern bool atomic_lock64(volatile uint64_t* lock);
extern void atomic_unlock64(volatile uint64_t* lock);

extern bool atomic_set32(volatile uint32_t* addr, uint32_t value);
extern bool atomic_set64(volatile uint64_t* addr, uint64_t value);

extern void atomic_increment32(volatile uint32_t* addr);
extern void atomic_increment64(volatile uint64_t* addr);

extern uint32_t atomic_xadd32(volatile uint32_t* addr);
extern uint64_t atomic_xadd64(volatile uint64_t* addr);

extern uint32_t atomic_xinc32(volatile uint32_t* addr);
extern uint64_t atomic_xinc64(volatile uint64_t* addr);
