#include "../include/show_time.h"
void show_time(struct tm* ptm) {
	//std::cout << "Function time\t" << ptm->tm_year + 1900 << "-" << ptm->tm_mon+1 << "-" << ptm->tm_mday << " " << ptm->tm_hour << ":" << ptm->tm_min << ":" << ptm->tm_sec <<std::endl;
	printf("%d-%02d-%02d %02d:%02d:%02d\n", ptm->tm_year+1900, ptm->tm_mon+1, ptm->tm_mday,ptm->tm_hour, ptm->tm_min, ptm->tm_sec);
	//return void;
}
