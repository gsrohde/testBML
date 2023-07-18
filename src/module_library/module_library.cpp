#include "module_library.h"
#include "../framework/module_creator.h"  // for create_mc

// Include all the header files that define the modules.
#include "example_module.h"
#include "elapsed_time_module.h"
#include "solar_position_michalsky.h"
#include "thermal_time_linear.h"

creator_map testBML::module_library::library_entries =
{
 {"example_module", &create_mc<example_module>},
 {"elapsed_time_module", &create_mc<elapsed_time_module>},
 {"solar_position_michalsky", &create_mc<solar_position_michalsky>},
 {"thermal_time_linear", &create_mc<thermal_time_linear>}
};
