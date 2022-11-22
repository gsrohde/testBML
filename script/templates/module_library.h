#ifndef MODULE_LIBRARY_%1$s_H
#define MODULE_LIBRARY_%1$s_H

#include "../R_PACKAGE_NAME.h"
#include "../framework/module_creator.h"  // for module_creator and creator_map

namespace R_PACKAGE_NAME
{
class module_library
{
   public:
    static creator_map library_entries;
};

}  // namespace R_PACKAGE_NAME

#endif
