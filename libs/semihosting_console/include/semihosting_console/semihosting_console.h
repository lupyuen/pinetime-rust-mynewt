/*
 * This is a sample header file for your package.  Feel free to delete this
 * file, or rename it.
 *
 * Package include files are located under the <pkg>/include/<pkg-name>
 * directory.  When referencing include files in this directory, the
 * include statement should be:
 *
 * #include "pkg-name/file-name.h"
 *
 * If you are referencing package includes from another package, you must
 * list the package who's includes you are referencing as a dependency in
 * the pkg.yml file.  By adding the package as a dependency, newt will
 * automatically add -I<pkg>/include to the CFLAGS when compiling your
 * package.
 *
 * If you want to provide architecture specific header files, you can do
 * this by putting it into the "arch/your-arch/pkg-name".  For example,
 * to have a header file that is overrode for Cortex-M4 architectures, you
 * would put the file in the following location:
 *
 * * <your-pkg>/include/<your-pkg>/arch/cortex_m4/<your-pkg>/file-name.h
 *
 * And you can then include it with the following include statement:
 *
 * #include "pkg-name/file-name.h"
 *
 * And depending on what architecture is specified (usually controlled by
 * BSP or MCU definition), the correct architecture directory will be
 * included.
 */
