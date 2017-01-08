/* This division macro is tailored for the level Re-Coordinator in Human Resource Machine.
 * This hacky implementation requires the following preconditions:
 * numerator >= 0 : everything will break if that's not the case
 * divisor   >  0 : loop will never end if that's not the case
 * div_result initialized to 0 before macro is invoked
 * mod_result has no requirements, but will be overwritten
 */
#define arg0_div_by_arg1(numerator, divisor, div_result, mod_result) { \
            while(numerator >= 0) {                                    \
                ++div_result;                                          \
                numerator -= divisor;                                  \
            }                                                          \
            --div_result;                                              \
            mod_result = numerator + divisor;                          \
        }

void ReCoordinator(int input)
{
  int ZERO = 0;      // _14
  int DIMENSION = 4; // _15
  int div_result = ZERO;
  int mod_result = 1337; // not needed, but want to annotate rbp label near top of assembly
  arg0_div_by_arg1(input, DIMENSION, div_result, mod_result);
  // put mod_result then div_result to the outbox
}
