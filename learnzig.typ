#import "article.typ":*

#show: article.with(title: "zig参考示例", authors: ("卓能文",))

= 运行外部程序

#code(lang: "zig", raw(read("src/childprocess.run.zig"), lang: "zig"))

= v程序交叉编译
如下面`hello.v`程序：
#code(lang: "v", raw(read("src/hello.v"), lang: "v"))

```sh
# 编译到c语言
v -o hello.c -autofree hello.v
```

```sh
# native编译
zig build-exe hello.c -lc
```

```sh
# 编译到x86_64-linux
zig build-exe hello.c -lc -target x86_64-linux
```
或
```sh
zig cc hello.c -lc -target x86_64-linux
```
或
```sh
zig cc hello.c -lc -target x86_64-macos
```

```sh
# 编译到x86_64-windows
zig build-exe hello.c -lc -target x86_64-windows
```

程序出错：
```
hello.c:787:9: error: unknown type name 'pthread_t'
typedef pthread_t __v_thread;
        ^
```