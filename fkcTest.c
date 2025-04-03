#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   printf(1, "number of forks when program starts: %d\n", fkc(1) );
   if (fork() != 0) {
      if (fork() != 0) {
         printf(1, "number of forks after two more forks: %d\n", fkc(1) );
         wait();
         wait();
         printf(1, "number of forks after fork count cleared: %d\n", fkc(0) );
         if (fork() != 0) {
            if (fork() != 0) {
               if (fork() != 0) {
                  wait();
                  wait();
                  wait();
                  printf(1, "number of forks after three more forks: %d\n", fkc(1) );
               }
            }
         }
      }
   }
   exit();
}
