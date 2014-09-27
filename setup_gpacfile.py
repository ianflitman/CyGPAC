
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize


extensions = [
    Extension("gpacfile", ["gpacfile.pyx"],
              include_dirs = ['/usr/include/gpac'],
              libraries = ['gpac'],
              library_dirs = ['/home/ian/projects/tools/gpac/bin/gcc/']
              )
]

setup(
    ext_modules = cythonize(extensions)
)