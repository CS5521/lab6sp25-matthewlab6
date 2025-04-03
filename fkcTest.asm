
_fkcTest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int
main(int argc, char * argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
   printf(1, "number of forks when program starts: %d\n", fkc(1) );
   9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10:	e8 e7 03 00 00       	call   3fc <fkc>
  15:	89 44 24 08          	mov    %eax,0x8(%esp)
  19:	c7 44 24 04 b0 08 00 	movl   $0x8b0,0x4(%esp)
  20:	00 
  21:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  28:	e8 b7 04 00 00       	call   4e4 <printf>
   if (fork() != 0) {
  2d:	e8 1a 03 00 00       	call   34c <fork>
  32:	85 c0                	test   %eax,%eax
  34:	0f 84 ad 00 00 00    	je     e7 <main+0xe7>
      if (fork() != 0) {
  3a:	e8 0d 03 00 00       	call   34c <fork>
  3f:	85 c0                	test   %eax,%eax
  41:	0f 84 a0 00 00 00    	je     e7 <main+0xe7>
         printf(1, "number of forks after two more forks: %d\n", fkc(1) );
  47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4e:	e8 a9 03 00 00       	call   3fc <fkc>
  53:	89 44 24 08          	mov    %eax,0x8(%esp)
  57:	c7 44 24 04 dc 08 00 	movl   $0x8dc,0x4(%esp)
  5e:	00 
  5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  66:	e8 79 04 00 00       	call   4e4 <printf>
         wait();
  6b:	e8 ec 02 00 00       	call   35c <wait>
         wait();
  70:	e8 e7 02 00 00       	call   35c <wait>
         printf(1, "number of forks after fork count cleared: %d\n", fkc(0) );
  75:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  7c:	e8 7b 03 00 00       	call   3fc <fkc>
  81:	89 44 24 08          	mov    %eax,0x8(%esp)
  85:	c7 44 24 04 08 09 00 	movl   $0x908,0x4(%esp)
  8c:	00 
  8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  94:	e8 4b 04 00 00       	call   4e4 <printf>
         if (fork() != 0) {
  99:	e8 ae 02 00 00       	call   34c <fork>
  9e:	85 c0                	test   %eax,%eax
  a0:	74 45                	je     e7 <main+0xe7>
            if (fork() != 0) {
  a2:	e8 a5 02 00 00       	call   34c <fork>
  a7:	85 c0                	test   %eax,%eax
  a9:	74 3c                	je     e7 <main+0xe7>
               if (fork() != 0) {
  ab:	e8 9c 02 00 00       	call   34c <fork>
  b0:	85 c0                	test   %eax,%eax
  b2:	74 33                	je     e7 <main+0xe7>
                  wait();
  b4:	e8 a3 02 00 00       	call   35c <wait>
                  wait();
  b9:	e8 9e 02 00 00       	call   35c <wait>
                  wait();
  be:	e8 99 02 00 00       	call   35c <wait>
                  printf(1, "number of forks after three more forks: %d\n", fkc(1) );
  c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ca:	e8 2d 03 00 00       	call   3fc <fkc>
  cf:	89 44 24 08          	mov    %eax,0x8(%esp)
  d3:	c7 44 24 04 38 09 00 	movl   $0x938,0x4(%esp)
  da:	00 
  db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e2:	e8 fd 03 00 00       	call   4e4 <printf>
               }
            }
         }
      }
   }
   exit();
  e7:	e8 68 02 00 00       	call   354 <exit>

000000ec <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  ec:	55                   	push   %ebp
  ed:	89 e5                	mov    %esp,%ebp
  ef:	57                   	push   %edi
  f0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  f4:	8b 55 10             	mov    0x10(%ebp),%edx
  f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  fa:	89 cb                	mov    %ecx,%ebx
  fc:	89 df                	mov    %ebx,%edi
  fe:	89 d1                	mov    %edx,%ecx
 100:	fc                   	cld    
 101:	f3 aa                	rep stos %al,%es:(%edi)
 103:	89 ca                	mov    %ecx,%edx
 105:	89 fb                	mov    %edi,%ebx
 107:	89 5d 08             	mov    %ebx,0x8(%ebp)
 10a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 10d:	5b                   	pop    %ebx
 10e:	5f                   	pop    %edi
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    

00000111 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 111:	55                   	push   %ebp
 112:	89 e5                	mov    %esp,%ebp
 114:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 117:	8b 45 08             	mov    0x8(%ebp),%eax
 11a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 11d:	90                   	nop
 11e:	8b 45 08             	mov    0x8(%ebp),%eax
 121:	8d 50 01             	lea    0x1(%eax),%edx
 124:	89 55 08             	mov    %edx,0x8(%ebp)
 127:	8b 55 0c             	mov    0xc(%ebp),%edx
 12a:	8d 4a 01             	lea    0x1(%edx),%ecx
 12d:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 130:	0f b6 12             	movzbl (%edx),%edx
 133:	88 10                	mov    %dl,(%eax)
 135:	0f b6 00             	movzbl (%eax),%eax
 138:	84 c0                	test   %al,%al
 13a:	75 e2                	jne    11e <strcpy+0xd>
    ;
  return os;
 13c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 13f:	c9                   	leave  
 140:	c3                   	ret    

00000141 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 144:	eb 08                	jmp    14e <strcmp+0xd>
    p++, q++;
 146:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 14a:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 14e:	8b 45 08             	mov    0x8(%ebp),%eax
 151:	0f b6 00             	movzbl (%eax),%eax
 154:	84 c0                	test   %al,%al
 156:	74 10                	je     168 <strcmp+0x27>
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 10             	movzbl (%eax),%edx
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	0f b6 00             	movzbl (%eax),%eax
 164:	38 c2                	cmp    %al,%dl
 166:	74 de                	je     146 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	0f b6 00             	movzbl (%eax),%eax
 16e:	0f b6 d0             	movzbl %al,%edx
 171:	8b 45 0c             	mov    0xc(%ebp),%eax
 174:	0f b6 00             	movzbl (%eax),%eax
 177:	0f b6 c0             	movzbl %al,%eax
 17a:	29 c2                	sub    %eax,%edx
 17c:	89 d0                	mov    %edx,%eax
}
 17e:	5d                   	pop    %ebp
 17f:	c3                   	ret    

00000180 <strlen>:

uint
strlen(const char *s)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 186:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 18d:	eb 04                	jmp    193 <strlen+0x13>
 18f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 193:	8b 55 fc             	mov    -0x4(%ebp),%edx
 196:	8b 45 08             	mov    0x8(%ebp),%eax
 199:	01 d0                	add    %edx,%eax
 19b:	0f b6 00             	movzbl (%eax),%eax
 19e:	84 c0                	test   %al,%al
 1a0:	75 ed                	jne    18f <strlen+0xf>
    ;
  return n;
 1a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1a5:	c9                   	leave  
 1a6:	c3                   	ret    

000001a7 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1a7:	55                   	push   %ebp
 1a8:	89 e5                	mov    %esp,%ebp
 1aa:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1ad:	8b 45 10             	mov    0x10(%ebp),%eax
 1b0:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 1be:	89 04 24             	mov    %eax,(%esp)
 1c1:	e8 26 ff ff ff       	call   ec <stosb>
  return dst;
 1c6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1c9:	c9                   	leave  
 1ca:	c3                   	ret    

000001cb <strchr>:

char*
strchr(const char *s, char c)
{
 1cb:	55                   	push   %ebp
 1cc:	89 e5                	mov    %esp,%ebp
 1ce:	83 ec 04             	sub    $0x4,%esp
 1d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d4:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1d7:	eb 14                	jmp    1ed <strchr+0x22>
    if(*s == c)
 1d9:	8b 45 08             	mov    0x8(%ebp),%eax
 1dc:	0f b6 00             	movzbl (%eax),%eax
 1df:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1e2:	75 05                	jne    1e9 <strchr+0x1e>
      return (char*)s;
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	eb 13                	jmp    1fc <strchr+0x31>
  for(; *s; s++)
 1e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1ed:	8b 45 08             	mov    0x8(%ebp),%eax
 1f0:	0f b6 00             	movzbl (%eax),%eax
 1f3:	84 c0                	test   %al,%al
 1f5:	75 e2                	jne    1d9 <strchr+0xe>
  return 0;
 1f7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1fc:	c9                   	leave  
 1fd:	c3                   	ret    

000001fe <gets>:

char*
gets(char *buf, int max)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 204:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 20b:	eb 4c                	jmp    259 <gets+0x5b>
    cc = read(0, &c, 1);
 20d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 214:	00 
 215:	8d 45 ef             	lea    -0x11(%ebp),%eax
 218:	89 44 24 04          	mov    %eax,0x4(%esp)
 21c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 223:	e8 44 01 00 00       	call   36c <read>
 228:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 22b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 22f:	7f 02                	jg     233 <gets+0x35>
      break;
 231:	eb 31                	jmp    264 <gets+0x66>
    buf[i++] = c;
 233:	8b 45 f4             	mov    -0xc(%ebp),%eax
 236:	8d 50 01             	lea    0x1(%eax),%edx
 239:	89 55 f4             	mov    %edx,-0xc(%ebp)
 23c:	89 c2                	mov    %eax,%edx
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	01 c2                	add    %eax,%edx
 243:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 247:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 249:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 24d:	3c 0a                	cmp    $0xa,%al
 24f:	74 13                	je     264 <gets+0x66>
 251:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 255:	3c 0d                	cmp    $0xd,%al
 257:	74 0b                	je     264 <gets+0x66>
  for(i=0; i+1 < max; ){
 259:	8b 45 f4             	mov    -0xc(%ebp),%eax
 25c:	83 c0 01             	add    $0x1,%eax
 25f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 262:	7c a9                	jl     20d <gets+0xf>
      break;
  }
  buf[i] = '\0';
 264:	8b 55 f4             	mov    -0xc(%ebp),%edx
 267:	8b 45 08             	mov    0x8(%ebp),%eax
 26a:	01 d0                	add    %edx,%eax
 26c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 272:	c9                   	leave  
 273:	c3                   	ret    

00000274 <stat>:

int
stat(const char *n, struct stat *st)
{
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 27a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 281:	00 
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	89 04 24             	mov    %eax,(%esp)
 288:	e8 07 01 00 00       	call   394 <open>
 28d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 290:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 294:	79 07                	jns    29d <stat+0x29>
    return -1;
 296:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 29b:	eb 23                	jmp    2c0 <stat+0x4c>
  r = fstat(fd, st);
 29d:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a7:	89 04 24             	mov    %eax,(%esp)
 2aa:	e8 fd 00 00 00       	call   3ac <fstat>
 2af:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b5:	89 04 24             	mov    %eax,(%esp)
 2b8:	e8 bf 00 00 00       	call   37c <close>
  return r;
 2bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2c0:	c9                   	leave  
 2c1:	c3                   	ret    

000002c2 <atoi>:

int
atoi(const char *s)
{
 2c2:	55                   	push   %ebp
 2c3:	89 e5                	mov    %esp,%ebp
 2c5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2c8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2cf:	eb 25                	jmp    2f6 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2d1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2d4:	89 d0                	mov    %edx,%eax
 2d6:	c1 e0 02             	shl    $0x2,%eax
 2d9:	01 d0                	add    %edx,%eax
 2db:	01 c0                	add    %eax,%eax
 2dd:	89 c1                	mov    %eax,%ecx
 2df:	8b 45 08             	mov    0x8(%ebp),%eax
 2e2:	8d 50 01             	lea    0x1(%eax),%edx
 2e5:	89 55 08             	mov    %edx,0x8(%ebp)
 2e8:	0f b6 00             	movzbl (%eax),%eax
 2eb:	0f be c0             	movsbl %al,%eax
 2ee:	01 c8                	add    %ecx,%eax
 2f0:	83 e8 30             	sub    $0x30,%eax
 2f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f6:	8b 45 08             	mov    0x8(%ebp),%eax
 2f9:	0f b6 00             	movzbl (%eax),%eax
 2fc:	3c 2f                	cmp    $0x2f,%al
 2fe:	7e 0a                	jle    30a <atoi+0x48>
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	0f b6 00             	movzbl (%eax),%eax
 306:	3c 39                	cmp    $0x39,%al
 308:	7e c7                	jle    2d1 <atoi+0xf>
  return n;
 30a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 30d:	c9                   	leave  
 30e:	c3                   	ret    

0000030f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 30f:	55                   	push   %ebp
 310:	89 e5                	mov    %esp,%ebp
 312:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 315:	8b 45 08             	mov    0x8(%ebp),%eax
 318:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 31b:	8b 45 0c             	mov    0xc(%ebp),%eax
 31e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 321:	eb 17                	jmp    33a <memmove+0x2b>
    *dst++ = *src++;
 323:	8b 45 fc             	mov    -0x4(%ebp),%eax
 326:	8d 50 01             	lea    0x1(%eax),%edx
 329:	89 55 fc             	mov    %edx,-0x4(%ebp)
 32c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 32f:	8d 4a 01             	lea    0x1(%edx),%ecx
 332:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 335:	0f b6 12             	movzbl (%edx),%edx
 338:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 33a:	8b 45 10             	mov    0x10(%ebp),%eax
 33d:	8d 50 ff             	lea    -0x1(%eax),%edx
 340:	89 55 10             	mov    %edx,0x10(%ebp)
 343:	85 c0                	test   %eax,%eax
 345:	7f dc                	jg     323 <memmove+0x14>
  return vdst;
 347:	8b 45 08             	mov    0x8(%ebp),%eax
}
 34a:	c9                   	leave  
 34b:	c3                   	ret    

0000034c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 34c:	b8 01 00 00 00       	mov    $0x1,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <exit>:
SYSCALL(exit)
 354:	b8 02 00 00 00       	mov    $0x2,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <wait>:
SYSCALL(wait)
 35c:	b8 03 00 00 00       	mov    $0x3,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <pipe>:
SYSCALL(pipe)
 364:	b8 04 00 00 00       	mov    $0x4,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <read>:
SYSCALL(read)
 36c:	b8 05 00 00 00       	mov    $0x5,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <write>:
SYSCALL(write)
 374:	b8 10 00 00 00       	mov    $0x10,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <close>:
SYSCALL(close)
 37c:	b8 15 00 00 00       	mov    $0x15,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <kill>:
SYSCALL(kill)
 384:	b8 06 00 00 00       	mov    $0x6,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <exec>:
SYSCALL(exec)
 38c:	b8 07 00 00 00       	mov    $0x7,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <open>:
SYSCALL(open)
 394:	b8 0f 00 00 00       	mov    $0xf,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <mknod>:
SYSCALL(mknod)
 39c:	b8 11 00 00 00       	mov    $0x11,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <unlink>:
SYSCALL(unlink)
 3a4:	b8 12 00 00 00       	mov    $0x12,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <fstat>:
SYSCALL(fstat)
 3ac:	b8 08 00 00 00       	mov    $0x8,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <link>:
SYSCALL(link)
 3b4:	b8 13 00 00 00       	mov    $0x13,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <mkdir>:
SYSCALL(mkdir)
 3bc:	b8 14 00 00 00       	mov    $0x14,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <chdir>:
SYSCALL(chdir)
 3c4:	b8 09 00 00 00       	mov    $0x9,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <dup>:
SYSCALL(dup)
 3cc:	b8 0a 00 00 00       	mov    $0xa,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <getpid>:
SYSCALL(getpid)
 3d4:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <sbrk>:
SYSCALL(sbrk)
 3dc:	b8 0c 00 00 00       	mov    $0xc,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <sleep>:
SYSCALL(sleep)
 3e4:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <uptime>:
SYSCALL(uptime)
 3ec:	b8 0e 00 00 00       	mov    $0xe,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <hw>:
SYSCALL(hw)
 3f4:	b8 16 00 00 00       	mov    $0x16,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <fkc>:
SYSCALL(fkc)
 3fc:	b8 17 00 00 00       	mov    $0x17,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 404:	55                   	push   %ebp
 405:	89 e5                	mov    %esp,%ebp
 407:	83 ec 18             	sub    $0x18,%esp
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 410:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 417:	00 
 418:	8d 45 f4             	lea    -0xc(%ebp),%eax
 41b:	89 44 24 04          	mov    %eax,0x4(%esp)
 41f:	8b 45 08             	mov    0x8(%ebp),%eax
 422:	89 04 24             	mov    %eax,(%esp)
 425:	e8 4a ff ff ff       	call   374 <write>
}
 42a:	c9                   	leave  
 42b:	c3                   	ret    

0000042c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	56                   	push   %esi
 430:	53                   	push   %ebx
 431:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 434:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 43b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 43f:	74 17                	je     458 <printint+0x2c>
 441:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 445:	79 11                	jns    458 <printint+0x2c>
    neg = 1;
 447:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 44e:	8b 45 0c             	mov    0xc(%ebp),%eax
 451:	f7 d8                	neg    %eax
 453:	89 45 ec             	mov    %eax,-0x14(%ebp)
 456:	eb 06                	jmp    45e <printint+0x32>
  } else {
    x = xx;
 458:	8b 45 0c             	mov    0xc(%ebp),%eax
 45b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 45e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 465:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 468:	8d 41 01             	lea    0x1(%ecx),%eax
 46b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 46e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 471:	8b 45 ec             	mov    -0x14(%ebp),%eax
 474:	ba 00 00 00 00       	mov    $0x0,%edx
 479:	f7 f3                	div    %ebx
 47b:	89 d0                	mov    %edx,%eax
 47d:	0f b6 80 b0 0b 00 00 	movzbl 0xbb0(%eax),%eax
 484:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 488:	8b 75 10             	mov    0x10(%ebp),%esi
 48b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 48e:	ba 00 00 00 00       	mov    $0x0,%edx
 493:	f7 f6                	div    %esi
 495:	89 45 ec             	mov    %eax,-0x14(%ebp)
 498:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 49c:	75 c7                	jne    465 <printint+0x39>
  if(neg)
 49e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a2:	74 10                	je     4b4 <printint+0x88>
    buf[i++] = '-';
 4a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a7:	8d 50 01             	lea    0x1(%eax),%edx
 4aa:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ad:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4b2:	eb 1f                	jmp    4d3 <printint+0xa7>
 4b4:	eb 1d                	jmp    4d3 <printint+0xa7>
    putc(fd, buf[i]);
 4b6:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4bc:	01 d0                	add    %edx,%eax
 4be:	0f b6 00             	movzbl (%eax),%eax
 4c1:	0f be c0             	movsbl %al,%eax
 4c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
 4cb:	89 04 24             	mov    %eax,(%esp)
 4ce:	e8 31 ff ff ff       	call   404 <putc>
  while(--i >= 0)
 4d3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4db:	79 d9                	jns    4b6 <printint+0x8a>
}
 4dd:	83 c4 30             	add    $0x30,%esp
 4e0:	5b                   	pop    %ebx
 4e1:	5e                   	pop    %esi
 4e2:	5d                   	pop    %ebp
 4e3:	c3                   	ret    

000004e4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4ea:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4f1:	8d 45 0c             	lea    0xc(%ebp),%eax
 4f4:	83 c0 04             	add    $0x4,%eax
 4f7:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 501:	e9 7c 01 00 00       	jmp    682 <printf+0x19e>
    c = fmt[i] & 0xff;
 506:	8b 55 0c             	mov    0xc(%ebp),%edx
 509:	8b 45 f0             	mov    -0x10(%ebp),%eax
 50c:	01 d0                	add    %edx,%eax
 50e:	0f b6 00             	movzbl (%eax),%eax
 511:	0f be c0             	movsbl %al,%eax
 514:	25 ff 00 00 00       	and    $0xff,%eax
 519:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 51c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 520:	75 2c                	jne    54e <printf+0x6a>
      if(c == '%'){
 522:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 526:	75 0c                	jne    534 <printf+0x50>
        state = '%';
 528:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 52f:	e9 4a 01 00 00       	jmp    67e <printf+0x19a>
      } else {
        putc(fd, c);
 534:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 537:	0f be c0             	movsbl %al,%eax
 53a:	89 44 24 04          	mov    %eax,0x4(%esp)
 53e:	8b 45 08             	mov    0x8(%ebp),%eax
 541:	89 04 24             	mov    %eax,(%esp)
 544:	e8 bb fe ff ff       	call   404 <putc>
 549:	e9 30 01 00 00       	jmp    67e <printf+0x19a>
      }
    } else if(state == '%'){
 54e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 552:	0f 85 26 01 00 00    	jne    67e <printf+0x19a>
      if(c == 'd'){
 558:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 55c:	75 2d                	jne    58b <printf+0xa7>
        printint(fd, *ap, 10, 1);
 55e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 561:	8b 00                	mov    (%eax),%eax
 563:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 56a:	00 
 56b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 572:	00 
 573:	89 44 24 04          	mov    %eax,0x4(%esp)
 577:	8b 45 08             	mov    0x8(%ebp),%eax
 57a:	89 04 24             	mov    %eax,(%esp)
 57d:	e8 aa fe ff ff       	call   42c <printint>
        ap++;
 582:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 586:	e9 ec 00 00 00       	jmp    677 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 58b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 58f:	74 06                	je     597 <printf+0xb3>
 591:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 595:	75 2d                	jne    5c4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 597:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59a:	8b 00                	mov    (%eax),%eax
 59c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5a3:	00 
 5a4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5ab:	00 
 5ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	89 04 24             	mov    %eax,(%esp)
 5b6:	e8 71 fe ff ff       	call   42c <printint>
        ap++;
 5bb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5bf:	e9 b3 00 00 00       	jmp    677 <printf+0x193>
      } else if(c == 's'){
 5c4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5c8:	75 45                	jne    60f <printf+0x12b>
        s = (char*)*ap;
 5ca:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5cd:	8b 00                	mov    (%eax),%eax
 5cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5d2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5da:	75 09                	jne    5e5 <printf+0x101>
          s = "(null)";
 5dc:	c7 45 f4 64 09 00 00 	movl   $0x964,-0xc(%ebp)
        while(*s != 0){
 5e3:	eb 1e                	jmp    603 <printf+0x11f>
 5e5:	eb 1c                	jmp    603 <printf+0x11f>
          putc(fd, *s);
 5e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ea:	0f b6 00             	movzbl (%eax),%eax
 5ed:	0f be c0             	movsbl %al,%eax
 5f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f4:	8b 45 08             	mov    0x8(%ebp),%eax
 5f7:	89 04 24             	mov    %eax,(%esp)
 5fa:	e8 05 fe ff ff       	call   404 <putc>
          s++;
 5ff:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 603:	8b 45 f4             	mov    -0xc(%ebp),%eax
 606:	0f b6 00             	movzbl (%eax),%eax
 609:	84 c0                	test   %al,%al
 60b:	75 da                	jne    5e7 <printf+0x103>
 60d:	eb 68                	jmp    677 <printf+0x193>
        }
      } else if(c == 'c'){
 60f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 613:	75 1d                	jne    632 <printf+0x14e>
        putc(fd, *ap);
 615:	8b 45 e8             	mov    -0x18(%ebp),%eax
 618:	8b 00                	mov    (%eax),%eax
 61a:	0f be c0             	movsbl %al,%eax
 61d:	89 44 24 04          	mov    %eax,0x4(%esp)
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	89 04 24             	mov    %eax,(%esp)
 627:	e8 d8 fd ff ff       	call   404 <putc>
        ap++;
 62c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 630:	eb 45                	jmp    677 <printf+0x193>
      } else if(c == '%'){
 632:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 636:	75 17                	jne    64f <printf+0x16b>
        putc(fd, c);
 638:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63b:	0f be c0             	movsbl %al,%eax
 63e:	89 44 24 04          	mov    %eax,0x4(%esp)
 642:	8b 45 08             	mov    0x8(%ebp),%eax
 645:	89 04 24             	mov    %eax,(%esp)
 648:	e8 b7 fd ff ff       	call   404 <putc>
 64d:	eb 28                	jmp    677 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 64f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 656:	00 
 657:	8b 45 08             	mov    0x8(%ebp),%eax
 65a:	89 04 24             	mov    %eax,(%esp)
 65d:	e8 a2 fd ff ff       	call   404 <putc>
        putc(fd, c);
 662:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 665:	0f be c0             	movsbl %al,%eax
 668:	89 44 24 04          	mov    %eax,0x4(%esp)
 66c:	8b 45 08             	mov    0x8(%ebp),%eax
 66f:	89 04 24             	mov    %eax,(%esp)
 672:	e8 8d fd ff ff       	call   404 <putc>
      }
      state = 0;
 677:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 67e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 682:	8b 55 0c             	mov    0xc(%ebp),%edx
 685:	8b 45 f0             	mov    -0x10(%ebp),%eax
 688:	01 d0                	add    %edx,%eax
 68a:	0f b6 00             	movzbl (%eax),%eax
 68d:	84 c0                	test   %al,%al
 68f:	0f 85 71 fe ff ff    	jne    506 <printf+0x22>
    }
  }
}
 695:	c9                   	leave  
 696:	c3                   	ret    

00000697 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 697:	55                   	push   %ebp
 698:	89 e5                	mov    %esp,%ebp
 69a:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	83 e8 08             	sub    $0x8,%eax
 6a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a6:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 6ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ae:	eb 24                	jmp    6d4 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b3:	8b 00                	mov    (%eax),%eax
 6b5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6b8:	77 12                	ja     6cc <free+0x35>
 6ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c0:	77 24                	ja     6e6 <free+0x4f>
 6c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c5:	8b 00                	mov    (%eax),%eax
 6c7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ca:	77 1a                	ja     6e6 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cf:	8b 00                	mov    (%eax),%eax
 6d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6da:	76 d4                	jbe    6b0 <free+0x19>
 6dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6df:	8b 00                	mov    (%eax),%eax
 6e1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6e4:	76 ca                	jbe    6b0 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e9:	8b 40 04             	mov    0x4(%eax),%eax
 6ec:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f6:	01 c2                	add    %eax,%edx
 6f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fb:	8b 00                	mov    (%eax),%eax
 6fd:	39 c2                	cmp    %eax,%edx
 6ff:	75 24                	jne    725 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 701:	8b 45 f8             	mov    -0x8(%ebp),%eax
 704:	8b 50 04             	mov    0x4(%eax),%edx
 707:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70a:	8b 00                	mov    (%eax),%eax
 70c:	8b 40 04             	mov    0x4(%eax),%eax
 70f:	01 c2                	add    %eax,%edx
 711:	8b 45 f8             	mov    -0x8(%ebp),%eax
 714:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 717:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71a:	8b 00                	mov    (%eax),%eax
 71c:	8b 10                	mov    (%eax),%edx
 71e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 721:	89 10                	mov    %edx,(%eax)
 723:	eb 0a                	jmp    72f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 725:	8b 45 fc             	mov    -0x4(%ebp),%eax
 728:	8b 10                	mov    (%eax),%edx
 72a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 72f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 732:	8b 40 04             	mov    0x4(%eax),%eax
 735:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 73c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73f:	01 d0                	add    %edx,%eax
 741:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 744:	75 20                	jne    766 <free+0xcf>
    p->s.size += bp->s.size;
 746:	8b 45 fc             	mov    -0x4(%ebp),%eax
 749:	8b 50 04             	mov    0x4(%eax),%edx
 74c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74f:	8b 40 04             	mov    0x4(%eax),%eax
 752:	01 c2                	add    %eax,%edx
 754:	8b 45 fc             	mov    -0x4(%ebp),%eax
 757:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 75a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75d:	8b 10                	mov    (%eax),%edx
 75f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 762:	89 10                	mov    %edx,(%eax)
 764:	eb 08                	jmp    76e <free+0xd7>
  } else
    p->s.ptr = bp;
 766:	8b 45 fc             	mov    -0x4(%ebp),%eax
 769:	8b 55 f8             	mov    -0x8(%ebp),%edx
 76c:	89 10                	mov    %edx,(%eax)
  freep = p;
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	a3 cc 0b 00 00       	mov    %eax,0xbcc
}
 776:	c9                   	leave  
 777:	c3                   	ret    

00000778 <morecore>:

static Header*
morecore(uint nu)
{
 778:	55                   	push   %ebp
 779:	89 e5                	mov    %esp,%ebp
 77b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 77e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 785:	77 07                	ja     78e <morecore+0x16>
    nu = 4096;
 787:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 78e:	8b 45 08             	mov    0x8(%ebp),%eax
 791:	c1 e0 03             	shl    $0x3,%eax
 794:	89 04 24             	mov    %eax,(%esp)
 797:	e8 40 fc ff ff       	call   3dc <sbrk>
 79c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 79f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7a3:	75 07                	jne    7ac <morecore+0x34>
    return 0;
 7a5:	b8 00 00 00 00       	mov    $0x0,%eax
 7aa:	eb 22                	jmp    7ce <morecore+0x56>
  hp = (Header*)p;
 7ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7af:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b5:	8b 55 08             	mov    0x8(%ebp),%edx
 7b8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7be:	83 c0 08             	add    $0x8,%eax
 7c1:	89 04 24             	mov    %eax,(%esp)
 7c4:	e8 ce fe ff ff       	call   697 <free>
  return freep;
 7c9:	a1 cc 0b 00 00       	mov    0xbcc,%eax
}
 7ce:	c9                   	leave  
 7cf:	c3                   	ret    

000007d0 <malloc>:

void*
malloc(uint nbytes)
{
 7d0:	55                   	push   %ebp
 7d1:	89 e5                	mov    %esp,%ebp
 7d3:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d6:	8b 45 08             	mov    0x8(%ebp),%eax
 7d9:	83 c0 07             	add    $0x7,%eax
 7dc:	c1 e8 03             	shr    $0x3,%eax
 7df:	83 c0 01             	add    $0x1,%eax
 7e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7e5:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 7ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7f1:	75 23                	jne    816 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7f3:	c7 45 f0 c4 0b 00 00 	movl   $0xbc4,-0x10(%ebp)
 7fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fd:	a3 cc 0b 00 00       	mov    %eax,0xbcc
 802:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 807:	a3 c4 0b 00 00       	mov    %eax,0xbc4
    base.s.size = 0;
 80c:	c7 05 c8 0b 00 00 00 	movl   $0x0,0xbc8
 813:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 816:	8b 45 f0             	mov    -0x10(%ebp),%eax
 819:	8b 00                	mov    (%eax),%eax
 81b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 81e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 821:	8b 40 04             	mov    0x4(%eax),%eax
 824:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 827:	72 4d                	jb     876 <malloc+0xa6>
      if(p->s.size == nunits)
 829:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82c:	8b 40 04             	mov    0x4(%eax),%eax
 82f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 832:	75 0c                	jne    840 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 834:	8b 45 f4             	mov    -0xc(%ebp),%eax
 837:	8b 10                	mov    (%eax),%edx
 839:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83c:	89 10                	mov    %edx,(%eax)
 83e:	eb 26                	jmp    866 <malloc+0x96>
      else {
        p->s.size -= nunits;
 840:	8b 45 f4             	mov    -0xc(%ebp),%eax
 843:	8b 40 04             	mov    0x4(%eax),%eax
 846:	2b 45 ec             	sub    -0x14(%ebp),%eax
 849:	89 c2                	mov    %eax,%edx
 84b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 851:	8b 45 f4             	mov    -0xc(%ebp),%eax
 854:	8b 40 04             	mov    0x4(%eax),%eax
 857:	c1 e0 03             	shl    $0x3,%eax
 85a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 85d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 860:	8b 55 ec             	mov    -0x14(%ebp),%edx
 863:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 866:	8b 45 f0             	mov    -0x10(%ebp),%eax
 869:	a3 cc 0b 00 00       	mov    %eax,0xbcc
      return (void*)(p + 1);
 86e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 871:	83 c0 08             	add    $0x8,%eax
 874:	eb 38                	jmp    8ae <malloc+0xde>
    }
    if(p == freep)
 876:	a1 cc 0b 00 00       	mov    0xbcc,%eax
 87b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 87e:	75 1b                	jne    89b <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 880:	8b 45 ec             	mov    -0x14(%ebp),%eax
 883:	89 04 24             	mov    %eax,(%esp)
 886:	e8 ed fe ff ff       	call   778 <morecore>
 88b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 88e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 892:	75 07                	jne    89b <malloc+0xcb>
        return 0;
 894:	b8 00 00 00 00       	mov    $0x0,%eax
 899:	eb 13                	jmp    8ae <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 89b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a4:	8b 00                	mov    (%eax),%eax
 8a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8a9:	e9 70 ff ff ff       	jmp    81e <malloc+0x4e>
}
 8ae:	c9                   	leave  
 8af:	c3                   	ret    
