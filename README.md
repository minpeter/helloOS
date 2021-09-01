# helloOS
부팅을 하면 화면에 "hello world" 라고 출력해주는 프로그램   

<hr/>

## 부팅 방법

> sudo apt-get install nams 또는 운영체제에 맞는 nasm 설치

> 클론 후, helloOS폴더로 이동

> make (nasm를 이용하여 컴파일후 boot.bin 생성) or nasm -f bin -o boot.bin boot.asm   



### 방법 1

> usb에 직접 써서 부팅하기

> dd if=[boot.bin 경로] of=[usb 경로 ex./dev/sdb] bs=512 count 1

> 해당 usb로 부팅   

>

### 방법 2

> 가상머신으로 부팅

> sudo apt-get install qemu-system-x86_64 (qemu 설치)

> qemu-system-x86_64 boot.bin (가상머신 실행)   

>

### 방법 3 (2과 같지만 편리)

> make start   

<hr/>

usb가 없는 상황이나 시간면에서 2번째 방법으로 하는게 좋지만 (os에 입문한)감동을 느끼기에는 1번이 최고인듯하다
