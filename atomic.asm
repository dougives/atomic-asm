public atomic_lock32
public atomic_unlock32
public atomic_lock64
public atomic_unlock64
public atomic_set64
public atomic_set32
public atomic_increment64
public atomic_increment32

; assumes threads aren't using the same rsp...

.code

atomic_lock32 proc

	xor eax, eax
	lock cmpxchg dword ptr [rcx], esp
	jne atomic_lock_blocked
	dec eax
	ret

atomic_lock_blocked:
	ret

atomic_lock32 endp

;------------------------------------------------------------------------------

atomic_unlock32 proc

	mov eax, dword ptr [rcx]
	lock xor dword ptr [rcx], eax
	ret

atomic_unlock32 endp

;------------------------------------------------------------------------------

atomic_lock64 proc

	xor eax, eax
	lock cmpxchg qword ptr [rcx], rsp
	jne atomic_lock_blocked
	dec eax
	ret

atomic_lock_blocked:
	ret

atomic_lock64 endp

;------------------------------------------------------------------------------

atomic_unlock64 proc

	mov rax, qword ptr [rcx]
	lock xor qword ptr [rcx], rax
	ret

atomic_unlock64 endp

;------------------------------------------------------------------------------

atomic_set64 proc

	mov rax, qword ptr [rcx]
	lock cmpxchg qword ptr [rcx], rdx
	jne atomic_set64_blocked
	xor eax, eax
	dec eax
	ret

atomic_set64_blocked:
	xor eax, eax
	ret

atomic_set64 endp

;------------------------------------------------------------------------------

atomic_set32 proc

	mov eax, dword ptr [rcx]
	lock cmpxchg dword ptr [rcx], edx
	jne atomic_set32_blocked
	xor eax, eax
	dec eax
	ret

atomic_set32_blocked:
	xor eax, eax
	ret

atomic_set32 endp

;------------------------------------------------------------------------------

atomic_increment64 proc

	lock inc qword ptr [rcx]
	ret

atomic_increment64 endp

;------------------------------------------------------------------------------

atomic_increment32 proc

	lock inc dword ptr [rcx]
	ret

atomic_increment32 endp

;------------------------------------------------------------------------------

end