from setuptools import Extension, setup
from Cython.Build import cythonize
import numpy

ext_modules = [
    Extension(
        "pylinked.c_linked",
        [
            "pylinked/cython/c_linked.pyx",
        ],
        libraries=['linked'],
        library_dirs=['./local/lib'],
        include_dirs=['./local/include'],
        extra_compile_args=["-O3", "-fopenmp"],
        extra_link_args=[
            '-fopenmp',
            '-DSOME_DEFINE_OPT',
        ],
        define_macros=[
            (
                "NPY_NO_DEPRECATED_API",
                "NPY_1_7_API_VERSION"
            )
        ],
        runtime_library_dirs=["./local/lib"]
    ),
]

setup(
    ext_modules=cythonize(ext_modules),
    include_dirs=[numpy.get_include()]
)
