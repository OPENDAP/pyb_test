# PyBind

PYBIND11_EXT = .cpython-39-darwin.so
PYBIND11_INC = -I/Users/jimg/opt/miniforge3/envs/pybind/include/python3.9 -I/Users/jimg/opt/miniforge3/envs/pybind/lib/python3.9/site-packages/pybind11/include
PYBIND11_OPS = -undefined dynamic_lookup

PYBIND_CPPFLAGS = $(PYBIND11_INC)

PYBIND_CXXFLAGS = -O0 -g3 -Wall -std=c++14

PYBIND_LDFLAGS = -shared $(PYBIND11_OPS) 

all:
	c++  $(PYBIND_CPPFLAGS) $(PYBIND_CXXFLAGS) pybindminimal.cc \
	-o pybindminimal$(PYBIND11_EXT) $(PYBIND_LDFLAGS)


clean:
	-rm -rf pybindminimal$(PYBIND11_EXT)*
