#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include <sys/time.h>
#include <xmmintrin.h>

float horizontal_max_Vec4(__m128 x) {
    __m128 max1 = _mm_shuffle_ps(x, x, _MM_SHUFFLE(0,0,3,2));
    __m128 max2 = _mm_max_ps(x, max1);
    __m128 max3 = _mm_shuffle_ps(max2, max2, _MM_SHUFFLE(0,0,0,1));
    __m128 max4 = _mm_max_ps(max2, max3);
    float result = _mm_cvtss_f32(max4);
    return result;
}

static void minmax(float const* start, float const* stop, float* min, float* max) {
	// giveme giveme a man fmin
	float m_min;

	__m128 m_max = _mm_loadu_ps(start);
	
	while (start < stop){
		start = start + 4;
		__m128 cur = _mm_loadu_ps(start);
  		m_max = _mm_max_ps(m_max, cur);
	}
	printf("result %.3f\n", horizontal_max_Vec4(m_max));
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
