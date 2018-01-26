// C LIBRARY //
#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include <iostream>
//#include <stdlib.h>     /* system, NULL, EXIT_FAILURE, strtol, atoi  */

//#include <cmath>
//#include <time.h>

// STANDARD LIBRARY, STD::xyz //
#include <vector>
#include <map>
#include <string>


#include "..\\include\\show_time.h" 

//#define UTC (0)
int main(int argc, char *argv[]) {

	std::cout<<"Hello world"<<std::endl;
	
	time_t rawtime;
	time(&rawtime);
	
	struct tm* ptm_local;
	ptm_local = localtime(&rawtime);
	//printf ("Current local time and date: %s", asctime(ptm_local));
	//printf ("Current : %2d:%02d\n", (ptm_local->tm_hour)%24, ptm_local->tm_min);
	std::cout << "Local time\t" << ptm_local->tm_year + 1900 << "-" << ptm_local->tm_mon+1 << "-" << ptm_local->tm_mday << " " << ptm_local->tm_hour << ":" << ptm_local->tm_min << ":" << ptm_local->tm_sec <<std::endl; 
  
	struct tm* ptm;
	//std::cout<<rawtime<<std::endl;
	ptm = gmtime(&rawtime);
	std::cout << "UTC time\t" << ptm->tm_year + 1900 << "-" << ptm->tm_mon+1 << "-" << ptm->tm_mday << " " << ptm->tm_hour << ":" << ptm->tm_min << ":" << ptm->tm_sec <<std::endl; 
	
	show_time(ptm);
	return 0;
}