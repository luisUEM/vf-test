



def method1(value):
  v1 = splitter(value)
  v2 = splitter(value)[::-1]
  
  return all([v2[i] == v for i,v in enumerate(v1)])

def method2(value1, value2):
  r = 0
  for i in range(value1, value2+1):
    r = r+i if (i%2 == 1) else r
  return r

def method3(value1, value2):
  lv1 = splitter(value1)
  lv1.sort()
  lv2 = splitter(value2)
  lv2.sort()
  return ''.join(lv1) == ''.join(lv2)

def splitter(v):
  return v.lower().split()