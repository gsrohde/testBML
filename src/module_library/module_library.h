#ifndef MODULE_LIBRARY_H
#define MODULE_LIBRARY_H

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
