
#include <iostream>

#include <pybind11/pybind11.h>

namespace py = pybind11;

struct A
{
    A() = default;
    double d {0.0};
};

void test(A obj)
{
    std::cerr << "inside test, d: " << obj.d << std::endl;
    obj.d = 17.0;
}

void test2(A &obj)
{
    std::cerr << "inside test, d: " << obj.d << std::endl;
    obj.d = obj.d + 42.0;
}


PYBIND11_MODULE(pybindminimal, m) {
    py::class_<A>(m, "A")
        .def(py::init<>())
        .def_readwrite("d", &A::d);
    
    m.doc() = "minimal example";
    m.def("test", &test, "tests");
    m.def("test2", &test2, "tests");
    m.def("test3", &test2, "tests");
}
