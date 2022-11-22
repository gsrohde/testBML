#ifndef R_PACKAGE_NAME_%1$s_H
#define R_PACKAGE_NAME_%1$s_H

#define ADD_PREFIX(x) R_init_ ## x
#define INIT_FUNC(x) ADD_PREFIX(x)

#define R_PACKAGE_NAME %1$s

#endif
