#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <sys/time.h>
#include <omp.h>

static void minmax(float const* start, float const* stop, float* min, float* max) {
	// giveme giveme a man fmin
	float const* i;
	float m_min, m_max, temp;
	omp_set_num_threads(4);
	#pragma omp parallel for private(temp) reduction(max : m_max) reduction(min: m_min)
	for (i = start; i < stop; i++){
		temp = *(i);
		/*printf("thread id = %d\n", omp_get_thread_num());*/
		if (m_min > temp){
			m_min = temp;
		}
		if (temp > m_max){
			m_max = temp;
		}
	}	
	
	*min = m_min;
	*max = m_max;
}

int main(int argc, char**argv) {
	if(argc != 2) return 1;

	int n = atoi(argv[1]);
	float* data = malloc(n * sizeof(*data));
	for(int i = 0; i < n; ++i)
	{
		data[i] = (unsigned)i * (INT_MAX / 3); // pourquoi ce cast?i
		/*printf("element %d: %.3f\n", i, data[i]);*/
	}

	struct timeval start, stop;
	float min, max;
	gettimeofday(&start, NULL);
	minmax(data, data + n, &min, &max);
	gettimeofday(&stop, NULL);
	printf("min = %f - max = %f\n", min, max);
	printf("Temps calcul = %lf ms\n", (stop.tv_sec - start.tv_sec) * 1000. + (stop.tv_usec - start.tv_usec) / 1000.);
	return 0;
}
