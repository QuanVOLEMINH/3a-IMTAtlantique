#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <pthread.h>



typedef struct list {
      struct list* next;
      int val;
} * list_t;

typedef struct test_params {
	list_t list;
   int add;
   int sub;
} test_params;


list_t const empty_list = NULL;

list_t make_list(int val) {
      list_t l = malloc(sizeof(*l));
      l->val = val;
      l->next = empty_list;
      return l;
}

void list_push_front(list_t *self, int val) {
      list_t res = make_list(val);
      res->next = *self;
      *self = res;
}

int list_pop_front(list_t* self) {
      assert(*self && "pop from empty list o_O");
      int val = (*self)->val;
      list_t next = (*self)->next;
      free(*self);
      *self = next;
      return val;
}

int list_front(list_t self) {
      assert(self && "front from empty list O_o");
      return self->val;
}

size_t list_size(list_t self) {
      size_t n = 0;
      while(self) {
        n += 1;
        self = self->next;
      }
      return n;
}

static size_t process(list_t *self, int add_count, int rm_count) {
      while(add_count--)
        list_push_front(self, add_count);
      while(rm_count--)
        list_pop_front(self);
      return list_size(*self);
}

void * test_process(void *i){
	int j;
j = (int)i;
	printf("i = %d\n", j);
}

#define num_threads 10

int main(int argc, char** argv) {
      if(argc != 3) return 1;	   

		pthread_t tid;
	   void *status;
list_t curr = empty_list;
int primeArray[num_threads];
int pa = 5;


		 test_params *args1 = malloc(sizeof *args1);
		args1->add = 5;
		args1->sub=2;
		args1->list = curr;

	   pthread_create(&tid, NULL, test_process, &pa);
	   pthread_join(tid, &status);

	   printf("%d\n",*(int*)status);   


      /*int add_count = atoi(argv[1]);
      int rm_count = atoi(argv[2]);
      
      size_t final_size = process(&curr, add_count, rm_count);
      printf("%zd\n", final_size);*/
      return 0;

}
