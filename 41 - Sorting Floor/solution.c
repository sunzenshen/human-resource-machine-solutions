#define MAX_ARRAY_SIZE /*0 thru*/ 19

void Sorting_Floor(int* input_array)
{
  int ZERO = 0;           // _24
  int i = ZERO;           // _23
  int end_index = ZERO;   // _22
  int num_swaps = ZERO+1; // _21 init for one sort cycle
  int a = 777;            // _20
  int b = 888;            // _19
  int outbox = 999;
  int floor[MAX_ARRAY_SIZE];

  // Copy inbox items onto floor
  for(/*i = ZERO*/; *input_array!=0; ++input_array, ++i)
  {
    floor[i] = *input_array;
  }
  floor[i] = 0;
  end_index = i;  // list size: does not include last 0
  end_index -= 2; // HACK: start right most index that has one comparable to right

  // Bubble Sort
  while (num_swaps != 0)
  {
    num_swaps = ZERO;
    for(i=end_index; i>=0; --i)
    {
      a = floor[i]; // [a][b]
      ++i;
      b = floor[i];
      if ((b-a)>=0) // [a=3][b=7]  7-3=4
      {
        --i; // don't swap, continue
      }
      else
      {
        // swap
        floor[i]=a;
        --i;
        floor[i]=b;
        ++num_swaps;
      }
    }
  }

  // Copy sorted floor onto outbox
  for(i = ZERO; floor[i]!=0; ++i)
  {
     outbox = floor[i];
  }
  // don't put end 0 to outbox
}
