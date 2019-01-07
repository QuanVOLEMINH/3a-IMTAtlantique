#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <omp.h>

typedef struct list
{
  struct list *next;
  int val;
} * list_t;

list_t const empty_list = NULL;

list_t make_list(int val)
{
  list_t l = malloc(sizeof(*l));
  l->val = val;
  l->next = empty_list;
  return l;
}

void list_push_front(list_t *self, int val)
{
  list_t res = make_list(val);
  res->next = *self;
  #pragma omp critical(l)
  *self = res;
}

int list_pop_front(list_t *self)
{
  assert(*self && "pop from empty list o_O");
  int val;
  #pragma omp critical(l)
  {
    val = (*self)->val;
    list_t next = (*self)->next;
    free(*self);
    *self = next;
  }
  return val;
}

int list_front(list_t self)
{
  assert(self && "front from empty list O_o");
  return self->val;
}

size_t list_size(list_t self)
{
  size_t n = 0;
  #pragma omp critical(l)
  while (self)
  {
    n += 1;
    self = self->next;
  }
  return n;
}

static size_t process(list_t *self, int add_count, int rm_count)
{
  while (add_count--)
    list_push_front(self, add_count);
  while (rm_count--)
    list_pop_front(self);
  return list_size(*self);
}

int main(int argc, char **argv)
{
  if (argc != 3)
    return 1;
  int add_count, rm_count;
  list_t curr;
  size_t final_size;
  curr = empty_list;

  #pragma omp parallel private(add_count, rm_count) shared(curr, final_size)
  {
    add_count = atoi(argv[1]);
    rm_count = atoi(argv[2]);
    final_size = process(&curr, add_count, rm_count);
    printf("in thread %d = %zd\n", omp_get_thread_num(), final_size);
  }
  printf("total: %zd\n", final_size);
  return 0;
}
