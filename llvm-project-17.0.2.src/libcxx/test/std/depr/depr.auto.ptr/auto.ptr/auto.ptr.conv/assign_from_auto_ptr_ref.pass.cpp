//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// <memory>

// template <class X> class auto_ptr;

// auto_ptr& operator=(auto_ptr_ref<X> r) throw()

// REQUIRES: c++03 || c++11 || c++14
// ADDITIONAL_COMPILE_FLAGS: -D_LIBCPP_DISABLE_DEPRECATION_WARNINGS

#include <memory>
#include <cassert>

#include "test_macros.h"
#include "../A.h"

void
test()
{
    {
    A* p1 = new A(1);
    std::auto_ptr<A> ap1(p1);
    std::auto_ptr_ref<A> apr = ap1;
    std::auto_ptr<A> ap2(new A(2));
    ap2 = apr;
    assert(A::count == 1);
    assert(ap2.get() == p1);
    assert(ap1.get() == 0);
    }
    assert(A::count == 0);
}

int main(int, char**)
{
    test();

  return 0;
}