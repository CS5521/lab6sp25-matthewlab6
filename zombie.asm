
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 75 02 00 00       	call   283 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 fd 02 00 00       	call   31b <sleep>
  exit();
  1e:	e8 68 02 00 00       	call   28b <exit>

00000023 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  23:	55                   	push   %ebp
  24:	89 e5                	mov    %esp,%ebp
  26:	57                   	push   %edi
  27:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2b:	8b 55 10             	mov    0x10(%ebp),%edx
  2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  31:	89 cb                	mov    %ecx,%ebx
  33:	89 df                	mov    %ebx,%edi
  35:	89 d1                	mov    %edx,%ecx
  37:	fc                   	cld    
  38:	f3 aa                	rep stos %al,%es:(%edi)
  3a:	89 ca                	mov    %ecx,%edx
  3c:	89 fb                	mov    %edi,%ebx
  3e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  41:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  44:	5b                   	pop    %ebx
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4e:	8b 45 08             	mov    0x8(%ebp),%eax
  51:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  54:	90                   	nop
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	8d 50 01             	lea    0x1(%eax),%edx
  5b:	89 55 08             	mov    %edx,0x8(%ebp)
  5e:	8b 55 0c             	mov    0xc(%ebp),%edx
  61:	8d 4a 01             	lea    0x1(%edx),%ecx
  64:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  67:	0f b6 12             	movzbl (%edx),%edx
  6a:	88 10                	mov    %dl,(%eax)
  6c:	0f b6 00             	movzbl (%eax),%eax
  6f:	84 c0                	test   %al,%al
  71:	75 e2                	jne    55 <strcpy+0xd>
    ;
  return os;
  73:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  76:	c9                   	leave  
  77:	c3                   	ret    

00000078 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  78:	55                   	push   %ebp
  79:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7b:	eb 08                	jmp    85 <strcmp+0xd>
    p++, q++;
  7d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  81:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	0f b6 00             	movzbl (%eax),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 10                	je     9f <strcmp+0x27>
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 10             	movzbl (%eax),%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	38 c2                	cmp    %al,%dl
  9d:	74 de                	je     7d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  9f:	8b 45 08             	mov    0x8(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	0f b6 d0             	movzbl %al,%edx
  a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  ab:	0f b6 00             	movzbl (%eax),%eax
  ae:	0f b6 c0             	movzbl %al,%eax
  b1:	29 c2                	sub    %eax,%edx
  b3:	89 d0                	mov    %edx,%eax
}
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    

000000b7 <strlen>:

uint
strlen(const char *s)
{
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c4:	eb 04                	jmp    ca <strlen+0x13>
  c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	01 d0                	add    %edx,%eax
  d2:	0f b6 00             	movzbl (%eax),%eax
  d5:	84 c0                	test   %al,%al
  d7:	75 ed                	jne    c6 <strlen+0xf>
    ;
  return n;
  d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dc:	c9                   	leave  
  dd:	c3                   	ret    

000000de <memset>:

void*
memset(void *dst, int c, uint n)
{
  de:	55                   	push   %ebp
  df:	89 e5                	mov    %esp,%ebp
  e1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e4:	8b 45 10             	mov    0x10(%ebp),%eax
  e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  f2:	8b 45 08             	mov    0x8(%ebp),%eax
  f5:	89 04 24             	mov    %eax,(%esp)
  f8:	e8 26 ff ff ff       	call   23 <stosb>
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	3a 45 fc             	cmp    -0x4(%ebp),%al
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 4c                	jmp    190 <gets+0x5b>
    cc = read(0, &c, 1);
 144:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14b:	00 
 14c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14f:	89 44 24 04          	mov    %eax,0x4(%esp)
 153:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15a:	e8 44 01 00 00       	call   2a3 <read>
 15f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 162:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 166:	7f 02                	jg     16a <gets+0x35>
      break;
 168:	eb 31                	jmp    19b <gets+0x66>
    buf[i++] = c;
 16a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16d:	8d 50 01             	lea    0x1(%eax),%edx
 170:	89 55 f4             	mov    %edx,-0xc(%ebp)
 173:	89 c2                	mov    %eax,%edx
 175:	8b 45 08             	mov    0x8(%ebp),%eax
 178:	01 c2                	add    %eax,%edx
 17a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 180:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 184:	3c 0a                	cmp    $0xa,%al
 186:	74 13                	je     19b <gets+0x66>
 188:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18c:	3c 0d                	cmp    $0xd,%al
 18e:	74 0b                	je     19b <gets+0x66>
  for(i=0; i+1 < max; ){
 190:	8b 45 f4             	mov    -0xc(%ebp),%eax
 193:	83 c0 01             	add    $0x1,%eax
 196:	3b 45 0c             	cmp    0xc(%ebp),%eax
 199:	7c a9                	jl     144 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 19b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19e:	8b 45 08             	mov    0x8(%ebp),%eax
 1a1:	01 d0                	add    %edx,%eax
 1a3:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a9:	c9                   	leave  
 1aa:	c3                   	ret    

000001ab <stat>:

int
stat(const char *n, struct stat *st)
{
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b8:	00 
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	89 04 24             	mov    %eax,(%esp)
 1bf:	e8 07 01 00 00       	call   2cb <open>
 1c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1cb:	79 07                	jns    1d4 <stat+0x29>
    return -1;
 1cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d2:	eb 23                	jmp    1f7 <stat+0x4c>
  r = fstat(fd, st);
 1d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1de:	89 04 24             	mov    %eax,(%esp)
 1e1:	e8 fd 00 00 00       	call   2e3 <fstat>
 1e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ec:	89 04 24             	mov    %eax,(%esp)
 1ef:	e8 bf 00 00 00       	call   2b3 <close>
  return r;
 1f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <atoi>:

int
atoi(const char *s)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 206:	eb 25                	jmp    22d <atoi+0x34>
    n = n*10 + *s++ - '0';
 208:	8b 55 fc             	mov    -0x4(%ebp),%edx
 20b:	89 d0                	mov    %edx,%eax
 20d:	c1 e0 02             	shl    $0x2,%eax
 210:	01 d0                	add    %edx,%eax
 212:	01 c0                	add    %eax,%eax
 214:	89 c1                	mov    %eax,%ecx
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	8d 50 01             	lea    0x1(%eax),%edx
 21c:	89 55 08             	mov    %edx,0x8(%ebp)
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	0f be c0             	movsbl %al,%eax
 225:	01 c8                	add    %ecx,%eax
 227:	83 e8 30             	sub    $0x30,%eax
 22a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 22d:	8b 45 08             	mov    0x8(%ebp),%eax
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	3c 2f                	cmp    $0x2f,%al
 235:	7e 0a                	jle    241 <atoi+0x48>
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	3c 39                	cmp    $0x39,%al
 23f:	7e c7                	jle    208 <atoi+0xf>
  return n;
 241:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
 249:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 252:	8b 45 0c             	mov    0xc(%ebp),%eax
 255:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 258:	eb 17                	jmp    271 <memmove+0x2b>
    *dst++ = *src++;
 25a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 fc             	mov    %edx,-0x4(%ebp)
 263:	8b 55 f8             	mov    -0x8(%ebp),%edx
 266:	8d 4a 01             	lea    0x1(%edx),%ecx
 269:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 26c:	0f b6 12             	movzbl (%edx),%edx
 26f:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 271:	8b 45 10             	mov    0x10(%ebp),%eax
 274:	8d 50 ff             	lea    -0x1(%eax),%edx
 277:	89 55 10             	mov    %edx,0x10(%ebp)
 27a:	85 c0                	test   %eax,%eax
 27c:	7f dc                	jg     25a <memmove+0x14>
  return vdst;
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 283:	b8 01 00 00 00       	mov    $0x1,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <exit>:
SYSCALL(exit)
 28b:	b8 02 00 00 00       	mov    $0x2,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <wait>:
SYSCALL(wait)
 293:	b8 03 00 00 00       	mov    $0x3,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <pipe>:
SYSCALL(pipe)
 29b:	b8 04 00 00 00       	mov    $0x4,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <read>:
SYSCALL(read)
 2a3:	b8 05 00 00 00       	mov    $0x5,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <write>:
SYSCALL(write)
 2ab:	b8 10 00 00 00       	mov    $0x10,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <close>:
SYSCALL(close)
 2b3:	b8 15 00 00 00       	mov    $0x15,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <kill>:
SYSCALL(kill)
 2bb:	b8 06 00 00 00       	mov    $0x6,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <exec>:
SYSCALL(exec)
 2c3:	b8 07 00 00 00       	mov    $0x7,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <open>:
SYSCALL(open)
 2cb:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <mknod>:
SYSCALL(mknod)
 2d3:	b8 11 00 00 00       	mov    $0x11,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <unlink>:
SYSCALL(unlink)
 2db:	b8 12 00 00 00       	mov    $0x12,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <fstat>:
SYSCALL(fstat)
 2e3:	b8 08 00 00 00       	mov    $0x8,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <link>:
SYSCALL(link)
 2eb:	b8 13 00 00 00       	mov    $0x13,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <mkdir>:
SYSCALL(mkdir)
 2f3:	b8 14 00 00 00       	mov    $0x14,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <chdir>:
SYSCALL(chdir)
 2fb:	b8 09 00 00 00       	mov    $0x9,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <dup>:
SYSCALL(dup)
 303:	b8 0a 00 00 00       	mov    $0xa,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <getpid>:
SYSCALL(getpid)
 30b:	b8 0b 00 00 00       	mov    $0xb,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sbrk>:
SYSCALL(sbrk)
 313:	b8 0c 00 00 00       	mov    $0xc,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <sleep>:
SYSCALL(sleep)
 31b:	b8 0d 00 00 00       	mov    $0xd,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <uptime>:
SYSCALL(uptime)
 323:	b8 0e 00 00 00       	mov    $0xe,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <hw>:
SYSCALL(hw)
 32b:	b8 16 00 00 00       	mov    $0x16,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <fkc>:
SYSCALL(fkc)
 333:	b8 17 00 00 00       	mov    $0x17,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	83 ec 18             	sub    $0x18,%esp
 341:	8b 45 0c             	mov    0xc(%ebp),%eax
 344:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 347:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 34e:	00 
 34f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 352:	89 44 24 04          	mov    %eax,0x4(%esp)
 356:	8b 45 08             	mov    0x8(%ebp),%eax
 359:	89 04 24             	mov    %eax,(%esp)
 35c:	e8 4a ff ff ff       	call   2ab <write>
}
 361:	c9                   	leave  
 362:	c3                   	ret    

00000363 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 363:	55                   	push   %ebp
 364:	89 e5                	mov    %esp,%ebp
 366:	56                   	push   %esi
 367:	53                   	push   %ebx
 368:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 36b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 372:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 376:	74 17                	je     38f <printint+0x2c>
 378:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 37c:	79 11                	jns    38f <printint+0x2c>
    neg = 1;
 37e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 385:	8b 45 0c             	mov    0xc(%ebp),%eax
 388:	f7 d8                	neg    %eax
 38a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 38d:	eb 06                	jmp    395 <printint+0x32>
  } else {
    x = xx;
 38f:	8b 45 0c             	mov    0xc(%ebp),%eax
 392:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 395:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 39c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 39f:	8d 41 01             	lea    0x1(%ecx),%eax
 3a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3a5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ab:	ba 00 00 00 00       	mov    $0x0,%edx
 3b0:	f7 f3                	div    %ebx
 3b2:	89 d0                	mov    %edx,%eax
 3b4:	0f b6 80 34 0a 00 00 	movzbl 0xa34(%eax),%eax
 3bb:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3bf:	8b 75 10             	mov    0x10(%ebp),%esi
 3c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3c5:	ba 00 00 00 00       	mov    $0x0,%edx
 3ca:	f7 f6                	div    %esi
 3cc:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3cf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3d3:	75 c7                	jne    39c <printint+0x39>
  if(neg)
 3d5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3d9:	74 10                	je     3eb <printint+0x88>
    buf[i++] = '-';
 3db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3de:	8d 50 01             	lea    0x1(%eax),%edx
 3e1:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3e4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 3e9:	eb 1f                	jmp    40a <printint+0xa7>
 3eb:	eb 1d                	jmp    40a <printint+0xa7>
    putc(fd, buf[i]);
 3ed:	8d 55 dc             	lea    -0x24(%ebp),%edx
 3f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f3:	01 d0                	add    %edx,%eax
 3f5:	0f b6 00             	movzbl (%eax),%eax
 3f8:	0f be c0             	movsbl %al,%eax
 3fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ff:	8b 45 08             	mov    0x8(%ebp),%eax
 402:	89 04 24             	mov    %eax,(%esp)
 405:	e8 31 ff ff ff       	call   33b <putc>
  while(--i >= 0)
 40a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 40e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 412:	79 d9                	jns    3ed <printint+0x8a>
}
 414:	83 c4 30             	add    $0x30,%esp
 417:	5b                   	pop    %ebx
 418:	5e                   	pop    %esi
 419:	5d                   	pop    %ebp
 41a:	c3                   	ret    

0000041b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 41b:	55                   	push   %ebp
 41c:	89 e5                	mov    %esp,%ebp
 41e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 421:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 428:	8d 45 0c             	lea    0xc(%ebp),%eax
 42b:	83 c0 04             	add    $0x4,%eax
 42e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 431:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 438:	e9 7c 01 00 00       	jmp    5b9 <printf+0x19e>
    c = fmt[i] & 0xff;
 43d:	8b 55 0c             	mov    0xc(%ebp),%edx
 440:	8b 45 f0             	mov    -0x10(%ebp),%eax
 443:	01 d0                	add    %edx,%eax
 445:	0f b6 00             	movzbl (%eax),%eax
 448:	0f be c0             	movsbl %al,%eax
 44b:	25 ff 00 00 00       	and    $0xff,%eax
 450:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 453:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 457:	75 2c                	jne    485 <printf+0x6a>
      if(c == '%'){
 459:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 45d:	75 0c                	jne    46b <printf+0x50>
        state = '%';
 45f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 466:	e9 4a 01 00 00       	jmp    5b5 <printf+0x19a>
      } else {
        putc(fd, c);
 46b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 46e:	0f be c0             	movsbl %al,%eax
 471:	89 44 24 04          	mov    %eax,0x4(%esp)
 475:	8b 45 08             	mov    0x8(%ebp),%eax
 478:	89 04 24             	mov    %eax,(%esp)
 47b:	e8 bb fe ff ff       	call   33b <putc>
 480:	e9 30 01 00 00       	jmp    5b5 <printf+0x19a>
      }
    } else if(state == '%'){
 485:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 489:	0f 85 26 01 00 00    	jne    5b5 <printf+0x19a>
      if(c == 'd'){
 48f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 493:	75 2d                	jne    4c2 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 495:	8b 45 e8             	mov    -0x18(%ebp),%eax
 498:	8b 00                	mov    (%eax),%eax
 49a:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4a1:	00 
 4a2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4a9:	00 
 4aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ae:	8b 45 08             	mov    0x8(%ebp),%eax
 4b1:	89 04 24             	mov    %eax,(%esp)
 4b4:	e8 aa fe ff ff       	call   363 <printint>
        ap++;
 4b9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4bd:	e9 ec 00 00 00       	jmp    5ae <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4c2:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4c6:	74 06                	je     4ce <printf+0xb3>
 4c8:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4cc:	75 2d                	jne    4fb <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4d1:	8b 00                	mov    (%eax),%eax
 4d3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4da:	00 
 4db:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4e2:	00 
 4e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ea:	89 04 24             	mov    %eax,(%esp)
 4ed:	e8 71 fe ff ff       	call   363 <printint>
        ap++;
 4f2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4f6:	e9 b3 00 00 00       	jmp    5ae <printf+0x193>
      } else if(c == 's'){
 4fb:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 4ff:	75 45                	jne    546 <printf+0x12b>
        s = (char*)*ap;
 501:	8b 45 e8             	mov    -0x18(%ebp),%eax
 504:	8b 00                	mov    (%eax),%eax
 506:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 509:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 50d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 511:	75 09                	jne    51c <printf+0x101>
          s = "(null)";
 513:	c7 45 f4 e7 07 00 00 	movl   $0x7e7,-0xc(%ebp)
        while(*s != 0){
 51a:	eb 1e                	jmp    53a <printf+0x11f>
 51c:	eb 1c                	jmp    53a <printf+0x11f>
          putc(fd, *s);
 51e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 521:	0f b6 00             	movzbl (%eax),%eax
 524:	0f be c0             	movsbl %al,%eax
 527:	89 44 24 04          	mov    %eax,0x4(%esp)
 52b:	8b 45 08             	mov    0x8(%ebp),%eax
 52e:	89 04 24             	mov    %eax,(%esp)
 531:	e8 05 fe ff ff       	call   33b <putc>
          s++;
 536:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 53a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53d:	0f b6 00             	movzbl (%eax),%eax
 540:	84 c0                	test   %al,%al
 542:	75 da                	jne    51e <printf+0x103>
 544:	eb 68                	jmp    5ae <printf+0x193>
        }
      } else if(c == 'c'){
 546:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 54a:	75 1d                	jne    569 <printf+0x14e>
        putc(fd, *ap);
 54c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 54f:	8b 00                	mov    (%eax),%eax
 551:	0f be c0             	movsbl %al,%eax
 554:	89 44 24 04          	mov    %eax,0x4(%esp)
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	89 04 24             	mov    %eax,(%esp)
 55e:	e8 d8 fd ff ff       	call   33b <putc>
        ap++;
 563:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 567:	eb 45                	jmp    5ae <printf+0x193>
      } else if(c == '%'){
 569:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 56d:	75 17                	jne    586 <printf+0x16b>
        putc(fd, c);
 56f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 572:	0f be c0             	movsbl %al,%eax
 575:	89 44 24 04          	mov    %eax,0x4(%esp)
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	89 04 24             	mov    %eax,(%esp)
 57f:	e8 b7 fd ff ff       	call   33b <putc>
 584:	eb 28                	jmp    5ae <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 586:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 58d:	00 
 58e:	8b 45 08             	mov    0x8(%ebp),%eax
 591:	89 04 24             	mov    %eax,(%esp)
 594:	e8 a2 fd ff ff       	call   33b <putc>
        putc(fd, c);
 599:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 59c:	0f be c0             	movsbl %al,%eax
 59f:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a3:	8b 45 08             	mov    0x8(%ebp),%eax
 5a6:	89 04 24             	mov    %eax,(%esp)
 5a9:	e8 8d fd ff ff       	call   33b <putc>
      }
      state = 0;
 5ae:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5b5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5b9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5bf:	01 d0                	add    %edx,%eax
 5c1:	0f b6 00             	movzbl (%eax),%eax
 5c4:	84 c0                	test   %al,%al
 5c6:	0f 85 71 fe ff ff    	jne    43d <printf+0x22>
    }
  }
}
 5cc:	c9                   	leave  
 5cd:	c3                   	ret    

000005ce <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5ce:	55                   	push   %ebp
 5cf:	89 e5                	mov    %esp,%ebp
 5d1:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5d4:	8b 45 08             	mov    0x8(%ebp),%eax
 5d7:	83 e8 08             	sub    $0x8,%eax
 5da:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5dd:	a1 50 0a 00 00       	mov    0xa50,%eax
 5e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5e5:	eb 24                	jmp    60b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ea:	8b 00                	mov    (%eax),%eax
 5ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5ef:	77 12                	ja     603 <free+0x35>
 5f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f7:	77 24                	ja     61d <free+0x4f>
 5f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fc:	8b 00                	mov    (%eax),%eax
 5fe:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 601:	77 1a                	ja     61d <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 603:	8b 45 fc             	mov    -0x4(%ebp),%eax
 606:	8b 00                	mov    (%eax),%eax
 608:	89 45 fc             	mov    %eax,-0x4(%ebp)
 60b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 611:	76 d4                	jbe    5e7 <free+0x19>
 613:	8b 45 fc             	mov    -0x4(%ebp),%eax
 616:	8b 00                	mov    (%eax),%eax
 618:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 61b:	76 ca                	jbe    5e7 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 61d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 620:	8b 40 04             	mov    0x4(%eax),%eax
 623:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 62a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62d:	01 c2                	add    %eax,%edx
 62f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 632:	8b 00                	mov    (%eax),%eax
 634:	39 c2                	cmp    %eax,%edx
 636:	75 24                	jne    65c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 638:	8b 45 f8             	mov    -0x8(%ebp),%eax
 63b:	8b 50 04             	mov    0x4(%eax),%edx
 63e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 641:	8b 00                	mov    (%eax),%eax
 643:	8b 40 04             	mov    0x4(%eax),%eax
 646:	01 c2                	add    %eax,%edx
 648:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 64e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 651:	8b 00                	mov    (%eax),%eax
 653:	8b 10                	mov    (%eax),%edx
 655:	8b 45 f8             	mov    -0x8(%ebp),%eax
 658:	89 10                	mov    %edx,(%eax)
 65a:	eb 0a                	jmp    666 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 65c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65f:	8b 10                	mov    (%eax),%edx
 661:	8b 45 f8             	mov    -0x8(%ebp),%eax
 664:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 666:	8b 45 fc             	mov    -0x4(%ebp),%eax
 669:	8b 40 04             	mov    0x4(%eax),%eax
 66c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 673:	8b 45 fc             	mov    -0x4(%ebp),%eax
 676:	01 d0                	add    %edx,%eax
 678:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 67b:	75 20                	jne    69d <free+0xcf>
    p->s.size += bp->s.size;
 67d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 680:	8b 50 04             	mov    0x4(%eax),%edx
 683:	8b 45 f8             	mov    -0x8(%ebp),%eax
 686:	8b 40 04             	mov    0x4(%eax),%eax
 689:	01 c2                	add    %eax,%edx
 68b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 691:	8b 45 f8             	mov    -0x8(%ebp),%eax
 694:	8b 10                	mov    (%eax),%edx
 696:	8b 45 fc             	mov    -0x4(%ebp),%eax
 699:	89 10                	mov    %edx,(%eax)
 69b:	eb 08                	jmp    6a5 <free+0xd7>
  } else
    p->s.ptr = bp;
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6a3:	89 10                	mov    %edx,(%eax)
  freep = p;
 6a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a8:	a3 50 0a 00 00       	mov    %eax,0xa50
}
 6ad:	c9                   	leave  
 6ae:	c3                   	ret    

000006af <morecore>:

static Header*
morecore(uint nu)
{
 6af:	55                   	push   %ebp
 6b0:	89 e5                	mov    %esp,%ebp
 6b2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6b5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6bc:	77 07                	ja     6c5 <morecore+0x16>
    nu = 4096;
 6be:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	c1 e0 03             	shl    $0x3,%eax
 6cb:	89 04 24             	mov    %eax,(%esp)
 6ce:	e8 40 fc ff ff       	call   313 <sbrk>
 6d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6d6:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6da:	75 07                	jne    6e3 <morecore+0x34>
    return 0;
 6dc:	b8 00 00 00 00       	mov    $0x0,%eax
 6e1:	eb 22                	jmp    705 <morecore+0x56>
  hp = (Header*)p;
 6e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 6e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ec:	8b 55 08             	mov    0x8(%ebp),%edx
 6ef:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6f5:	83 c0 08             	add    $0x8,%eax
 6f8:	89 04 24             	mov    %eax,(%esp)
 6fb:	e8 ce fe ff ff       	call   5ce <free>
  return freep;
 700:	a1 50 0a 00 00       	mov    0xa50,%eax
}
 705:	c9                   	leave  
 706:	c3                   	ret    

00000707 <malloc>:

void*
malloc(uint nbytes)
{
 707:	55                   	push   %ebp
 708:	89 e5                	mov    %esp,%ebp
 70a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	83 c0 07             	add    $0x7,%eax
 713:	c1 e8 03             	shr    $0x3,%eax
 716:	83 c0 01             	add    $0x1,%eax
 719:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 71c:	a1 50 0a 00 00       	mov    0xa50,%eax
 721:	89 45 f0             	mov    %eax,-0x10(%ebp)
 724:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 728:	75 23                	jne    74d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 72a:	c7 45 f0 48 0a 00 00 	movl   $0xa48,-0x10(%ebp)
 731:	8b 45 f0             	mov    -0x10(%ebp),%eax
 734:	a3 50 0a 00 00       	mov    %eax,0xa50
 739:	a1 50 0a 00 00       	mov    0xa50,%eax
 73e:	a3 48 0a 00 00       	mov    %eax,0xa48
    base.s.size = 0;
 743:	c7 05 4c 0a 00 00 00 	movl   $0x0,0xa4c
 74a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 750:	8b 00                	mov    (%eax),%eax
 752:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 755:	8b 45 f4             	mov    -0xc(%ebp),%eax
 758:	8b 40 04             	mov    0x4(%eax),%eax
 75b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 75e:	72 4d                	jb     7ad <malloc+0xa6>
      if(p->s.size == nunits)
 760:	8b 45 f4             	mov    -0xc(%ebp),%eax
 763:	8b 40 04             	mov    0x4(%eax),%eax
 766:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 769:	75 0c                	jne    777 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 76b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76e:	8b 10                	mov    (%eax),%edx
 770:	8b 45 f0             	mov    -0x10(%ebp),%eax
 773:	89 10                	mov    %edx,(%eax)
 775:	eb 26                	jmp    79d <malloc+0x96>
      else {
        p->s.size -= nunits;
 777:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77a:	8b 40 04             	mov    0x4(%eax),%eax
 77d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 780:	89 c2                	mov    %eax,%edx
 782:	8b 45 f4             	mov    -0xc(%ebp),%eax
 785:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 788:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78b:	8b 40 04             	mov    0x4(%eax),%eax
 78e:	c1 e0 03             	shl    $0x3,%eax
 791:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 794:	8b 45 f4             	mov    -0xc(%ebp),%eax
 797:	8b 55 ec             	mov    -0x14(%ebp),%edx
 79a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 79d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a0:	a3 50 0a 00 00       	mov    %eax,0xa50
      return (void*)(p + 1);
 7a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a8:	83 c0 08             	add    $0x8,%eax
 7ab:	eb 38                	jmp    7e5 <malloc+0xde>
    }
    if(p == freep)
 7ad:	a1 50 0a 00 00       	mov    0xa50,%eax
 7b2:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7b5:	75 1b                	jne    7d2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ba:	89 04 24             	mov    %eax,(%esp)
 7bd:	e8 ed fe ff ff       	call   6af <morecore>
 7c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7c5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7c9:	75 07                	jne    7d2 <malloc+0xcb>
        return 0;
 7cb:	b8 00 00 00 00       	mov    $0x0,%eax
 7d0:	eb 13                	jmp    7e5 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7db:	8b 00                	mov    (%eax),%eax
 7dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 7e0:	e9 70 ff ff ff       	jmp    755 <malloc+0x4e>
}
 7e5:	c9                   	leave  
 7e6:	c3                   	ret    
