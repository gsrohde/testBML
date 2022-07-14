#include "module_library.h"
#include "../framework/module_creator.h"  // for create_mc

// When creating a new module library R package, it will be necessary to modify
// the namespace in this file to match the one defined in `module_library.h`.
// See that file for more details. It will also be necessary to include
// different module header files and to make corresponding changes to the
// entries in the `creator_map` table.

// Include all the header files that define the modules.
#include "example_module.h"

creator_map skelBML::module_library::library_entries =
{
     {"example_module", &create_mc<example_module>}
};
