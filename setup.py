
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize


extensions = [
        Extension("gpactest", ["gpactest.pyx"],
                  include_dirs = ['/home/ian/projects/tools/gpac/include'],
                  libraries = ['gpac'],
                  library_dirs = ['/home/ian/projects/tools/gpac/bin/gcc']
                  )
]

setup(
    ext_modules = cythonize(extensions)
)