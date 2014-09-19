__author__ = 'ian'

from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

setup(
    ext_modules = cythonize([
        Extension("gpacfile", ["gpacfile.pyx"],
                     libraries=["libgpac"])
    ])
)
#ext_modules = cythonize("gpacfile.pyx")