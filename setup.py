
from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize


extensions = [
        Extension("gpacfile", ["gpacfile.pyx"],
                  include_dirs = ['/home/ian/projects/tools/gpac/include'],
                  #libraries = ['gpfile'],
                  #library_dirs = ['/home/ian/projects/tools/gpac/bin/gcc'],
                  #library_dirs = ['/home/ian/gpac'],
                  language='c',
                  extra_objects=["/home/ian/projects/tools/gpac/bin/gcc/libgpac_static.a"]
                  )
]

setup(
    ext_modules = cythonize(extensions)
)