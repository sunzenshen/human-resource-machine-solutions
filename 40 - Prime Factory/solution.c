/* This hacky division implementation requires the following preconditions:
 * numerator >= 0 : everything will break if that's not the case
 * divisor   >  0 : loop will never end if that's not the case
 * div_result initialized to 0 before macro is invoked
 * mod_result has no requirements, but will be overwritten
 */
#define div(numerator, divisor, div_result, mod_result) { \
            while(numerator >= 0) {                       \
                ++div_result;                             \
                numerator -= divisor;                     \
            }                                             \
            --div_result;                                 \
            mod_result = numerator + divisor;             \
        }

void Prime_Factory(int inbox)
{
  // frame top
  int zero = 0;
  int two = zero + 2;
  int candidate = two;
  int outbox = 9999;
  int target = inbox;

  // frame div
  int numerator  = 2222;
  int divisor    = 2333;
  int div_result = 2444;
  int mod_result = 2555;

  while (target != candidate)
  {
    numerator = target;
    divisor = candidate;
    div_result = 0;
    div(numerator, divisor, div_result, mod_result);
    if (mod_result != 0)
    {
      ++candidate;
    }
    else
    {
      target = div_result;
      outbox = candidate;
    }
  }
  outbox = target;
}
