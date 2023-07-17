#ifndef testBML_ELAPSED_TIME_MODULE_H
#define testBML_ELAPSED_TIME_MODULE_H

#include "../framework/module.h"
#include "../framework/state_map.h"

namespace testBML
{
/**
 * @class elapsed_time_module
 *
 * @brief An example of a very simple `differential_module`.
 *
 * This module has two inputs (`A` and `B`) and two outputs (`C` and `D`) whose
 * values are calculated according to the following equations:
 *
 * `C = A + B`              [Equation (1)]
 *
 * `D = A - 0.5 * B`        [Equation (2)]
 *
 */
class elapsed_time_module : public differential_module
{
   public:
    elapsed_time_module(
        state_map const& input_quantities,
        state_map* output_quantities)
        : differential_module(),
          // Get pointers to output quantities
          elapsed_time_op{get_op(output_quantities, "elapsed_time")}
    {
    }
    static string_vector get_inputs();
    static string_vector get_outputs();
    static std::string get_name() { return "elapsed_time_module"; }

   private:
    // Pointers to output quantities
    double* elapsed_time_op;

    // Main operation
    void do_operation() const;
};

string_vector elapsed_time_module::get_inputs()
{
    return {
    };
}

string_vector elapsed_time_module::get_outputs()
{
    return {
        "elapsed_time"   // same units as timestep
    };
}

void elapsed_time_module::do_operation() const
{
    update(elapsed_time_op, 1);
}

}  // namespace testBML
#endif
